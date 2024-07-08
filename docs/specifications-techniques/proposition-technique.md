# 6. 1 Proposition technique pour la réalisation du projet

[< Retour à l'accueil](specifications-techniques.md) | [< **Proposition technique pour la réalisation du projet** >](proposition-technique.md) | [Proposition de stratégie de sécurisation](strategie-securisation.md) | [Architecture du projet](architecture-projet.md) | [Modélisation & Gestion des Données](modelisation-gestion-donnees.md)

Le choix de la stack technique est essentiel pour le succès de tout développement. Une stack adéquate garantit performance, évolutivité et maintenabilité. Ce chapitre présente les différentes options de manière non exhaustive et justifie nos choix pour chaque composante clé du projet.

## 👀 Identification des technologies

Pour notre projet, nous avons identifié et retenu les technologies suivantes :

- **PHP** & **Symfony** : Pour le développement back-end de notre API.
- **React** avec **TypeScript** : Pour le développement front-end.
- **PostgreSQL** : Pour la gestion de la base de données.
- **Doctrine** : Pour l'ORM, intégré avec Symfony.

### Pourquoi PHP & Symfony ?

Pour notre projet, nous avons envisagé plusieurs langages et frameworks. Voici un aperçu des alternatives disponibles et les raisons de notre choix pour PHP associé à Symfony.

#### Langages disponibles

- **C#** : Puissant et performant, souvent utilisé avec .NET pour des applications Windows et web.
- **Node.js** : Permet de construire des applications scalables et hautement performantes en JavaScript.

#### Pourquoi PHP ?

Nous avons choisi PHP pour plusieurs raisons :
- **Maturité** : PHP est un langage mature avec une vaste communauté et une riche bibliothèque de ressources.
- **Flexibilité** : Adapté pour le développement web, offrant une grande flexibilité dans la création d'applications dynamiques.
- **Large adoption** : PHP reste l'un des langages les plus utilisés pour le développement web.

#### Frameworks PHP disponibles

- **Laravel** : Connu pour sa simplicité et son élégance, offrant une courbe d'apprentissage douce et une multitude d'outils intégrés.
- **Symfony** : Framework robuste et modulaire, idéal pour des applications complexes nécessitant une architecture bien définie.
- **CodeIgniter** : Framework léger, parfait pour les petites applications nécessitant une configuration minimale.

#### Pourquoi Symfony ?

Nous avons opté pour Symfony en raison de :
- **Robustesse** : Symfony est un framework modulaire et robuste, adapté aux applications complexes.
- **Documentation et support** : Bénéficie d'une documentation exhaustive et d'une large communauté de développeurs.
- **Intégration de composants** : Symfony offre des composants réutilisables, facilitant la maintenance et l'évolution de l'application.

#### Préférence personnelle

Notre choix pour PHP et Symfony s'explique également par nos préférences personnelles. Toute l'équipe utilise ces technologies couramment dans nos entreprises respectives. PHP et Symfony étaient un des choix sur lesquels toute l'équipe était d'accord et à l'aise. Compte tenu des contraintes du projet et du temps imparti, nous avons opté pour cette stack afin de faciliter le travail de tous.

## 🛠 Choix de l'API

Notre API sera une **API RESTful**. Une API RESTful est une interface qui adhère aux principes de l'architecture REST (Representational State Transfer). Les principaux principes de REST incluent :

- **Client-Serveur** : Séparation des préoccupations entre le client (qui consomme le service) et le serveur (qui fournit le service).
- **Stateless** : Chaque requête du client au serveur doit contenir toutes les informations nécessaires pour comprendre et traiter la requête. Le serveur ne stocke pas d'état client entre les requêtes.
- **Cacheable** : Les réponses doivent indiquer si elles sont cacheables ou non, permettant aux clients de stocker en cache les réponses pour améliorer les performances.
- **Uniform Interface** : Utilisation d'une interface uniforme pour interagir avec les ressources, généralement via des URL spécifiques, en utilisant les méthodes HTTP standard (GET, POST, PUT, DELETE).
- **Layered System** : L'architecture peut être composée de plusieurs couches hiérarchiques, chaque couche ayant un rôle distinct.
- **Code on Demand (facultatif)** : Les serveurs peuvent temporairement étendre ou personnaliser les fonctionnalités du client en transférant du code exécutable.

Nous avons choisi une API RESTful en raison de ses avantages suivants :

- **Compatibilité universelle** : Utilise les protocoles HTTP standards, ce qui facilite l'intégration avec diverses applications et dispositifs.
- **Facilité d'évolution** : Permet de modifier et d'ajouter des ressources sans affecter les clients existants.
- **Optimisation des performances** : Capacité à gérer efficacement un grand nombre de requêtes simultanées.
- **Clarté structurelle** : Chaque ressource a une URL spécifique, simplifiant la conception et la gestion de l'API.

## 🎨 Choix du Framework Front-End

Pour la partie front-end, plusieurs frameworks s'offraient à nous :

- **React** : Framework JavaScript développée par Facebook, axée sur la création d'interfaces utilisateur dynamiques avec des composants réutilisables.
- **Vue.js** : Framework progressif, facile à intégrer et à apprendre, idéal pour des applications de petite à moyenne envergure.
- **Angular** : Framework complet pour le développement de SPAs, souvent utilisé pour des applications d'entreprise complexes.

Nous avons choisi React couplé à TypeScript pour notre projet. React est très populaire pour sa flexibilité et son efficacité dans la création d'interfaces utilisateur complexes et dynamiques. L'ajout de TypeScript apporte une vérification de typage au code, ce qui améliore la qualité et réduit les erreurs. Cette combinaison offre une structure solide et une meilleure maintenabilité.

## 📑 Choix de la base de données

Pour la gestion des données, plusieurs systèmes de gestion de base de données (SGBD) sont disponibles :

- **MySQL** : SGBD très populaire, connu pour sa simplicité et sa rapidité.
- **PostgreSQL** : SGBD open source puissant, reconnu pour sa robustesse et ses fonctionnalités avancées.
- **MongoDB** : Base de données NoSQL, idéale pour des applications nécessitant une grande flexibilité dans le stockage des données.

Nous avons choisi **PostgreSQL** pour notre projet en raison de ses nombreux avantages. PostgreSQL est reconnu pour sa robustesse, sa capacité à gérer de grandes quantités de données et ses fonctionnalités avancées telles que les transactions ACID (Atomicité, Cohérence, Isolation et Durabilité) et la gestion des types de données complexes.

## Conclusion

En conclusion, nous avons choisi une stack technologique composée de PHP avec Symfony pour le backend, React avec TypeScript pour le frontend, et PostgreSQL pour la base de données. Cette combinaison nous permet de bénéficier de technologies robustes, bien documentées et largement supportées par la communauté, avec lesquelles l'équipe se sent à l'aise, assurant ainsi la réussite et la pérennité de notre projet.