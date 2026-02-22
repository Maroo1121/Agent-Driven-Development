# Comparaison : ADD vs TDD, DDD et BDD

## Vue d'ensemble

ADD ne remplace pas TDD, DDD ou BDD. Il opère à une couche différente et résout une classe de problèmes différente. Comprendre où ADD se situe par rapport à ces méthodologies établies clarifie son objectif et ses limites.

---

## Comparaison structurelle

| Dimension | TDD | DDD | BDD | **ADD** |
|---|---|---|---|---|
| **Nom complet** | Test-Driven Development | Domain-Driven Design | Behavior-Driven Development | Agent-Driven Development |
| **Année d'introduction** | 2003 | 2003 | 2006 | 2025 |
| **Ce qu'il structure** | Le testing du code | La modélisation métier | La spécification de comportement | Le développement assisté par agent |
| **Cycle principal** | Red → Green → Refactor | Explorer → Modéliser → Lier | Définir → Automatiser → Valider | Cadrer → Contextualiser → Contraindre → Exécuter → Vérifier → Consolider |
| **Principe central** | Écrire le test d'abord | Modéliser le domaine d'abord | Définir le comportement d'abord | Définir les contraintes d'abord |
| **Artefact clé** | Suite de tests | Langage Ubiquitaire, Contexte Borné | Fichiers de fonctionnalités (Gherkin) | Brief Agent, Log d'Exécution, Fiche de Contraintes |
| **S'applique à** | Tout code | Domaines complexes | Exigences et acceptation | Toute tâche assistée par agent |

---

## Équivalences conceptuelles

### ADD ↔ TDD

| Concept TDD | Équivalent ADD | Justification |
|---|---|---|
| Écrire le test d'abord | Écrire la Fiche de Contraintes d'abord | Les deux définissent "correct" avant de produire la sortie |
| Red (le test échoue) | VÉRIFIER échoue | Les deux partent d'un état d'échec connu |
| Green (le test passe) | VÉRIFIER passe | Les deux visent la sortie minimale satisfaisant les critères |
| Refactor | CONSOLIDER | Les deux améliorent la qualité après l'établissement de la correction |
| Suite de tests | Fiche de Contraintes + Checklist de Validation | Les deux sont des spécifications exécutables |
| Test de régression | Log d'Exécution | Les deux permettent la détection de régressions futures |

**Différence clé** : TDD vérifie le *comportement du code*. ADD vérifie la *qualité de la sortie de l'agent*. TDD opère au niveau du code ; ADD opère au niveau du processus.

### ADD ↔ DDD

| Concept DDD | Équivalent ADD | Justification |
|---|---|---|
| Langage Ubiquitaire | Pack de Contexte (règles métier) | Les deux assurent une compréhension partagée des concepts métier |
| Contexte Borné | Cadrage (non-objectifs) | Les deux définissent des frontières explicites |
| Agrégat | Brief Agent (périmètre atomique) | Les deux imposent une consistance transactionnelle à une frontière définie |
| Événement de Domaine | Entrée de Log d'Exécution | Les deux enregistrent ce qui s'est passé de manière structurée et traçable |
| Couche Anti-Corruption | Fiche de Contraintes (actions interdites) | Les deux protègent l'intégrité du système contre les entrées externes |

**Différence clé** : DDD structure la *connaissance métier*. ADD structure l'*interaction avec l'agent*. DDD concerne ce que vous modélisez ; ADD concerne comment vous déléguez.

### ADD ↔ BDD

