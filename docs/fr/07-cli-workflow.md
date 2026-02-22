# Workflow CLI — ADD pour les outils CLI agentiques

## Vue d'ensemble

ADD a été conçu avec un usage CLI-first en tête. Des outils comme Claude Code, Cursor, GitHub Copilot Workspace et Aider opèrent dans le terminal — pas dans une interface graphique. Cela change la façon dont les artefacts sont créés, stockés et référencés.

Ce document définit la structure projet standard, les conventions de fichiers et les patterns de workflow pour pratiquer ADD dans un environnement CLI.

---

## Structure Projet

Tout projet pratiquant ADD inclut un répertoire `.add/` à la racine :

```
mon-projet/
├── src/
├── tests/
├── .add/                          # Racine des artefacts ADD
│   ├── briefs/                    # Briefs Agent
│   │   ├── 001-refacto-auth.md
│   │   └── 002-pagination-api.md
│   ├── context/                   # Packs de Contexte
│   │   ├── 001-refacto-auth.md
│   │   └── 002-pagination-api.md
│   ├── constraints/               # Fiches de Contraintes
│   │   ├── 001-refacto-auth.md
│   │   └── 002-pagination-api.md
│   ├── executions/                # Logs d'Exécution
│   │   ├── 001-refacto-auth.md
│   │   └── 002-pagination-api.md
│   ├── validations/               # Checklists de Validation
│   │   ├── 001-refacto-auth.md
│   │   └── 002-pagination-api.md
│   ├── reviews/                   # Revues d'Échec
│   │   └── 001-refacto-auth-r1.md
│   ├── metrics/                   # Métriques agrégées
│   │   └── 2025-01-resume.md
│   └── templates/                 # Templates spécifiques au projet
│       └── (surcharge ou étend les templates globaux)
├── .gitignore
└── README.md
```

### Convention de nommage

Tous les artefacts d'une même tâche partagent un préfixe numérique :

```
briefs/001-refacto-auth.md
context/001-refacto-auth.md
constraints/001-refacto-auth.md
executions/001-refacto-auth.md
validations/001-refacto-auth.md
```

Les Revues d'Échec ajoutent un suffixe d'itération : `reviews/001-refacto-auth-r1.md`, `reviews/001-refacto-auth-r2.md`.

### Intégration Git

Les artefacts ADD **doivent être commités avec le code**. Ils font partie de l'historique d'ingénierie du projet.

---

## Workflow : Un cycle CLI complet

Voici un cycle ADD complet tel que pratiqué dans un environnement CLI (avec Claude Code comme exemple) :

### Étape 1 : CADRER — Créer le Brief

```bash
cp .add/templates/agent-brief.md .add/briefs/003-recherche-users.md
$EDITOR .add/briefs/003-recherche-users.md
```

Remplissez : intention, non-objectifs, format de sortie, critères de succès.

### Étape 2 : CONTEXTUALISER — Assembler le Contexte

```bash
cp .add/templates/context-pack.md .add/context/003-recherche-users.md
$EDITOR .add/context/003-recherche-users.md
```

Référencez les fichiers spécifiques, les règles métier et les décisions antérieures.

### Étape 3 : CONTRAINDRE — Définir les Contraintes

```bash
cp .add/templates/constraint-sheet.md .add/constraints/003-recherche-users.md
$EDITOR .add/constraints/003-recherche-users.md
```

Rédigez les critères d'acceptation testables, les actions interdites, les exigences de format.

### Étape 4 : EXÉCUTER — Lancer l'Agent

Composez votre prompt à partir des trois artefacts :

```bash
# Option A : Référencer les fichiers dans votre prompt
claude "Implémente la recherche utilisateurs. Voir .add/briefs/003-recherche-users.md
pour le périmètre, .add/context/003-recherche-users.md pour le contexte, et
.add/constraints/003-recherche-users.md pour les contraintes."

# Option B : Concaténer en un seul prompt
cat .add/briefs/003-recherche-users.md \
    .add/context/003-recherche-users.md \
    .add/constraints/003-recherche-users.md | claude

# Option C : Utiliser le mécanisme de contexte natif de votre agent
# (ex. : CLAUDE.md, .cursorrules, etc.)
```

### Étape 5 : VÉRIFIER — Valider la Sortie

```bash
cp .add/templates/validation-checklist.md .add/validations/003-recherche-users.md
$EDITOR .add/validations/003-recherche-users.md
```

Parcourez chaque critère d'acceptation. Lancez les vérifications automatiques :

```bash
npm run lint && npm run typecheck && npm test && npm run build
```

**Si FAIL** : Créez une Revue d'Échec et rebouclez.

```bash
cp .add/templates/failure-review.md .add/reviews/003-recherche-users-r1.md
$EDITOR .add/reviews/003-recherche-users-r1.md
```

### Étape 6 : CONSOLIDER — Commiter et Apprendre

```bash
$EDITOR .add/executions/003-recherche-users.md
# Enregistrez : statut final, nombre d'itérations, durée, notes

git add src/ tests/ .add/
git commit -m "feat: recherche utilisateurs [ADD-003]"
```

---

## Prévention de la Dérive Contextuelle

La dérive contextuelle est la perte progressive de cohérence pendant les sessions agent longues. En environnement CLI, c'est le mode d'échec le plus courant.

### Stratégies

**1. Une tâche, une session.**
Démarrez une nouvelle session agent pour chaque cycle ADD. Ne transportez pas l'historique de conversation d'une tâche à l'autre.

**2. Points de contrôle de reset du contexte.**
Pour les tâches multi-étapes, ré-injectez périodiquement le Pack de Contexte complet. Ne comptez pas sur la mémoire conversationnelle de l'agent.

**3. Suivi d'état explicite.**
Après chaque action significative de l'agent, résumez l'état courant dans un format structuré. Fournissez ce résumé comme contexte pour l'étape suivante.

**4. Limites de durée de session.**
Fixez une durée maximale de session (ex. : 30 minutes ou 20 échanges). Une fois atteinte, consolidez la progression, sauvegardez l'état, et démarrez une nouvelle session.

---

## Gestion de la Mémoire

### Court terme (Session)

- Utilisez le mécanisme de contexte natif de l'agent (CLAUDE.md, .cursorrules, prompt système).
- Placez le contexte le plus important en premier. Les agents pondèrent davantage le contexte initial.
- Élaguez le contexte non pertinent entre les itérations.

### Moyen terme (Tâche)

- Le répertoire `.add/` est la mémoire au niveau de la tâche.
- Les artefacts persistent entre les sessions et peuvent être rechargés.
- Les Logs d'Exécution assurent la continuité entre les sessions.

### Long terme (Projet)

- La bibliothèque de templates évolue en fonction des Revues d'Échec.
- Le répertoire metrics suit les tendances dans le temps.
- L'historique Git fournit une piste d'audit complète.

---

## Versionnement des Prompts

Les prompts efficaces doivent être versionnés et réutilisés :

```
.add/templates/
├── agent-brief.md           # Template standard
├── context-pack.md
├── prompts/                  # Patterns de prompts éprouvés
│   ├── refactorer-module.md
│   ├── ajouter-feature.md
│   ├── corriger-bug.md
│   ├── ecrire-tests.md
│   └── revoir-code.md
```

Chaque template de prompt inclut :
- Le texte du prompt avec des `{{placeholders}}`.
- Des notes d'utilisation (quand l'utiliser, limitations connues).
- Un historique de versions.

---

→ Suite : [Anti-Patterns](08-anti-patterns.md)
