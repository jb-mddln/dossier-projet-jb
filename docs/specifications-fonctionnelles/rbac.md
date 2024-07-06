# 5. 3 RBAC (Role-Based Access Control)

[< Retour à l'accueil](specifications-fonctionnelles.md) | [Maquettes Web & Mobile](maquettes.md) | [Règles de gestion](regles_de_gestion.md) | [< **RBAC** >](rbac.md)

Le RBAC (Role-Based Access Control) est une méthode de gestion des droits d'accès basée sur les rôles des utilisateurs, permettant de définir précisément les permissions attribuées à chaque type d'utilisateur. Nous avons identifié trois niveaux de rôles : Visiteur, Membre et Administrateur. Cette approche assure une gestion sécurisée et efficace des accès, en garantissant que chaque utilisateur dispose uniquement des droits nécessaires pour ses activités, améliorant ainsi la sécurité et la facilité d'utilisation du système.

| Permissions                                          | Visiteur | Membre | Administrateur |
|------------------------------------------------------|:--------:|:------:|:--------------:|
| **Voir les informations générales du club**          |    ✅    |   ✅   |       ✅       |
| **Voir les événements publics ou promotions**        |    ✅    |   ✅   |       ✅       |
| **S'inscrire comme membre**                          |    ✅    |   ❌   |       ❌       |
| **Réserver des terrains**                            |    ❌    |   ✅   |       ❌       |
| **Modifier une réservation**                         |    ❌    |   ✅   |       ✅       |
| **Annuler une réservation**                          |    ❌    |   ✅   |       ✅       |
| **Rejoindre des groupes de jeu**                     |    ❌    |   ✅   |       ❌       |
| **Créer des groupes de jeu**                         |    ❌    |   ✅   |       ❌       |
| **Utiliser la recherche de partenaire de jeu**       |    ❌    |   ✅   |       ❌       |
| **Accéder à des événements réservés aux membres**    |    ❌    |   ✅   |       ✅       |
| **Consulter son profil personnel**                   |    ❌    |   ✅   |       ✅       |
| **Modifier son profil personnel**                    |    ❌    |   ✅   |       ✅       |
| **Visualiser toutes les réservations**               |    ❌    |   ❌   |       ✅       |
| **Gérer les réservations**                           |    ❌    |   ❌   |       ✅       |
| **Gérer les comptes des membres**                    |    ❌    |   ❌   |       ✅       |
| **Gérer les événements du club**                     |    ❌    |   ❌   |       ✅       |
| **Accéder à des rapports détaillés**                 |    ❌    |   ❌   |       ✅       |
| **Configurer les paramètres du site et de l'appli**  |    ❌    |   ❌   |       ✅       |