| Concept BDD | Équivalent ADD | Justification |
|---|---|---|
| Fichier de fonctionnalité | Brief Agent | Les deux définissent ce qui doit se passer dans un format structuré |
| Scénario (Given/When/Then) | Fiche de Contraintes (critères d'acceptation) | Les deux définissent des conditions testables pour le succès |
| Définition d'étape | Composition du prompt | Les deux traduisent l'intention humaine en instructions exécutables |
| Documentation vivante | Archive des Logs d'Exécution | Les deux produisent de la documentation comme sous-produit du processus |

**Différence clé** : BDD structure la *communication entre humains* (développeurs, QA, produit). ADD structure la *communication entre humains et agents*.

---

## Ce que ADD résout que les autres ne couvrent pas

### Problème 1 : Vérification de la sortie agent

TDD vérifie que le *code* fonctionne correctement. Mais qui vérifie que *le code écrit par l'agent* est correct avant qu'il entre dans le cycle de test ?

**ADD fournit** : La pré-vérification de la sortie agent via la Fiche de Contraintes et la Checklist de Validation, avant que la sortie n'entre dans le cycle TDD.

### Problème 2 : Gestion du contexte

DDD définit un langage partagé pour le domaine. Mais comment ce langage est-il communiqué à un agent de manière fiable ?

**ADD fournit** : L'artefact Pack de Contexte, qui structure la connaissance métier dans un format consommable par les agents.

### Problème 3 : Reproductibilité du travail assisté par IA

BDD produit de la documentation vivante. Mais les interactions agent — qui produisent de plus en plus de portions significatives de code — ne laissent aucune trace.

**ADD fournit** : Le Log d'Exécution, qui assure que chaque décision assistée par agent est traçable et reproductible.

### Problème 4 : Discipline de processus pour des outils non déterministes

TDD, DDD et BDD supposent tous des outils déterministes : un test passe ou échoue, un modèle correspond ou non, un scénario matche ou non.

Les agents sont non déterministes. Le même prompt peut produire des sorties différentes. Cela change fondamentalement ce que "discipline" signifie.

**ADD fournit** : Une méthodologie spécifiquement conçue pour les sorties non déterministes : contraintes avant l'exécution, vérification après l'exécution, et itération structurée quand la sortie échoue.

---

## Comment ADD s'intègre avec chacun

### ADD + TDD

```
CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER (l'agent écrit le code)
    → VÉRIFIER (vérification ADD)
        → si PASS → lancer le cycle TDD sur le code
            → Red → Green → Refactor
        → CONSOLIDER
```

ADD assure que le code de l'agent est solide *avant* qu'il n'entre dans le cycle TDD. TDD assure que le code est *correct* au niveau unitaire. Ce sont des couches complémentaires.

### ADD + DDD

```
DDD définit le modèle de domaine et le langage ubiquitaire.
    → La connaissance métier alimente les Packs de Contexte ADD.
    → ADD assure que les agents respectent les frontières du domaine (via les Fiches de Contraintes).
    → La sortie agent est vérifiée contre les règles métier (phase VÉRIFIER).
```

DDD fournit le *quoi* (connaissance métier). ADD fournit le *comment* (discipline d'interaction agent).

### ADD + BDD

```
BDD définit les scénarios de comportement (Given/When/Then).
    → Les scénarios informent les Fiches de Contraintes ADD (critères d'acceptation).
    → Le Brief Agent référence les fichiers de fonctionnalités BDD.
    → La sortie agent est vérifiée contre les scénarios BDD.
```

BDD fournit la *spécification*. ADD fournit le *processus de délégation et de vérification* pour faire implémenter cette spécification par un agent.

---

## La Stack Complète

Quand les quatre sont utilisés ensemble :

```
┌─────────────────────────────────────────┐
│  BDD  — Définir les scénarios           │
├─────────────────────────────────────────┤
│  DDD  — Modéliser le domaine            │
├─────────────────────────────────────────┤
│  ADD  — Déléguer aux agents avec rigueur│
├─────────────────────────────────────────┤
│  TDD  — Vérifier la correction du code  │
└─────────────────────────────────────────┘
```

Chaque couche gère une préoccupation différente. Aucune ne remplace les autres.

---

→ Suite : [Workflow CLI](07-cli-workflow.md)
