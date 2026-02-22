# Le Cycle ADD

## Vue d'ensemble

Le Cycle ADD est un processus en six phases pour chaque tâche assistée par agent. C'est le cœur de la méthodologie — l'équivalent du Red → Green → Refactor en TDD.

```
CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER → VÉRIFIER → CONSOLIDER
```

Chaque phase possède :
- Un **objectif** — ce qu'elle accomplit
- Une **entrée** — ce dont vous avez besoin avant d'y entrer
- Une **sortie** — l'artefact qu'elle produit
- Une **condition de passage** — le critère pour passer à la phase suivante

Le cycle est **atomique** : une tâche, un cycle. Les travaux complexes sont décomposés en cycles multiples, jamais compressés en un seul.

---

## Phase 1 : CADRER (SCOPE)

> *Définir ce que l'agent doit faire — et ce qu'il ne doit pas faire.*

### Objectif

Établir une intention claire et bornée pour la tâche. Le cadrage est la phase la plus impactante : une tâche bien cadrée réussit même avec un prompting médiocre ; une tâche mal cadrée échoue même avec un prompt parfait.

### Entrée

- Un besoin, une demande de fonctionnalité, un rapport de bug ou une idée d'amélioration.

### Activités

1. Écrire une **déclaration d'intention en une phrase** : "L'agent doit [verbe] [objet] [contrainte]."
2. Définir les **non-objectifs** explicitement : ce qui est hors périmètre pour ce cycle.
3. Estimer la **complexité** : tâche en une passe ou workflow multi-étapes ?
4. Décider du **format de sortie** : code, documentation, analyse, configuration, etc.

### Sortie

→ **Brief Agent** (artefact)

### Condition de passage

Le cadrage est valide quand :
- [ ] L'intention peut être formulée en une phrase.
- [ ] Les non-objectifs sont explicitement listés.
- [ ] Le format de sortie attendu est défini.
- [ ] Un humain peut vérifier la sortie sans ambiguïté.

### Anti-Pattern

*"Refactorise ce module et aussi ajoute des tests et mets à jour la doc."*
→ C'est trois cycles, pas un.

---

## Phase 2 : CONTEXTUALISER (FRAME)

> *Assembler le contexte dont l'agent a besoin pour réussir.*

### Objectif

Rassembler toutes les connaissances, fichiers, règles et contraintes nécessaires à l'agent. La qualité du contexte est le facteur principal de la qualité de la sortie. Cette phase garantit que l'agent opère avec une information complète, pertinente et non contradictoire.

### Entrée

- Brief Agent de la phase CADRER.

### Activités

1. Identifier les **fichiers pertinents** : code, configs, schémas, docs.
2. Identifier les **règles métier** : logique business, conventions de nommage, patterns architecturaux.
3. Identifier les **décisions antérieures** : ce qui a déjà été tenté, rejeté, et pourquoi.
4. Identifier les **dépendances** : autres systèmes, APIs, bibliothèques, contraintes de version.
5. Tout assembler dans un format structuré consommable par l'agent.

### Sortie

→ **Pack de Contexte** (artefact)

### Condition de passage

Le contexte est valide quand :
- [ ] Tous les fichiers référencés dans le brief sont inclus ou accessibles.
- [ ] Les règles métier sont explicites, pas implicites.
- [ ] Aucune information contradictoire n'est présente.
- [ ] Le contexte est borné à la tâche — pas de bruit inutile.

### Anti-Pattern

*Déverser une base de code entière dans le contexte en espérant que l'agent trouvera ce dont il a besoin.*
→ Le bruit détruit la précision. Curez impitoyablement.

---

## Phase 3 : CONTRAINDRE (CONSTRAIN)

> *Encoder les règles que l'agent doit suivre et les critères d'acceptation.*

### Objectif

Définir des frontières explicites pour la sortie de l'agent. Les contraintes transforment une tâche vague en spécification vérifiable. C'est là que la discipline d'ingénierie est la plus visible : plus les contraintes sont précises, plus la sortie est fiable.

### Entrée

- Brief Agent + Pack de Contexte.

### Activités

1. Définir les **contraintes de format** : structure de fichiers, conventions de nommage, style de code.
2. Définir les **contraintes comportementales** : ce que le code doit faire, ce qu'il ne doit pas faire.
3. Définir les **contraintes de qualité** : objectifs de performance, gestion d'erreurs, cas limites.
4. Écrire les **critères d'acceptation** : conditions spécifiques et testables pour pass/fail.
5. Définir les **actions interdites** : ce que l'agent ne doit jamais faire (ex. : supprimer des fichiers, modifier du code non lié, inventer des dépendances).

### Sortie

→ **Fiche de Contraintes** (artefact)

### Condition de passage

Les contraintes sont valides quand :
- [ ] Chaque contrainte est testable (vérifiable comme vraie/fausse).
- [ ] Les critères d'acceptation sont assez spécifiques pour qu'un tiers puisse évaluer.
- [ ] Les actions interdites sont explicitement listées.
- [ ] Aucune contrainte n'en contredit une autre.

### Anti-Pattern

*"Fais un truc propre et bien structuré."*
→ Inmesurable. Plutôt : "Les fonctions doivent faire moins de 30 lignes. Pas de callbacks imbriqués. Gestion d'erreurs via try/catch avec erreurs typées."

---

## Phase 4 : EXÉCUTER (EXECUTE)

> *L'agent réalise la tâche dans les contraintes définies.*

### Objectif

C'est la seule phase où l'agent agit. Tout avant cette phase est de la préparation humaine ; tout après est de la vérification humaine. La phase d'exécution est délibérément bornée — l'agent opère dans le périmètre, le contexte et les contraintes définis dans les phases 1–3.

