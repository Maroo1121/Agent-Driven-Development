# Modèle de Maturité ADD

## Vue d'ensemble

Le Modèle de Maturité ADD définit quatre niveaux de pratique du développement assisté par agent. Il fournit un chemin de progression clair du prompting ad-hoc vers l'intégration d'ingénierie.

Chaque niveau s'appuie sur le précédent. On ne peut pas sauter de niveau — les habitudes et artefacts des niveaux inférieurs sont des prérequis pour les niveaux supérieurs.

---

## Niveau 1 : Prompting Ad-hoc

> *"Je parle à l'agent et j'espère que ça marche."*

### Caractéristiques

- Les prompts sont conversationnels et non structurés.
- Aucun artefact n'est produit.
- Aucun processus de vérification — la sortie est acceptée ou rejetée à l'instinct.
- Aucune traçabilité — les interactions passées ne sont pas enregistrées.
- Les résultats sont non reproductibles.
- Le succès dépend de la compétence individuelle, pas d'un processus.

### Comportements typiques

- Copier-coller le code produit par l'agent sans revue.
- Relancer le même prompt plusieurs fois en espérant un meilleur résultat.
- Blâmer l'agent quand la sortie est mauvaise.
- Aucune distinction entre types de tâches — tout est traité de la même manière.

### Profil de risque

Variabilité élevée, fiabilité faible. Acceptable pour l'expérimentation personnelle, inacceptable pour le travail de production.

---

## Niveau 2 : Usage Structuré

> *"Je prépare avant d'exécuter, et je vérifie après."*

### Caractéristiques

- Les Briefs Agent sont rédigés avant l'exécution.
- Les contraintes sont définies avant le prompting.
- Les Checklists de Validation sont utilisées après l'exécution.
- Un logging basique des exécutions est en place.
- La qualité des sorties est mesurablément plus constante.

### Pratiques requises

| Pratique | Statut |
|---|---|
| Rédiger un Brief Agent avant chaque tâche | Requis |
| Définir les critères d'acceptation avant l'exécution | Requis |
| Compléter une Checklist de Validation après l'exécution | Requis |
| Logger les métadonnées d'exécution (modèle, prompt, horodatage) | Requis |
| Structurer le contexte avant le prompting | Recommandé |
| Utiliser des Fiches de Contraintes | Recommandé |

### Critères de transition (N2 → N3)

- [ ] Les Briefs Agent sont rédigés pour 100% des tâches agent.
- [ ] Les Checklists de Validation sont complétées pour 100% des sorties.
- [ ] Au moins 5 Logs d'Exécution sont archivés.
- [ ] Au moins 2 Revues d'Échec ont été conduites.

---

## Niveau 3 : Orchestration Systématique

> *"Chaque interaction agent suit le cycle ADD complet avec tous les artefacts."*

### Caractéristiques

- Le cycle ADD complet (CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER → VÉRIFIER → CONSOLIDER) est suivi pour chaque tâche.
- Les six artefacts sont produits et archivés.
- Les Packs de Contexte sont structurés et curés.
- Les Revues d'Échec alimentent l'amélioration systématique du processus.
- Les templates sont maintenus et évoluent en fonction des apprentissages.
- Le processus est transférable — un nouveau membre d'équipe peut le suivre.

### Pratiques requises

| Pratique | Statut |
|---|---|
| Cycle ADD complet pour chaque tâche agent | Requis |
| Six artefacts produits par cycle | Requis |
| Packs de Contexte curés (pas de bruit) | Requis |
| Revues d'Échec conduites pour chaque échec | Requis |
| Templates maintenus et versionnés | Requis |
| Logs d'Exécution avec nombre d'itérations et durée | Requis |
| Extraction de patterns après consolidation | Recommandé |
| Bibliothèque de templates partagée en équipe | Recommandé |

### Critères de transition (N3 → N4)

