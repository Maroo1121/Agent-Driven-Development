# Philosophie — Pourquoi ADD Existe

## Le Vide

L'ingénierie logicielle a évolué à travers une série de percées méthodologiques, chacune répondant à une classe spécifique de problèmes :

- **La Programmation Structurée** (années 1960) a résolu le chaos du code à base de goto.
- **La Conception Orientée Objet** (années 1980) a résolu le chaos des données et comportements non structurés.
- **Le Test-Driven Development** (2003) a résolu le chaos du code non testé et sujet aux régressions.
- **Le Domain-Driven Design** (2003) a résolu le chaos du désalignement entre le logiciel et les modèles métier.
- **Le Behavior-Driven Development** (2006) a résolu le chaos des spécifications déconnectées des tests.

Chaque méthodologie est née quand une nouvelle capacité a dépassé la discipline pour l'utiliser. Aujourd'hui, cette capacité est **les agents IA**.

## L'État Actuel

En 2025-2026, les agents IA sont puissants. Les modèles de fondation peuvent générer du code, analyser des données, refactorer des architectures et orchestrer des workflows multi-étapes. Des frameworks comme LangChain, AutoGen, CrewAI et Claude Code fournissent un outillage sophistiqué.

Mais l'outillage sans méthodologie produit des échecs prévisibles :

- **Incohérence** : La même tâche produit des résultats radicalement différents selon la formulation du prompt.
- **Dérive contextuelle** : Sur les sessions longues, les agents perdent leur cohérence à mesure que la fenêtre de contexte se remplit de bruit.
- **Hypothèses hallucinées** : Les agents comblent les lacunes du contexte avec des informations fabriquées mais plausibles.
- **Non-reproductibilité** : Une interaction réussie ne peut pas être reproduite de manière fiable ni transférée à un autre ingénieur.
- **Échecs silencieux** : Un output qui *semble* correct mais viole silencieusement des contraintes ou introduit des bugs subtils.

Ce ne sont pas des problèmes d'agents. Ce sont des **problèmes de méthodologie**.

## L'Insight Fondateur

La cause racine est toujours la même : l'humain n'a pas structuré l'interaction correctement.

Après des centaines de sessions de développement assisté par agent, un pattern émerge. La qualité de l'output est déterminée par trois facteurs, dans cet ordre :

1. **La qualité du contexte** — L'agent a-t-il la bonne information ?
2. **La précision des contraintes** — L'agent sait-il ce qu'il doit et ne doit pas faire ?
3. **La rigueur de la vérification** — L'humain peut-il vérifier l'output contre des critères explicites ?

Le prompt lui-même — la partie sur laquelle la plupart des gens se focalisent — est le facteur *le moins* important.

Cet insight est la fondation de ADD : **discipliner le processus, pas le prompt.**

## Ce Que Propose ADD

ADD est une méthodologie — un processus structuré, répétable et transmissible pour travailler avec des agents IA en développement logiciel.

Il fournit :

- Un **cycle** (Cadrer → Contextualiser → Contraindre → Exécuter → Vérifier → Consolider) qui garantit que chaque interaction agent est structurée.
- Des **artefacts** (Briefs Agent, Packs de Contexte, Fiches de Contraintes, Logs d'Exécution) qui garantissent que chaque interaction est documentée.
- Des **règles** (les Cinq Jamais) qui garantissent un niveau minimum de qualité pour chaque interaction.
- Un **modèle de maturité** (N1→N4) qui fournit un chemin de progression du prompting ad-hoc vers la pratique d'ingénierie.

ADD ne remplace pas les frameworks d'agents. Il structure la manière dont vous les utilisez — de la même façon que TDD structure la manière dont vous écrivez des tests, quel que soit votre framework de test.

## Pour Qui est ADD

- **Les développeurs solo** utilisant des outils CLI agentiques (Claude Code, Cursor, GitHub Copilot Workspace) qui veulent des résultats fiables et reproductibles.
- **Les équipes** intégrant des agents IA dans leur workflow de développement qui ont besoin de standards partagés et de portes qualité.
- **Les tech leads et architectes** qui doivent gouverner l'usage des agents dans les équipes sans bloquer la productivité.
- **Les organisations** construisant des pratiques de développement agent-native qui ont besoin d'une méthodologie auditable et évolutive.

## Le Positionnement

ADD se situe à une couche spécifique dans la stack de développement :

```
Méthodologie Produit      (Scrum, Shape Up, Lean)
        ↕
Agent-Driven Development (ADD)     ← couche méthodologique
        ↕
Frameworks d'Agents      (LangChain, AutoGen, Claude Code)
        ↕
Modèles de Fondation     (Claude, GPT, Gemini)
```

Il est complémentaire — et non concurrent — aux pratiques d'ingénierie existantes. ADD fonctionne aux côtés de TDD, DDD et BDD. En fait, il les amplifie : un agent opérant sous les principes ADD peut être dirigé pour suivre les pratiques TDD au sein de la phase d'exécution.

## L'Ambition

ADD vise à devenir la méthodologie standard d'ingénierie pour le développement assisté par agents, de la même façon que TDD est devenu le standard pour le développement test-first.

Non pas parce que c'est la seule façon de travailler avec des agents. Mais parce que **l'usage non discipliné d'agents à l'échelle est un passif**, et que l'industrie a besoin d'un vocabulaire partagé, de standards partagés et de portes qualité partagées pour rendre le développement assisté par agents fiable, auditable et transférable.

---

→ Suite : [Le Cycle ADD](02-cycle.md)
