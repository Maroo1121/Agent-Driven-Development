# Anti-Patterns ADD

## Vue d'ensemble

Les anti-patterns sont des erreurs récurrentes qui semblent productives mais conduisent systématiquement à de mauvais résultats. Les reconnaître est aussi important que suivre le cycle.

Chaque anti-pattern ci-dessous est décrit avec ses symptômes, sa cause racine et la correction ADD.

---

## AP-1 : Le Méga-Prompt

### Description

Tout compresser dans un seul prompt massif — périmètre, contexte, contraintes et exemples — en espérant que l'agent gère tout d'un coup.

### Symptômes

- Les prompts dépassent 2000 mots.
- La sortie traite certaines parties correctement et ignore ou bâcle les autres.
- La vérification révèle des échecs multiples non liés.

### Cause racine

Échec de CADRAGE. La tâche est trop large pour un seul cycle.

### Correction ADD

Décomposer en cycles ADD multiples. Chaque cycle a une intention, une sortie, une vérification. Les chaîner avec des dépendances explicites.

---

## AP-2 : La Relance-Prière

### Description

Relancer exactement le même prompt après un échec, en espérant un meilleur résultat du processus stochastique.

### Symptômes

- Même prompt exécuté 3+ fois.
- Aucun changement entre les itérations.
- Un succès occasionnel renforce le comportement.

### Cause racine

Violation de la Règle 3 : *Jamais d'itération sans feedback formalisé.* Aucune Revue d'Échec n'a été conduite.

### Correction ADD

Après chaque échec : stop. Créer une Revue d'Échec. Identifier la phase de cause racine. Changer exactement une variable. Puis ré-exécuter.

---

## AP-3 : Le Déversement de Contexte

### Description

Fournir à l'agent une base de code entière, toute la documentation et chaque référence possible — en espérant qu'il trouvera ce dont il a besoin.

### Symptômes

- Le contexte inclut des fichiers sans rapport avec la tâche.
- La sortie de l'agent référence des parties du code qu'il ne devrait pas toucher.
- L'exécution est lente et coûteuse.
- La qualité de la sortie se dégrade à mesure que la taille du contexte augmente.

### Cause racine

Échec de CONTEXTUALISATION. Le contexte n'a pas été curé.

### Correction ADD

Construire un Pack de Contexte avec uniquement les fichiers, règles et décisions pertinents. En cas de doute, testez : retirez un élément de contexte et vérifiez si la tâche de l'agent est toujours réalisable. Si oui, c'est du bruit — supprimez-le.

---

## AP-4 : La Confiance Aveugle

### Description

Accepter la sortie de l'agent sans vérification parce qu'elle "a l'air bien" ou parce que l'agent a exprimé sa confiance.

### Symptômes

- Aucune Checklist de Validation complétée.
- Bugs découverts après intégration.
- Hallucinations de l'agent trouvées dans le code de production.

### Cause racine

Violation de la Règle 5 : *Jamais de confiance sans porte de vérification.*

### Correction ADD

Compléter la Checklist de Validation pour chaque sortie. Lancer les vérifications automatiques. Pour les tâches à enjeu élevé, faire vérifier par une seconde personne.

---

## AP-5 : Les Poteaux de But Mouvants

### Description

Changer les exigences de la tâche pendant l'exécution — ajouter des fonctionnalités, modifier le périmètre ou changer les contraintes en cours de cycle sans le redémarrer.

### Symptômes

- La sortie de l'agent correspond partiellement aux anciennes exigences et partiellement aux nouvelles.
- Les critères de vérification ne correspondent pas à la sortie finale.
- Confusion sur ce que "terminé" signifie.

### Cause racine

Échec de contrôle du périmètre (Principe 8). Le périmètre a changé mais les artefacts n'ont pas été mis à jour.

### Correction ADD

Si le périmètre change : arrêter le cycle en cours. Mettre à jour le Brief Agent. Mettre à jour la Fiche de Contraintes. Redémarrer depuis CADRER. Ne pas essayer de "patcher" un cycle en cours.

---

## AP-6 : La Piste Fantôme

### Description

Exécuter des tâches agent sans enregistrer ce qui a été fait — pas de logs d'exécution, pas de prompts sauvegardés, pas de traces de validation.

### Symptômes

- "Comment on a implémenté ça ?" — personne ne sait.
- Impossible de reproduire une approche réussie pour des tâches similaires.
- Aucune donnée pour l'amélioration du processus.

### Cause racine

Violation de la Règle 4 : *Jamais de livraison sans log d'exécution.*

### Correction ADD

Logger chaque exécution. Même des logs brefs ont de la valeur. Faire du logging le comportement par défaut, pas l'exception.

---

