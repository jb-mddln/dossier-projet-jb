# 6. 2 Tableau comparatifs des technos

[< Retour à l'accueil](specifications-techniques.md) | [Proposition de stratégie de sécurisation](strategie-securisation.md) | [< **Tableau comparatifs des technos** >](comparatif-technos.md) | [Proposition technique pour la réalisation du projet](proposition-technique.md) | [Architecture du projet](architecture-projet.md) | [Modélisation & Gestion des Données](modelisation-gestion-donnees.md)

Lors des phases de réflexion, nous avons mis en place différents tableaux comparatifs pour diverses stacks de développement, couvrant les différents aspects du projet (back-end, front-end, SGBD). Ces tableaux listent différents points que nous jugeons importants et nous permettent d'avoir une vision globale, ainsi que de nous guider dans le choix de la stack la plus adaptée aux besoins de notre projet.

Notre notation va de 1 à 3, où 1 représente la note la plus basse et 3 la plus élevée. Elle est basée sur nos observations et recherches, visant à fournir une évaluation objective et concise des technologies.

## Comparatif des Langages Back-end pour notre API

| Critères                 | JS (Node.js)        | PHP       | C# (ASP.NET Core) |
| ------------------------ | ------------------- | --------- | ----------------- |
| Maturité                 | 2                   | 3         | 1                 |
| Performance              | 3                   | 2         | 3                 |
| Facilité d'apprentissage | 3                   | 3         | 2                 |
| Documentation            | 3                   | 3         | 3                 |
| Communauté               | 2                   | 3         | 1                 |
| Popularité               | 2                   | 1         | 3                 |
| Écosystème de librairies | 3                   | 3         | 3                 |
| Scalabilité              | 3                   | 2         | 3                 |
| Sécurité                 | 2                   | 2         | 3                 |
| Coût                     | Gratuit             | Gratuit   | Gratuit           |
| Licence                  | MIT                 | GPL/MIT   | MIT               |
| Total                    | 23                  | 22        | 22                |

### Comparatif des Frameworks Front-end pour notre Interface Utilisateur

| Critères                 | React             | Angular         | Vue.js        |
| ------------------------ | ----------------- | --------------- | ------------- |
| Maturité                 | 2                 | 3               | 1             |
| Performance              | 3                 | 3               | 2             |
| Facilité d'apprentissage | 2                 | 1               | 3             |
| Documentation            | 3                 | 3               | 3             |
| Communauté               | 3                 | 2               | 1             |
| Popularité               | 3                 | 2               | 3             |
| Écosystème de librairies | 3                 | 3               | 2             |
| Scalabilité              | 3                 | 3               | 2             |
| Sécurité                 | 2                 | 3               | 2             |
| Coût                     | Gratuit           | Gratuit         | Gratuit       |
| Licence                  | MIT               | MIT             | MIT           |
| Total                    | 24                | 23              | 19            |

### Comparatif des Systèmes de Gestion de Bases de Données (SGBD) pour notre Application

| Critères                 | MySQL             | PostgreSQL      | MariaDB       |
| ------------------------ | ----------------- | --------------- | ------------- |
| Maturité                 | 3                 | 3               | 2             |
| Performance              | 3                 | 3               | 3             |
| Facilité d'apprentissage | 3                 | 2               | 3             |
| Documentation            | 3                 | 3               | 3             |
| Communauté               | 3                 | 3               | 3             |
| Popularité               | 3                 | 2               | 2             |
| Écosystème de librairies | 3                 | 3               | 3             |
| Scalabilité              | 3                 | 3               | 3             |
| Sécurité                 | 2                 | 3               | 2             |
| Coût                     | Gratuit           | Gratuit         | Gratuit       |
| Licence                  | GPL               | PostgreSQL      | GPL           |
| Total                    | 29                | 28              | 27            |

### Comparatif des Frameworks PHP pour notre Application

| Critères                 | Symfony           | Laravel         | CodeIgniter   |
| ------------------------ | ----------------- | --------------- | ------------- |
| Maturité                 | 3                 | 2               | 3             |
| Performance              | 3                 | 3               | 2             |
| Facilité d'apprentissage | 2                 | 3               | 3             |
| Documentation            | 3                 | 3               | 3             |
| Communauté               | 3                 | 3               | 2             |
| Popularité               | 2                 | 3               | 2             |
| Écosystème de librairies | 3                 | 3               | 2             |
| Scalabilité              | 3                 | 3               | 2             |
| Sécurité                 | 3                 | 2               | 2             |
| Coût                     | Gratuit           | Gratuit         | Gratuit       |
| Licence                  | MIT               | MIT             | MIT           |
| Total                    | 28                | 28              | 24            |

### Explication des Critères

- **Maturité** : Évalue l'ancienneté et la stabilité de la technologie.
- **Performance** : Mesure l'efficacité et la rapidité de la technologie.
- **Facilité d'apprentissage** : Indique à quel point il est facile pour les nouveaux développeurs de maîtriser la technologie.
- **Documentation** : Qualité et exhaustivité des ressources documentaires.
- **Communauté** : Taille et activité de la communauté de développeurs.
- **Popularité** : Adoption et utilisation de la technologie dans l'industrie.
- **Écosystème de librairies** : Disponibilité et qualité des bibliothèques et outils complémentaires.
- **Scalabilité** : Capacité de la technologie à gérer des charges de travail croissantes.
- **Sécurité** : Fonctionnalités de sécurité intégrées.
- **Coût** : Coût d'utilisation de la technologie.
- **Licence** : Type de licence, influençant l'utilisation commerciale et les contributions.

## Ressources

- [TIOBE Index for July 2024](https://www.tiobe.com/tiobe-index/)
- [Javascript Framework - Popularity Trends](https://ossinsight.io/collections/javascript-framework/trends/)