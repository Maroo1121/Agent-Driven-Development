# Règles Non Négociables — Les Cinq Jamais

## Vue d'ensemble

TDD a une règle absolue : *écrire le test avant le code.*
ADD en a cinq.

Ces règles ne sont pas des recommandations. Ce ne sont pas des bonnes pratiques. Ce sont des **invariants non négociables** — des conditions qui doivent être respectées pour chaque cycle ADD, quels que soient le contexte, l'urgence ou la simplicité perçue.

Enfreindre l'une de ces règles invalide le cycle.

---

## Règle 1 : Jamais d'exécution sans critères de validation explicites

> *Si on ne peut pas le vérifier, on ne peut pas le livrer.*

### Ce que ça signifie

Avant que l'agent produise quoi que ce soit, vous devez avoir rédigé des critères spécifiques qui définissent ce que "correct" signifie. Ces critères doivent être testables — un tiers devrait pouvoir évaluer la sortie en utilisant uniquement les critères, sans contexte supplémentaire.

### Pourquoi c'est non négociable

Sans critères de validation, la vérification devient subjective. La vérification subjective est inconsistante, non transférable et biaisée vers l'acceptation d'une sortie qui *semble* correcte. C'est le mécanisme principal par lequel les bugs, hallucinations et erreurs subtiles entrent en production.

### En pratique

**Faux** : "Fais en sorte que la fonction marche correctement."
**Juste** : "La fonction doit accepter un `string[]` en entrée, retourner une `Map<string, number>`, lever `InvalidInputError` pour les tableaux vides, et traiter des tableaux jusqu'à 10 000 éléments en moins de 50ms."

---

## Règle 2 : Jamais de prompt sans contexte structuré

> *Le contexte est le levier principal sur la qualité de la sortie.*

### Ce que ça signifie

Chaque prompt doit inclure un contexte structuré : fichiers pertinents, règles métier, contraintes techniques et décisions antérieures. "Structuré" signifie organisé, curé et non contradictoire — pas un déversement brut de tout ce que vous avez.

### Pourquoi c'est non négociable

Les agents comblent les lacunes de contexte avec des fabrications plausibles. Moins vous fournissez de contexte, plus l'agent invente. Plus il invente, plus vous passez de temps à debugger des erreurs invisibles. Le contexte structuré n'est pas du travail supplémentaire — c'est l'investissement le plus efficient dans la qualité de la sortie.

### En pratique

**Faux** : "Refactorise le module d'auth."
**Juste** : [Fournir le fichier du module d'auth, le fichier de types, les tests existants, la décision architecturale pour l'auth, et la contrainte que l'API publique ne doit pas changer.]

---

## Règle 3 : Jamais d'itération sans feedback formalisé

> *Les relances aléatoires sont du bruit, pas de l'ingénierie.*

### Ce que ça signifie

Quand la sortie de l'agent échoue à la vérification, l'échec doit être analysé, documenté (via une Revue d'Échec), et un plan de correction spécifique doit être créé avant de ré-exécuter. Chaque itération doit changer exactement une variable : le périmètre, le contexte, les contraintes ou le prompt.

### Pourquoi c'est non négociable

Relancer le même prompt en espérant un résultat différent est l'équivalent en développement agent de la prière. Ça marche parfois par chance, ce qui le rend psychologiquement renforçant, mais ça n'enseigne rien et n'améliore rien. Le feedback formalisé transforme l'échec en amélioration systématique.

### En pratique

**Faux** : [La sortie échoue] → "Réessaie." → [Même prompt, même contexte] → "Réessaie."
**Juste** : [La sortie échoue] → Revue d'Échec → Cause racine : cas limite manquant dans les contraintes → Ajouter le cas limite → Ré-exécuter avec la Fiche de Contraintes mise à jour.

---

## Règle 4 : Jamais de livraison sans log d'exécution

> *La reproductibilité exige la traçabilité.*

### Ce que ça signifie

Chaque exécution agent qui produit une sortie intégrée au projet doit avoir un Log d'Exécution correspondant enregistrant : le prompt utilisé, le modèle et la version, le contexte fourni, la sortie brute, le nombre d'itérations et le statut final.

### Pourquoi c'est non négociable

Sans logs d'exécution, le développement assisté par agent est une boîte noire. Vous ne pouvez pas l'auditer, vous ne pouvez pas le reproduire, vous ne pouvez pas l'améliorer, et vous ne pouvez pas le transférer à un autre ingénieur. Les logs d'exécution sont l'unité minimum de mémoire institutionnelle pour le travail assisté par agent.

### En pratique

Ce n'est pas optionnel même pour les tâches "triviales". Le log peut être bref pour les tâches simples, mais il doit exister. L'habitude de logger est plus importante que le détail de chaque log individuel.

---

## Règle 5 : Jamais de confiance sans porte de vérification

> *La confiance de l'agent ≠ la correction de la sortie.*

### Ce que ça signifie

La sortie d'un agent ne doit jamais être acceptée sur la base de sa propre assertion qu'elle est correcte. Chaque sortie doit passer par une porte de vérification indépendante — une revue humaine, un test automatisé, une vérification de types, un build, ou une Checklist de Validation. De préférence plusieurs.

### Pourquoi c'est non négociable

Les agents produisent leur sortie avec une confiance uniforme indépendamment de la justesse. Une fonction parfaitement correcte et une fonction subtilement cassée sont présentées avec le même niveau de certitude. Les portes de vérification sont le seul mécanisme qui distingue une sortie correcte d'une sortie fausse avec confiance.

### En pratique

**Porte minimum** : Une Checklist de Validation complétée avec chaque critère d'acceptation marqué PASS/FAIL.

**Mieux** : Checklist de Validation + vérifications automatiques (lint, type-check, tests, build).

**Idéal** : Checklist de Validation + vérifications automatiques + revue humaine par quelqu'un d'autre que la personne qui a rédigé le brief.

---

## Tableau récapitulatif

| # | Règle | Artefact | Phase |
|---|---|---|---|
| 1 | Jamais d'exécution sans critères de validation explicites | Fiche de Contraintes | CONTRAINDRE |
| 2 | Jamais de prompt sans contexte structuré | Pack de Contexte | CONTEXTUALISER |
| 3 | Jamais d'itération sans feedback formalisé | Revue d'Échec | VÉRIFIER |
| 4 | Jamais de livraison sans log d'exécution | Log d'Exécution | CONSOLIDER |
| 5 | Jamais de confiance sans porte de vérification | Checklist de Validation | VÉRIFIER |

---

## Le Contrat

Ces cinq règles forment le **Contrat ADD**. Adopter ADD signifie s'engager à respecter ces règles pour chaque tâche assistée par agent.

Si vous enfreignez une règle, vous ne faites pas de l'ADD. Vous faites du prompting.

Il n'y a rien de mal à faire du prompting. Mais ne l'appelez pas de l'ingénierie.

---

→ Suite : [Comparaison : TDD, DDD, BDD](06-comparison-tdd-ddd.md)
