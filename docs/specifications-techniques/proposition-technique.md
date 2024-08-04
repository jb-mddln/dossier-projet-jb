# 6. 3 Proposition technique pour la réalisation du projet

[< Retour à l'accueil](specifications-techniques.md) | [Proposition de stratégie de sécurisation](strategie-securisation.md) | [<Tableau comparatifs des technos](comparatif-technos.md) | [< **Proposition technique pour la réalisation du projet** >](proposition-technique.md) | [Architecture du projet](architecture-projet.md) | [Modélisation & Gestion des Données](modelisation-gestion-donnees.md)

Le choix de la stack technique est essentiel pour le succès de tout développement. Une stack adéquate garantit performance, évolutivité, maintenabilité et securité. Ce chapitre présente les différentes options de manière non exhaustive et justifie nos choix pour chaque composante clé du projet.

## 👀 Identification des technologies

Pour notre projet, nous avons identifié et retenu les technologies suivantes :

- **PHP** & **Symfony** : Pour le développement back-end de notre API.
- **React** avec **TypeScript** : Pour le développement front-end web & mobile.
- **PostgreSQL** : Pour la gestion de la base de données.
- **Doctrine** : Pour l'ORM, intégré avec Symfony.

### Pourquoi ne pas avoir fait le choix objectif en respectant nos tableaux comparatifs

Pour notre projet, nous avons envisagé plusieurs langages, frameworks et SGBD, comme indiqué dans nos tableaux comparatifs et différents benchmarks. Malheureusement, pour diverses raisons et contraintes, nous avons décidé d'aller à l'encontre de nos comparatifs et de choisir une stack avec laquelle l'équipe avait plus de maîtrise et se sentait plus à l'aise. Ce choix non objectif a été motivé par le besoin de maximiser notre efficacité et de garantir la réussite du projet grâce à l'expertise existante au sein de notre équipe.

#### Pourquoi PHP ?

Nous avons choisi PHP pour plusieurs raisons :
- **Maturité** : PHP est un langage mature avec une vaste communauté et une riche bibliothèque de ressources.
- **Flexibilité** : Adapté pour le développement web, offrant une grande flexibilité dans la création d'applications dynamiques.
- **Large adoption** : PHP reste l'un des langages les plus utilisés pour le développement web.

#### Pourquoi Symfony ?

Nous avons opté pour Symfony en raison de :
- **Robustesse** : Symfony est un framework modulaire et robuste, adapté aux applications complexes.
- **Sécurité** : Symfony intègre par design des sécurités contre certaines menaces du web, telles que la protection contre les attaques CSRF (Cross-Site Request Forgery), les injections SQL, et l'utilisation de mécanismes de sécurité pour l'authentification et l'autorisation des utilisateurs.
- **Documentation et support** : Bénéficie d'une documentation exhaustive et d'une large communauté de développeurs.
- **Intégration de composants** : Symfony offre des composants réutilisables, facilitant la maintenance et l'évolution de l'application.

#### Préférence personnelle

Notre choix pour PHP et Symfony s'explique également par nos préférences personnelles. Toute l'équipe utilise ces technologies couramment dans nos entreprises respectives. PHP et Symfony étaient un des choix sur lesquels toute l'équipe était d'accord et à l'aise. Compte tenu des contraintes du projet et du temps imparti, nous avons opté pour cette stack afin de faciliter le travail de tous.

## 🛠 Choix de l'API

Nous avons décidé d'opter pour une API de type **REST** (Representational State Transfer). Les API dites REST doivent suivre une ligne directrice composée de six grands principes :

- **Client-Serveur** : Séparation des préoccupations entre le client, qui consomme le service, et le serveur, qui le fournit. Cela permet une évolution indépendante de chaque partie.
- **Stateless** : Chaque requête du client au serveur doit contenir toutes les informations nécessaires pour comprendre et traiter la requête. Le serveur ne stocke pas d'état client entre les requêtes, ce qui simplifie la gestion et améliore la scalabilité.
- **Cacheable** : Les réponses du serveur doivent indiquer si elles sont cacheables ou non. Cela permet aux clients de stocker en cache les réponses pour améliorer les performances et réduire la charge du serveur.
- **Interface Uniforme** : Utilisation d'une interface uniforme pour interagir avec les ressources. Cela inclut l'utilisation des méthodes HTTP standard (GET, POST, PUT, DELETE) et des URL spécifiques pour identifier les ressources.
- **Système en Couches** : L'architecture peut être composée de plusieurs couches hiérarchiques, chaque couche ayant un rôle distinct. Cela permet de gérer les aspects comme la sécurité, la mise en cache et le traitement des requêtes de manière modulaire.
- **Code à la Demande (facultatif)** : Les serveurs peuvent étendre ou personnaliser temporairement les fonctionnalités du client en transférant du code exécutable, comme des scripts JavaScript.

Nous avons choisi une API REST pour les avantages suivants :

- **Compatibilité Universelle** : Utilise les protocoles HTTP standards, ce qui facilite l'intégration avec diverses applications et dispositifs.
- **Facilité d'Évolution** : Permet de modifier et d'ajouter des ressources sans affecter les clients existants, assurant une évolutivité à long terme.
- **Optimisation des Performances** : Capacité à gérer efficacement un grand nombre de requêtes simultanées grâce à la statelessness et au cache.
- **Clarté Structurelle** : Chaque ressource a une URL spécifique, simplifiant la conception et la gestion de l'API.
- **Sécurité** : Une API REST est souvent plus sécurisée car elle utilise des méthodes standardisées pour la communication et peut facilement intégrer des protocoles de sécurité comme OAuth/JWT pour l'authentification et TLS/SSL pour le chiffrement des données en transit. De plus, la nature stateless de REST réduit le risque de certaines attaques, comme les détournements de session.

## 🎨 Choix du Framework Front-End

Nous avons choisi React couplé à TypeScript pour notre projet. React est très populaire pour sa flexibilité et son efficacité dans la création d'interfaces utilisateur complexes et dynamiques. L'ajout de TypeScript apporte une vérification de typage au code, ce qui améliore la qualité et réduit les erreurs. Cette combinaison offre une structure solide et une meilleure maintenabilité.

## 📑 Choix de la base de données

Nous avons choisi **PostgreSQL** pour notre projet en raison de ses nombreux avantages. PostgreSQL est reconnu pour sa robustesse, sa capacité à gérer de grandes quantités de données et ses fonctionnalités avancées telles que les transactions ACID (Atomicité, Cohérence, Isolation et Durabilité) et la gestion des types de données complexes.

## Conclusion

Bien que nous n'ayons pas strictement suivi nos benchmarks, nous avons veillé à ce que nos choix soient cohérents et adaptés à notre projet, tout en prenant en compte les aspects de sécurité. Cette combinaison nous permet de bénéficier de technologies robustes, bien documentées et largement supportées par la communauté, avec lesquelles l'équipe se sent à l'aise, assurant ainsi la réussite et la pérennité de notre projet.

## Ressources

- [Une API REST, qu'est-ce que c'est ?](https://www.redhat.com/fr/topics/api/what-is-a-rest-api)