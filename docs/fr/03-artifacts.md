# Artefacts ADD

## Vue d'ensemble

ADD définit six artefacts standards. Chaque artefact remplit un rôle spécifique dans le cycle, assure la traçabilité et permet la reproductibilité.

Les artefacts ne sont pas de la bureaucratie — ce sont la **mémoire d'ingénierie** du travail assisté par agent. Sans eux, chaque interaction est un événement isolé qui ne peut être ni audité, ni reproduit, ni amélioré.

---

## 1. Brief Agent

**Créé en** : phase CADRER
**Objectif** : Définir ce que l'agent doit faire, pour qui, et dans quelles limites.

### Contenu

| Champ | Description |
|---|---|
| **ID de tâche** | Identifiant unique (ex. : `ADD-2024-0042`) |
| **Intention** | Déclaration en une phrase de ce que l'agent doit produire |
| **Non-objectifs** | Liste explicite de ce qui est hors périmètre |
| **Format de sortie** | Format attendu du livrable (fichier code, markdown, JSON, etc.) |
| **Critères de succès** | Comment un humain saura que la tâche a réussi |
| **Complexité** | Une passe / Multi-étapes / Multi-cycles |
| **Dépendances** | Autres tâches, fichiers ou systèmes dont celle-ci dépend |

### Signaux de qualité

Un bon Brief Agent est :
- **Vérifiable** : Un tiers pourrait évaluer le succès à partir du brief seul.
- **Borné** : Les non-objectifs sont aussi clairs que les objectifs.
- **Atomique** : Il décrit une tâche, pas un projet.

→ Template : [`templates/agent-brief.md`](../../templates/agent-brief.md)

---

## 2. Pack de Contexte

**Créé en** : phase CONTEXTUALISER
**Objectif** : Assembler toutes les connaissances nécessaires à l'agent pour réaliser la tâche.

### Contenu

| Champ | Description |
|---|---|
| **Fichiers pertinents** | Liste de fichiers avec chemins et brève description de leur rôle |
| **Règles métier** | Logique business, conventions de nommage, patterns architecturaux |
| **Contraintes techniques** | Stack, versions, APIs, spécificités d'environnement |
| **Décisions antérieures** | Ce qui a déjà été tenté, rejeté ou décidé — et pourquoi |
| **Exemples de référence** | Exemples du style ou de la structure de sortie souhaités |

### Signaux de qualité

Un bon Pack de Contexte est :
- **Curé** : Uniquement l'information pertinente, pas de bruit.
- **Non contradictoire** : Pas de règles ou d'exemples conflictuels.
- **Auto-suffisant** : L'agent ne devrait pas avoir besoin de demander plus d'informations.

→ Template : [`templates/context-pack.md`](../../templates/context-pack.md)

---

## 3. Fiche de Contraintes

**Créée en** : phase CONTRAINDRE
**Objectif** : Encoder chaque règle, frontière et critère d'acceptation que l'agent doit respecter.

### Contenu

| Champ | Description |
|---|---|
| **Contraintes de format** | Structure de fichiers, nommage, style de code, format de sortie |
| **Contraintes comportementales** | Ce que la sortie doit faire et ne doit pas faire |
| **Contraintes de qualité** | Objectifs de performance, gestion d'erreurs, cas limites |
| **Critères d'acceptation** | Conditions spécifiques et testables pass/fail |
| **Actions interdites** | Ce que l'agent ne doit jamais faire |

### Signaux de qualité

Une bonne Fiche de Contraintes est :
- **Testable** : Chaque contrainte peut être vérifiée comme vraie ou fausse.
- **Complète** : Pas de contraintes implicites — tout est écrit.
- **Non contradictoire** : Aucune contrainte ne contredit une autre.

→ Template : [`templates/constraint-sheet.md`](../../templates/constraint-sheet.md)

---

## 4. Checklist de Validation

**Créée en** : phase VÉRIFIER
**Objectif** : Vérifier systématiquement la sortie de l'agent contre toutes les contraintes et critères.

### Contenu

