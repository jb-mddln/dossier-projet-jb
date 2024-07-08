# 6. 3 Architecture du projet

[< Retour à l'accueil](specifications-techniques.md) | [Proposition technique pour la réalisation du projet](proposition-technique.md) | [Proposition de stratégie de sécurisation](strategie-securisation.md) | [< **Architecture du projet** >](architecture-projet.md) | [Modélisation & Gestion des Données](modelisation-gestion-donnees.md)

Lors de la conception de l'architecture de notre projet, plusieurs options se présentaient à nous :

- **Architecture Monolithique** : Une seule application intégrée, simple à déployer mais difficile à scaler et à maintenir au fil du temps.
- **Architecture Microservices** : Séparation des fonctionnalités en services indépendants, facilitant la scalabilité et la résilience, mais complexifiant le déploiement et la gestion.
- **Architecture N-tiers** : Séparation de l'application en plusieurs couches logiques (présentation, logique métier, persistance des données), offrant un bon équilibre entre modularité, maintenabilité et évolutivité.

Nous avons choisi d'opter pour une **architecture N-tiers** en raison de ses avantages suivants :

- **Modularité** : Chaque couche de l'application peut être développée, testée et déployée indépendamment.
- **Maintenabilité** : La séparation des préoccupations facilite la mise à jour et la correction des bugs.
- **Évolutivité** : Les couches peuvent évoluer indépendamment, permettant d'améliorer les performances et d'ajouter de nouvelles fonctionnalités sans perturber l'ensemble du système.
- **Sécurité** : Cette architecture améliore la sécurité en restreignant l'accès direct aux données sensibles et en gérant les permissions à travers plusieurs couches, ce qui renforce la protection des informations critiques.

## Vue d'ensemble de l'architecture

- **Couche de présentation** : Interface utilisateur pour le web (React) et mobile (React Native).
- **Couche de logique métier** : API back-end développée en PHP avec Symfony.
- **Couche de persistance des données** : Base de données PostgreSQL.

![N-TIERS](/imgs/n-tiers.png)

## Conclusion

L'architecture du projet est conçue pour être modulaire, évolutive, et maintenable, tout en intégrant des mesures de sécurité à chaque couche. Chaque composant, du front-end au back-end en passant par la couche de persistance des données, est soigneusement intégré pour garantir une performance optimale, une sécurité renforcée et une expérience utilisateur fluide.