## AP-7 : La Boucle Infinie

### Description

Itérer indéfiniment sur une tâche qui échoue sans prendre du recul pour questionner l'approche.

### Symptômes

- 5+ itérations sur la même tâche sans convergence.
- Chaque correction introduit un nouveau problème.
- Frustration croissante, qualité de sortie décroissante.

### Cause racine

La mauvaise phase est corrigée. Généralement, la tâche a besoin d'être re-cadrée (CADRER) ou le contexte est fondamentalement insuffisant (CONTEXTUALISER), mais les corrections sont appliquées au niveau CONTRAINDRE ou EXÉCUTER.

### Correction ADD

Après 3 itérations échouées : escalade obligatoire. Retour à CADRER. Demandez-vous : Cette tâche est-elle réalisable telle que définie ? La décomposition est-elle correcte ? Le contexte est-il suffisant ? Souvent, la solution est de diviser la tâche, pas de raffiner le prompt.

---

## AP-8 : L'Illusion d'Automatisation

### Description

Traiter le développement assisté par agent comme un "appuie sur un bouton et obtiens du code" — retirer l'humain de la boucle entièrement.

### Symptômes

- L'agent tourne en autonomie pendant des périodes prolongées sans points de contrôle.
- La sortie n'est revue qu'à la fin.
- De grandes quantités de code sont commitées avec une compréhension humaine minimale.

### Cause racine

Violation du Principe 7 : *La porte humaine prime sur l'autonomie totale.* L'autonomie a été accordée sans confiance acquise.

### Correction ADD

Insérer des portes de vérification à intervalles réguliers. Pour les tâches multi-étapes, vérifier après chaque étape. N'augmenter l'autonomie qu'après un historique de succès constants en première passe.

---

## AP-9 : Le Bypass Expert

### Description

Des ingénieurs expérimentés sautent les artefacts ADD parce qu'ils sentent qu'ils "n'en ont pas besoin" — ils peuvent évaluer la qualité de la sortie intuitivement.

### Symptômes

- Les ingénieurs seniors utilisent les agents sans briefs ni contraintes.
- Qualité de sortie inconsistante corrélée à la complexité de la tâche.
- Les membres juniors de l'équipe ne peuvent pas suivre ni reproduire le processus.

### Cause racine

Confondre compétence individuelle et discipline de processus. ADD ne concerne pas la compétence — il concerne la reproductibilité et la transférabilité.

### Correction ADD

ADD s'applique à tous, quel que soit le niveau de compétence. Les artefacts ne sont pas des petites roues — ce sont des traces d'ingénierie. Les experts bénéficient de la discipline ; les équipes bénéficient des artefacts.

---

## AP-10 : Le Zombie à Templates

### Description

Remplir les artefacts ADD mécaniquement sans réflexion — copier le boilerplate des templates, écrire des critères vagues, cocher les cases sans lire.

### Symptômes

- Les briefs contiennent des déclarations génériques applicables à n'importe quelle tâche.
- Les Fiches de Contraintes ont des critères d'acceptation comme "fonctionne correctement."
- Les Checklists de Validation sont toutes marquées PASS sans détail.

### Cause racine

Traiter ADD comme de la bureaucratie plutôt que de l'ingénierie. Les artefacts sont produits pour la conformité, pas pour la qualité.

### Correction ADD

Les artefacts doivent être revus pour leur spécificité. Un bon test : un inconnu pourrait-il évaluer la sortie en utilisant uniquement la Fiche de Contraintes et la Checklist de Validation ? Si non, les artefacts ne sont pas assez spécifiques.

---

## Référence Rapide

| Anti-Pattern | Phase violée | Règle enfreinte | Correction |
|---|---|---|---|
| Méga-Prompt | CADRER | — | Décomposer en cycles multiples |
| Relance-Prière | VÉRIFIER | Règle 3 | Revue d'Échec avant relance |
| Déversement de Contexte | CONTEXTUALISER | Règle 2 | Curer le contexte impitoyablement |
| Confiance Aveugle | VÉRIFIER | Règle 5 | Compléter la Checklist de Validation |
| Poteaux Mouvants | CADRER | Principe 8 | Redémarrer le cycle au changement de périmètre |
| Piste Fantôme | CONSOLIDER | Règle 4 | Logger chaque exécution |
| Boucle Infinie | CADRER | Règle 3 | Escalader après 3 échecs |
| Illusion d'Automatisation | VÉRIFIER | Principe 7 | Insérer des portes de vérification |
| Bypass Expert | TOUTES | — | ADD s'applique à tous |
| Zombie à Templates | TOUTES | — | Revoir la spécificité |

---

→ Suite : [Démarrage Rapide](09-quick-start.md)
