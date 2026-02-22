# Démarrage Rapide — ADD en 15 Minutes

## Pour qui c'est

Vous utilisez des agents IA (Claude Code, Cursor, Copilot, Aider ou similaire) dans votre workflow de développement. Vous voulez de meilleurs résultats, plus constants, sans courbe d'apprentissage abrupte. Ce guide vous fait pratiquer ADD en 15 minutes.

---

## Étape 0 : Comprendre l'idée centrale (2 minutes)

ADD repose sur un insight central : **la qualité de la sortie agent est déterminée par votre préparation, pas par votre prompting.**

Le cycle ADD :

```
CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER → VÉRIFIER → CONSOLIDER
```

Pour le démarrage rapide, concentrez-vous sur trois phases : **CADRER, CONTRAINDRE et VÉRIFIER.** À elles seules, elles amélioreront dramatiquement vos résultats.

---

## Étape 1 : Installation (3 minutes)

Créez un répertoire `.add/` dans votre projet :

```bash
mkdir -p .add/{briefs,constraints,validations,executions}
```

Ou utilisez le script de scaffold :

```bash
git clone https://github.com/Pyro-IV/Agent-Driven-Development.git /tmp/add
/tmp/add/scaffold/init.sh .
```

---

## Étape 2 : Avant votre prochaine tâche agent — Rédigez un Brief (3 minutes)

Avant de prompter l'agent, créez un fichier `.add/briefs/001-ma-tache.md` :

```markdown
# Brief Agent : 001-ma-tache

## Intention
L'agent doit [ce qu'il doit produire].

## Non-Objectifs
- Ne doit PAS [chose que vous ne voulez pas].
- Ne doit PAS [autre chose].

## Format de Sortie
[ex. : fichier TypeScript, document Markdown, config JSON]

## Critères de Succès
- [ ] [Critère spécifique et testable]
- [ ] [Un autre critère]
- [ ] [Encore un autre]
```

**Ça prend 3 minutes.** Ça en économise 30 de retravail.

---

## Étape 3 : Ajoutez des Contraintes (2 minutes)

Créez `.add/constraints/001-ma-tache.md` :

```markdown
# Contraintes : 001-ma-tache

## Doit
- [Comportement ou format requis]
- [Un autre comportement requis]

## Ne Doit Pas
- [Action interdite]
- [Autre action interdite]

## Critères d'Acceptation
- [ ] [Condition testable — pass/fail]
- [ ] [Autre condition testable]
- [ ] [Encore une condition testable]
```

---

## Étape 4 : Exécuter (Normal)

Promptez l'agent comme d'habitude — mais référencez votre brief et vos contraintes :

```
Implémente la tâche décrite dans .add/briefs/001-ma-tache.md.
Respecte toutes les contraintes de .add/constraints/001-ma-tache.md.
```

Ou incluez le contenu directement dans votre prompt.

---

## Étape 5 : Vérifier (3 minutes)

Après que l'agent a produit sa sortie, créez `.add/validations/001-ma-tache.md` :

```markdown
# Validation : 001-ma-tache

## Critères d'Acceptation
- [ ] PASS / FAIL — [critère de la fiche de contraintes]
- [ ] PASS / FAIL — [critère]
- [ ] PASS / FAIL — [critère]

## Vérifications
- [ ] Pas d'imports/dépendances hallucinés ?
- [ ] Resté dans le périmètre (pas de features en plus) ?
- [ ] Le code s'exécute sans erreurs ?
- [ ] Les tests passent ?

## Verdict : PASS / FAIL
```

**Si FAIL** : Identifiez ce qui a échoué. Le périmètre était-il trop large ? Le contexte manquant ? Les contraintes ambiguës ? Corrigez ce point précis et ré-exécutez.

**Si PASS** : Commitez tout (code + artefacts).

---

## Étape 6 : Logger (2 minutes)

Créez `.add/executions/001-ma-tache.md` :

```markdown
# Log d'Exécution : 001-ma-tache

- **Date** : 2025-01-15
- **Modèle** : Claude Sonnet 4
- **Itérations** : 1
- **Statut** : PASS
- **Durée** : 12 minutes
- **Notes** : Succès première passe. Les contraintes étaient assez serrées.
```

---

## C'est tout.

Vous venez de compléter votre premier cycle ADD. Six fichiers, 15 minutes, des résultats dramatiquement meilleurs.

---

## Ce que vous venez de faire

| Phase | Temps | Artefact |
|---|---|---|
| CADRER | 3 min | Brief Agent |
| CONTRAINDRE | 2 min | Fiche de Contraintes |
| EXÉCUTER | normal | — |
| VÉRIFIER | 3 min | Checklist de Validation |
| CONSOLIDER | 2 min | Log d'Exécution |

Surcoût total : ~10 minutes sur votre workflow normal. Retour : taux de succès première passe significativement plus élevé, reproductibilité et traçabilité.

---

## Prochaines étapes

Une fois que ça devient naturel (généralement après 5–10 cycles) :

1. **Ajoutez des Packs de Contexte** — Structurez le contexte que vous fournissez à l'agent (fichiers, règles, décisions).
2. **Ajoutez des Revues d'Échec** — Quand la sortie échoue, analysez pourquoi systématiquement.
3. **Construisez votre bibliothèque de templates** — Personnalisez les templates pour vos types de tâches courants.
4. **Lisez la documentation complète** — Commencez par [Le Cycle ADD](02-cycle.md) et [Anti-Patterns](08-anti-patterns.md).

---

## Checklist ADD Lite

Imprimez ceci et gardez-le visible :

```
┌─────────────────────────────────────────────┐
│            CHECKLIST ADD LITE               │
│                                             │
│  Avant d'exécuter :                         │
│  □ Intention formulée en une phrase         │
│  □ Non-objectifs listés                     │
│  □ Critères d'acceptation rédigés           │
│  □ Actions interdites listées               │
│                                             │
│  Après l'exécution :                        │
│  □ Chaque critère vérifié : PASS/FAIL       │
│  □ Pas d'hallucinations détectées           │
│  □ Périmètre respecté                       │
│  □ Vérifications automatiques passent       │
│  □ Exécution loggée                         │
│                                             │
│  Si FAIL :                                  │
│  □ Identifier quelle phase a échoué         │
│  □ Corriger cette phase spécifique          │
│  □ Ré-exécuter (ne PAS juste relancer)      │
└─────────────────────────────────────────────┘
```

---

→ Documentation complète : [Philosophie](01-philosophy.md) · [Le Cycle ADD](02-cycle.md) · [Artefacts](03-artifacts.md)