| Champ | Description |
|---|---|
| **Critères d'acceptation** | Chaque critère de la Fiche de Contraintes avec statut PASS/FAIL |
| **Vérification d'hallucinations** | L'agent a-t-il inventé des données, fichiers, APIs ou dépendances ? |
| **Vérification de périmètre** | L'agent est-il resté dans le périmètre défini ? |
| **Vérification d'échecs silencieux** | La sortie contient-elle des erreurs subtiles non détectées par les outils automatiques ? |
| **Vérifications automatiques** | Résultats du linting, vérification de types, tests, builds |
| **Verdict global** | PASS / FAIL (binaire — un pass partiel est un fail) |

### Signaux de qualité

Une bonne Checklist de Validation est :
- **Exhaustive** : Chaque critère est vérifié, aucun n'est ignoré.
- **Binaire** : Pas de "peut-être" ou "presque" — pass ou fail.
- **Documentée** : Les échecs incluent des détails spécifiques, pas juste "FAIL."

→ Template : [`templates/validation-checklist.md`](../../templates/validation-checklist.md)

---

## 5. Log d'Exécution

**Créé en** : phase EXÉCUTER, complété en phase CONSOLIDER
**Objectif** : Enregistrer exactement ce qui s'est passé pour la traçabilité et la reproductibilité.

### Contenu

| Champ | Description |
|---|---|
| **ID de tâche** | Lien vers le Brief Agent |
| **Horodatage** | Heure de début et de fin |
| **Modèle** | Nom et version du modèle (ex. : `claude-sonnet-4-20250514`) |
| **Prompt** | Le prompt ou la commande exact(e) utilisé(e) |
| **Contexte fourni** | Résumé du contenu du Pack de Contexte |
| **Sortie brute** | La sortie non modifiée de l'agent |
| **Nombre d'itérations** | Combien de cycles/relances ont été nécessaires |
| **Statut final** | PASS / FAIL / PARTIEL |
| **Durée** | Temps total de la première exécution à la consolidation |
| **Notes** | Observations, surprises, apprentissages |

### Signaux de qualité

Un bon Log d'Exécution est :
- **Reproductible** : Un autre ingénieur pourrait rejouer la même exécution.
- **Honnête** : La sortie brute est capturée, y compris les échecs.
- **Complet** : Toutes les métadonnées sont remplies, pas de champs vides.

→ Template : [`templates/execution-log.md`](../../templates/execution-log.md)

---

## 6. Revue d'Échec

**Créée en** : phase VÉRIFIER (en cas d'échec)
**Objectif** : Analyser pourquoi la sortie de l'agent a échoué et identifier la cause racine dans la méthodologie.

### Contenu

| Champ | Description |
|---|---|
| **ID de tâche** | Lien vers le Brief Agent |
| **Description de l'échec** | Ce qui s'est mal passé — spécifique et factuel |
| **Phase de cause racine** | Quelle phase ADD a échoué : CADRER, CONTEXTUALISER, CONTRAINDRE ou EXÉCUTER ? |
| **Détail de cause racine** | Pourquoi cette phase a échoué (ex. : "fichier manquant dans le contexte", "critères d'acceptation ambigus") |
| **Plan de correction** | Changements spécifiques à faire avant de ré-exécuter |
| **Pattern identifié** | Est-ce un échec récurrent ? Devrait-il devenir une mise à jour de template ? |

### Signaux de qualité

Une bonne Revue d'Échec est :
- **Sans blâme** : Focus sur le processus, pas sur l'agent ou l'ingénieur.
- **Spécifique** : Identifie la phase exacte et le manque exact.
- **Actionnable** : Le plan de correction est assez concret pour ré-entrer immédiatement dans le cycle.

→ Template : [`templates/failure-review.md`](../../templates/failure-review.md)

---

## Cycle de Vie des Artefacts

```
CADRER        →  Brief Agent
CONTEXTUALISER →  Pack de Contexte
CONTRAINDRE   →  Fiche de Contraintes
EXÉCUTER      →  Log d'Exécution (démarré)
VÉRIFIER      →  Checklist de Validation  (+ Revue d'Échec si FAIL)
CONSOLIDER    →  Log d'Exécution (complété)
```

Tous les artefacts sont stockés dans le répertoire `.add/` du projet (voir [Workflow CLI](07-cli-workflow.md)) et versionnés aux côtés du code.

---

→ Suite : [Modèle de Maturité](04-maturity-model.md)
