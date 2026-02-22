# ADD — Agent-Driven Development (Version Française)

> **Une méthodologie rigoureuse pour le développement logiciel assisté par agents IA.**

---

## Documentation

| Document | Description |
|---|---|
| [Philosophie](01-philosophy.md) | Pourquoi ADD existe et quel problème il résout |
| [Le Cycle ADD](02-cycle.md) | Spécification complète du cycle en 6 phases |
| [Artefacts](03-artifacts.md) | Les livrables standards et leurs schémas |
| [Modèle de Maturité](04-maturity-model.md) | Progression L1→L4 |
| [Règles Non Négociables](05-non-negotiable-rules.md) | Les "Cinq Jamais" expliqués |
| [Comparaison : TDD, DDD, BDD](06-comparison-tdd-ddd.md) | Comment ADD se positionne face aux méthodologies établies |
| [Workflow CLI](07-cli-workflow.md) | Adapter ADD aux outils CLI agentiques |
| [Anti-Patterns](08-anti-patterns.md) | Les erreurs classiques et comment les éviter |
| [Démarrage Rapide](09-quick-start.md) | Commencer en 15 minutes |

---

## Le Cycle ADD

```
CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER → VÉRIFIER → CONSOLIDER
```

Équivalent anglais : SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY → CONSOLIDATE

---

## Le Manifeste — 10 Principes

1. **Le contexte prime sur le prompt** — Un contexte bien structuré surpasse un prompt ingénieux.
2. **Les contraintes priment sur la créativité** — La précision produit de meilleurs résultats que la liberté totale.
3. **La vérification prime sur la confiance** — Ne jamais livrer un output d'agent sans validation explicite.
4. **L'intention explicite prime sur l'hypothèse implicite** — Si l'agent doit deviner, le cadrage a échoué.
5. **L'itération structurée prime sur la relance aléatoire** — Chaque relance doit changer quelque chose de précis.
6. **Les artefacts priment sur la mémoire** — Ce qui n'est pas écrit n'existe pas.
7. **La porte humaine prime sur l'autonomie totale** — L'autonomie se gagne par la fiabilité démontrée.
8. **Le contrôle du périmètre prime sur la dérive** — Une tâche, un cycle. Toujours.
9. **L'analyse d'échec prime sur le blâme** — Un mauvais output est un échec méthodologique, pas un échec de l'agent.
10. **La reproductibilité prime sur la brillance** — Un processus reproductible bat un prompt chanceux.

---

## Les Cinq Jamais

| Règle | Justification |
|---|---|
| **Jamais d'exécution sans critères de validation explicites** | Si on ne peut pas le vérifier, on ne peut pas le livrer. |
| **Jamais de prompt sans contexte structuré** | Le contexte est le levier principal sur la qualité de l'output. |
| **Jamais d'itération sans feedback formalisé** | Les relances aléatoires sont du bruit, pas de l'ingénierie. |
| **Jamais de livraison sans log d'exécution** | La reproductibilité exige la traçabilité. |
| **Jamais de confiance sans porte de vérification** | La confiance de l'agent ≠ la correction de l'output. |

---

## Modèle de Maturité

| Niveau | Nom | Description |
|---|---|---|
| **N1** | Prompting ad-hoc | Non structuré, conversationnel, aucun artefact |
| **N2** | Usage Structuré | Briefs, contraintes, checklists de validation |
| **N3** | Orchestration Systématique | Cycle complet, templates, logs, revues |
| **N4** | Ingénierie Agent-Native | ADD intégré au CI/CD, métriques, standards d'équipe |

---

## Démarrage Rapide

```bash
# Initialiser ADD dans votre projet
git clone https://github.com/Pyro-IV/Agent-Driven-Development.git /tmp/add
/tmp/add/scaffold/init.sh .

# Avant votre prochaine tâche agent :
cp .add/templates/agent-brief.md .add/briefs/001-ma-tache.md
# Remplissez le brief, puis exécutez
```

→ [Guide complet de démarrage rapide](09-quick-start.md)

---

*ADD n'est pas conçu pour rendre les agents plus intelligents. Il est conçu pour rendre les ingénieurs plus disciplinés.*