- [ ] Cycle ADD complet suivi pour 100% des tâches agent pendant 30 jours.
- [ ] La bibliothèque de templates contient au moins 10 templates spécifiques au domaine.
- [ ] Le nombre moyen d'itérations par tâche est suivi et en tendance baissière.
- [ ] Les patterns de Revues d'Échec ont conduit à au moins 3 mises à jour de templates.
- [ ] Le processus peut être expliqué à et suivi par un nouveau membre d'équipe.

---

## Niveau 4 : Ingénierie Agent-Native

> *"ADD est intégré dans notre culture d'ingénierie, notre outillage et notre CI/CD."*

### Caractéristiques

- Les artefacts ADD font partie du pipeline CI/CD (ex. : les PRs exigent un Log d'Exécution).
- Les métriques sont suivies : nombre d'itérations, taux de succès première passe, temps par cycle.
- Les tâches agent sont catégorisées par type et optimisées avec des templates spécifiques.
- Les portes qualité sont automatisées quand c'est possible.
- L'équipe dispose d'une Bibliothèque de Templates Prompt partagée et évolutive.
- Les pratiques ADD font partie de l'onboarding et des standards de code review.
- Les patterns d'échec sont agrégés et alimentent l'apprentissage organisationnel.

### Pratiques requises

| Pratique | Statut |
|---|---|
| Artefacts ADD requis dans le processus PR/MR | Requis |
| Métriques suivies par cycle (itérations, durée, taux de pass) | Requis |
| Portes qualité automatisées (linting, type-check, tests) | Requis |
| Bibliothèque de templates partagée et versionnée | Requis |
| Templates spécifiques par type de tâche | Requis |
| L'onboarding inclut la formation ADD | Requis |
| Analyse agrégée des patterns d'échec (mensuelle) | Requis |
| Checklist d'audit ADD en code review | Recommandé |
| Critères de sélection d'agent documentés par type de tâche | Recommandé |

---

## Auto-Évaluation Rapide

| # | Question | N1 | N2 | N3 | N4 |
|---|---|---|---|---|---|
| 1 | Rédigez-vous un brief avant chaque tâche agent ? | ✗ | ✓ | ✓ | ✓ |
| 2 | Définissez-vous les critères d'acceptation avant l'exécution ? | ✗ | ✓ | ✓ | ✓ |
| 3 | Vérifiez-vous la sortie avec une checklist ? | ✗ | ✓ | ✓ | ✓ |
| 4 | Loggez-vous les exécutions ? | ✗ | ✓ | ✓ | ✓ |
| 5 | Curez-vous les packs de contexte ? | ✗ | ✗ | ✓ | ✓ |
| 6 | Conduisez-vous des revues d'échec ? | ✗ | ✗ | ✓ | ✓ |
| 7 | Maintenez-vous une bibliothèque de templates ? | ✗ | ✗ | ✓ | ✓ |
| 8 | Suivez-vous le cycle complet en 6 phases ? | ✗ | ✗ | ✓ | ✓ |
| 9 | Les artefacts ADD font-ils partie de votre CI/CD ? | ✗ | ✗ | ✗ | ✓ |
| 10 | Suivez-vous des métriques par cycle ? | ✗ | ✗ | ✗ | ✓ |

**Votre niveau = le plus haut niveau où TOUTES les coches sont présentes.**

---

## Calendrier de Progression

Pour un développeur solo ou une petite équipe :

| Transition | Durée typique | Action clé |
|---|---|---|
| N1 → N2 | 1–2 semaines | Commencer à rédiger briefs et checklists de validation |
| N2 → N3 | 2–4 semaines | Adopter le cycle complet, tous les artefacts, les revues d'échec |
| N3 → N4 | 1–3 mois | Intégrer au CI/CD, suivre les métriques, formaliser les standards |

L'objectif n'est pas de foncer au N4. L'objectif est de **ne jamais retomber au N1**.

---

→ Suite : [Règles Non Négociables](05-non-negotiable-rules.md)