### Entrée

- Brief Agent + Pack de Contexte + Fiche de Contraintes.

### Activités

1. Composer le **prompt** à partir du brief, du contexte et des contraintes.
2. Sélectionner le **mode d'exécution** : une passe, multi-étapes, conversationnel ou autonome.
3. **Exécuter** la tâche agent.
4. Capturer la **sortie brute** avant toute modification.

### Sortie

→ Sortie de l'agent (code, texte, analyse, etc.)
→ Entrée de **Log d'Exécution** (artefact — démarré automatiquement)

### Condition de passage

L'exécution est complète quand :
- [ ] L'agent a produit une sortie.
- [ ] La sortie brute est capturée dans le log d'exécution.
- [ ] Le prompt utilisé est enregistré.
- [ ] Le modèle, la version et l'horodatage sont loggés.

### Note

Cette phase est intentionnellement minimale. ADD concentre l'effort en amont dans CADRER, CONTEXTUALISER et CONTRAINDRE pour que EXÉCUTER soit aussi simple et propre que possible. Une exécution bien préparée nécessite rarement un prompt engineering élaboré.

---

## Phase 5 : VÉRIFIER (VERIFY)

> *Valider la sortie contre chaque contrainte et critère d'acceptation.*

### Objectif

Vérification systématique contre la Fiche de Contraintes. C'est la porte qualité — aucune sortie n'entre en production sans validation explicite. La vérification est binaire : pass ou fail. Les pass partiels sont des fails.

### Entrée

- Sortie de l'agent + Fiche de Contraintes + Checklist de Validation.

### Activités

1. **Vérifier chaque critère d'acceptation** contre la sortie. Marquer pass/fail.
2. **Vérifier les hallucinations** : l'agent a-t-il inventé des informations absentes du contexte ?
3. **Vérifier les violations de périmètre** : l'agent a-t-il fait plus ou moins que demandé ?
4. **Vérifier les échecs silencieux** : la sortie semble-t-elle correcte mais contient-elle des erreurs subtiles ?
5. **Exécuter les vérifications automatiques** quand c'est possible : linting, vérification de types, tests, builds.
6. Enregistrer toutes les observations dans la Checklist de Validation.

### Sortie

→ **Checklist de Validation** complétée (artefact)

### Condition de passage

La vérification passe quand :
- [ ] Chaque critère d'acceptation est marqué PASS.
- [ ] Aucune hypothèse hallucinée n'est détectée.
- [ ] Aucune violation de périmètre n'est trouvée.
- [ ] Les vérifications automatiques passent.

### En cas d'échec

Si un critère échoue → **ne pas passer à CONSOLIDER**. À la place :

1. Identifier **quelle phase a échoué** : Le périmètre était-il trop large ? Le contexte incomplet ? Les contraintes ambiguës ? Ou l'agent a-t-il genuinement sous-performé ?
2. Créer un artefact **Revue d'Échec**.
3. Retourner à la phase appropriée (CADRER, CONTEXTUALISER ou CONTRAINDRE) avec des corrections spécifiques.
4. Ré-exécuter. C'est de l'**itération structurée**, pas une relance aléatoire.

---

## Phase 6 : CONSOLIDER (CONSOLIDATE)

> *Commit, log, et extraire les apprentissages.*

### Objectif

Clore le cycle. Garantir que la sortie est intégrée, le processus documenté, et les apprentissages capturés pour les cycles futurs.

### Entrée

- Sortie vérifiée + Checklist de Validation complétée + Log d'Exécution.

### Activités

1. **Intégrer** la sortie : commiter le code, mettre à jour la doc, merger les changements.
2. **Compléter le Log d'Exécution** : ajouter le statut final, la durée, le nombre d'itérations.
3. **Extraire les patterns** : Ce cycle a-t-il révélé un template réutilisable ? Une nouvelle contrainte ? Une meilleure structure de contexte ?
4. **Mettre à jour les templates** si le cycle a produit des améliorations généralisables.
5. **Archiver** tous les artefacts pour la traçabilité.

### Sortie

→ Sortie intégrée (code commité, docs mergées, etc.)
→ **Log d'Exécution** complété (artefact)
→ Templates mis à jour (si applicable)

### Condition de passage

La consolidation est complète quand :
- [ ] La sortie est intégrée dans le codebase/projet.
- [ ] Le Log d'Exécution est complet et archivé.
- [ ] Les patterns réutilisables sont capturés dans les templates.

---

## Propriétés du Cycle

### Atomicité

Un cycle = une tâche. Si vous devez décomposer, créez des cycles multiples avec des dépendances explicites.

### Traçabilité

Chaque cycle produit une chaîne d'artefacts complète : Brief → Contexte → Contraintes → Log → Checklist. Cette chaîne est la piste d'audit.

### Itération

Les cycles peuvent boucler, mais uniquement via une ré-entrée structurée. La boucle passe toujours par une Revue d'Échec qui identifie la phase spécifique à revisiter.

```
CADRER → CONTEXTUALISER → CONTRAINDRE → EXÉCUTER → VÉRIFIER ──PASS──→ CONSOLIDER
                                                       │
                                                      FAIL
                                                       │
                                                       ▼
                                                 REVUE D'ÉCHEC
                                                       │
                                                  ┌────┼────┐
                                                  ▼    ▼    ▼
                                               CADRER CONT. CONTR.
```

### Imbrication

Les tâches complexes sont décomposées en cycles multiples. La phase EXÉCUTER d'un cycle parent peut contenir des cycles enfants, chacun suivant la séquence complète CADRER → CONSOLIDER.

---

→ Suite : [Artefacts](03-artifacts.md)
