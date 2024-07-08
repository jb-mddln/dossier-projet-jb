# 6. 4 Modélisation & Gestion des Données

[< Retour à l'accueil](specifications-techniques.md) | [Proposition technique pour la réalisation du projet](proposition-technique.md) | [Proposition de stratégie de sécurisation](strategie-securisation.md) | [Architecture du projet](architecture-projet.md) | [< **Modélisation & Gestion des Données** >](modelisation-gestion-donnees.md)

Cette section couvre la modélisation et la gestion des données du projet, incluant un dictionnaire de données ainsi que différents schémas de données (MCD[^1], MLD[^2], MPD[^3]) selon la méthode MERISE[^4]. Elle offre à l'équipe une vue claire des entités, de leurs interactions et de leurs types. Ces documents sont 'vivants' et évoluent au fur et à mesure que l'équipe progresse, que les besoins du projet évoluent ou que l'on se rend compte d'éventuels oublis.

## 1. Dictionnaires de Données
Ces dictionnaires de données sont une première ébauche élaborée avec l'équipe, listant les besoins initiaux pour notre application. Il s'agit d'un listing non exhaustif des entités, de leurs attributs (sans définir précisément leurs types), et de leurs relations. Ces documents serviront de base pour les futures évolutions du projet.

<details>
  <summary>Voir les dictionnaires</summary>
    
### Dictionnaires de Données

<details>
  <summary>Voir l'entité Utilisateur : users</summary>
  
### Entité Utilisateur : users
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                                                | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|------------------------------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de l'utilisateur                        | 1                                   |
| last_name         | VARCHAR        | 50       | NOT NULL                                 | Nom de l'utilisateur                                       | Dupont                              |
| first_name        | VARCHAR        | 50       | NOT NULL                                 | Prénom de l'utilisateur                                    | Jean                                |
| email             | VARCHAR        | 100      | UNIQUE, NOT NULL                         | Adresse email de l'utilisateur                             | jean.dupont@example.com             |
| password          | VARCHAR        | 255      | NOT NULL                                 | Mot de passe de l'utilisateur                              | `$2y$10$sH28l1j2nNZ51y40C1SyceN...` |
| role_id           | INT            | -        | FOREIGN KEY REFERENCES roles(id)         | Référence au rôle de l'utilisateur                         | 1                                   |
| membership_start  | DATE           | -        | NULLABLE, DEFAULT NULL                   | Date de début de l'abonnement, si aucune date = pas abonné | 2024-01-01                          |
| membership_end    | DATE           | -        | NULLABLE, DEFAULT NULL                   | Date de fin de l'abonnement, si aucune date = pas abonné   | 2024-12-31                          |
| created_at        | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                | Date de création du compte                                 | 2024-05-24 12:34:56                 |
| updated_at        | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                | Date de la dernière mise à jour du compte                  | 2024-05-24 12:34:56                 |

</details>

<details>
  <summary>Voir l'entité Adresse : users_addresses</summary>

### Entité Adresse : users_addresses
| Attribut          | Type de donnée | Longueur | Contrainte                                 | Description                                                | Exemple                             |
|-------------------|----------------|----------|--------------------------------------------|------------------------------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT                | Identifiant unique de l'adresse                            | 1                                   |
| member_id         | VARCHAR        | 50       | NOT NULL, FOREIGN KEY REFERENCES users(id) | Référence de l'utilisateur                                 | 1                                   |
| address           | VARCHAR        | 255      | NOT NULL                                   | Adresse détaillée                                          | 123 Rue de Paris                    |
| city              | VARCHAR        | 255      | NOT NULL                                   | Ville                                                      | Paris                               |
| country           | VARCHAR        | 255      | NOT NULL                                   | Pays                                                       | France                              |
| zipcode           | VARCHAR        | 20       | NOT NULL                                   | Code postal                                                | 75001                               |

</details>

<details>
  <summary>Voir l'entité Réservation : users_reservations</summary>

### Entité Réservation : users_reservations
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de la réservation    | 1                                   |
| user_id           | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Référence à l'utilisateur               | 1                                   |
| court_id          | INT            | -        | FOREIGN KEY REFERENCES sports_courts(id) | Référence au terrain de sport           | 1                                   |
| reservation_date  | TIMESTAMP      | -        | NOT NULL                                 | Date de la réservation                  | 2024-05-24 12:34:56                 |
| status_id         | INT            | -        | FOREIGN KEY REFERENCES reservation_status(id) | Référence au statut de la réservation   | 1                                   |

</details>

<details>
  <summary>Voir l'entité Disponibilité des Utilisateurs : users_availabilities</summary>

### Entité Disponibilité des Utilisateurs : users_availabilities
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de la disponibilité  | 1                                   |
| user_id           | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Référence à l'utilisateur               | 1                                   |
| day_id            | INT            | -        | FOREIGN KEY REFERENCES days_of_week(id)  | Référence au jour de la semaine         | 1                                   |
| start_time        | TIME           | -        | NOT NULL                                 | Heure de début de disponibilité         | 09:00:00                            |
| end_time          | TIME           | -        | NOT NULL                                 | Heure de fin de disponibilité           | 16:00:00                            |

</details>

<details>
  <summary>Voir l'entité Niveaux de Pratique des Utilisateurs : user_sports</summary>

### Entité Pratique des Utilisateurs : user_sports
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                 |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de la pratique       | 1                       |
| user_id           | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Référence à l'utilisateur               | 1                       |
| sport_id          | INT            | -        | FOREIGN KEY REFERENCES sports(id)        | Référence au sport                      | 1                       |
| practice_level_id | INT            | -        | FOREIGN KEY REFERENCES practice_levels(id) | Référence au niveau de pratique       | 1                       |

</details>

<details>
  <summary>Voir l'entité Évaluation des Utilisateurs : user_ratings</summary>
  
### Entité Évaluation des Utilisateurs : user_ratings
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                                                  | Exemple	                |
|-------------------|----------------|----------|------------------------------------------|--------------------------------------------------------------|-------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de l'évaluation                           | 1                       |
| rating_user_id    | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Identifiant de l'utilisateur qui donne la note               | 1                       |
| rated_user_id     | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Identifiant de l'utilisateur qui reçoit la note              | 2                       |
| rating            | INT            | -        | NOT NULL,								   | Note donnée à l'utilisateur (1 à 5 étoiles)                  | 4                       |
| rating_date       | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                | Date de l'évaluation                                         | 2024-05-24 12:34:56     |
| comment           | TEXT           | -        | NULLABLE                                 | Commentaire optionnel                                        | Très bon joueur         |

</details>

<details>
  <summary>Voir l'entité Bannissement des Utilisateurs : user_bans</summary>
  
### Entité Bannissement des Utilisateurs : user_bans
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                                           | Exemple                                       |
|-------------------|----------------|----------|------------------------------------------|-------------------------------------------------------|-----------------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du bannissement      			   | 1											   |
| banning_user_id   | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Identifiant de l'utilisateur qui fait le bannissement | 1                                             |
| banned_user_id    | INT            | -        | FOREIGN KEY REFERENCES users(id)         | Identifiant de l'utilisateur banni                    | 2                                             |
| reason            | TEXT           | -        | NULLABLE                                 | Raison du bannissement                                | Comportement déplacé et insulte lors du match |
| banned_date       | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                | Date du bannissement                                  | 2024-05-24 12:34:56                           |

</details>

<details>
  <summary>Voir l'entité Sport : sports</summary>

### Entité Sport : sports
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                                                | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|------------------------------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du sport                                | 1                                   |
| sport_name        | VARCHAR        | 50       | UNIQUE, NOT NULL                         | Nom du sport                                               | Badminton                           |

</details>

<details>
  <summary>Voir l'entité Terrain : sports_courts</summary>

### Entité Terrain : sports_courts
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du terrain           | 1                                   |
| sport_id          | INT            | -        | FOREIGN KEY REFERENCES sports(id)        | Référence au sport                      | 1                                   |
| court_name        | VARCHAR        | 50       | UNIQUE, NOT NULL                         | Nom du terrain                          | Terrain de Badminton #1             |

</details>

<details>
  <summary>Voir l'entité Disponibilité des Terrains : sports_court_availabilities</summary>

### Entité Disponibilité des Terrains : sports_court_availabilities
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique de la disponibilité  | 1                                   |
| court_id          | INT            | -        | FOREIGN KEY REFERENCES sports_courts(id) | Référence au terrain de sport           | 1                                   |
| day_id            | INT            | -        | FOREIGN KEY REFERENCES days_of_week(id)  | Référence au jour de la semaine         | 1                                   |
| start_time        | TIME           | -        | NOT NULL                                 | Heure de début de disponibilité         | 09:00:00                            |
| end_time          | TIME           | -        | NOT NULL                                 | Heure de fin de disponibilité           | 16:00:00                            |

</details>

<details>
  <summary>Voir l'entité Rôle : roles</summary>

### Entité Rôle : roles
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du rôle              | 1                                   |
| role_name         | VARCHAR        | 50       | UNIQUE, NOT NULL                         | Nom du rôle                             | user, admin ...                     |

</details>

<details>
  <summary>Voir l'entité Statut de Réservation : reservation_status</summary>

### Entité Statut de Réservation : reservation_status (ou une classe d'enum en dur dans le code)
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                             | Exemple                             |
|-------------------|----------------|----------|------------------------------------------|-----------------------------------------|-------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du statut            | 1                     			   |
| status            | VARCHAR        | 20       | UNIQUE, NOT NULL                         | Nom du statut                           | en cours, confirmée, annulée        |

</details>

<details>
  <summary>Voir l'entité Niveaux de Pratique : practice_levels</summary>
  
### Entité Niveaux de Pratique : practice_levels (ou une classe d'enum en dur dans le code)
| Attribut          | Type de donnée | Longueur | Contrainte                               | Description                              | Exemple									 |
|-------------------|----------------|----------|------------------------------------------|------------------------------------------|------------------------------------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT              | Identifiant unique du niveau de pratique | 1										 |
| level_name        | VARCHAR        | 20       | UNIQUE, NOT NULL                         | Nom du niveau de pratique                | Débutant, Confirmé, Expérimenté, Pro	 |

</details>

<details>
  <summary>Voir l'entité 'Jours de la semaine' : days_of_week</summary>

### Entité 'Jours de la semaine' : days_of_week (ou une classe d'enum en dur dans le code)
| Attribut          | Type de donnée | Longueur | Contrainte                  | Description          | Exemple     |
|-------------------|----------------|----------|-----------------------------|----------------------|-------------|
| id                | INT            | -        | PRIMARY KEY, AUTO_INCREMENT | Identifiant unique   | 1           |
| day_name          | VARCHAR        | 10       | UNIQUE, NOT NULL            | Nom du jour          | Lundi       |

</details>

</details>

## 2. Modèle Conceptuel de Données (MCD)

Le MCD représente les entités et leurs relations de manière abstraite. Il permet de visualiser la structure des données sans se préoccuper des détails techniques.

<details>
  <summary>Voir le MCD</summary>

![MCD](/imgs/mcd.jpg)

</details>

## 3. Modèle Logique de Données (MLD)

Le MLD détaille la structure logique de la base de données en se basant sur le MCD. Il inclut les tables, les colonnes, les types de données et les relations.

<details>
  <summary>Voir le MLD</summary>

![MLD](/imgs/mld.jpg)

</details>

## 4. Modèle Physique de Données (MPD)

Il traduit le MLD en structures spécifiques à un SGBD (Système de Gestion de Bases de Données exemple PostgreSQL), détaillant le stockage, l'indexation et l'accès aux données. Il inclut la définition des tables, index, vues, contraintes et scripts SQL nécessaires.

[Script SQL](script_sql.sql)

<details>
  <summary>Voir le contenu SQL</summary>

  ```sql
  CREATE DATABASE "bads_club" ENCODING "UTF8";

  CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

  CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
  );

  CREATE TABLE sports (
    sport_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
  );

  CREATE TABLE sports_courts (
    court_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    sport_id INTEGER NOT NULL,
    CONSTRAINT fk_sport FOREIGN KEY (sport_id) REFERENCES sports(sport_id)
  );

  CREATE TABLE days_of_week (
    day_id SERIAL PRIMARY KEY,
    day VARCHAR(10) NOT NULL UNIQUE
  );

  CREATE TABLE practice_levels (
    practice_level_id SERIAL PRIMARY KEY,
    level VARCHAR(20) NOT NULL UNIQUE
  );

  CREATE TABLE reservation_status (
    status_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
  );

  CREATE TABLE sports_court_availabilities (
    sport_availability_id SERIAL PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    day_id INTEGER NOT NULL,
    court_id INTEGER NOT NULL,
    CONSTRAINT fk_day FOREIGN KEY (day_id) REFERENCES days_of_week(day_id),
    CONSTRAINT fk_court FOREIGN KEY (court_id) REFERENCES sports_courts(court_id)
  );

  CREATE TABLE users (
    user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    membership_start DATE DEFAULT NULL,
    membership_end DATE DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    role_id INTEGER NOT NULL,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(role_id)
  );

  CREATE TABLE users_addresses (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    zipcode VARCHAR(20) NOT NULL,
    user_uuid UUID NOT NULL,
    CONSTRAINT fk_user_address FOREIGN KEY(user_uuid) REFERENCES users(user_uuid)
  );

  CREATE TABLE users_availabilities (
    user_availability_id SERIAL PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    user_uuid UUID NOT NULL,
    day_id INTEGER NOT NULL,
    CONSTRAINT fk_user_availability FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
    CONSTRAINT fk_day_availability FOREIGN KEY (day_id) REFERENCES days_of_week(day_id)
  );

  CREATE TABLE users_reservations (
    user_reservation_id SERIAL PRIMARY KEY,
    reservation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_uuid UUID NOT NULL,
    court_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    CONSTRAINT fk_user_reservation FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
    CONSTRAINT fk_court_reservation FOREIGN KEY (court_id) REFERENCES sports_courts(court_id),
    CONSTRAINT fk_status_reservation FOREIGN KEY (status_id) REFERENCES reservation_status(status_id)
  );

  CREATE TABLE users_ratings (
    rated_by_user_id UUID NOT NULL,
    rated_user_id UUID NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT DEFAULT NULL,
    rating_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rated_by_user_id, rated_user_id),
    CONSTRAINT fk_rated_by_user FOREIGN KEY (rated_by_user_id) REFERENCES users(user_uuid),
    CONSTRAINT fk_rated_user FOREIGN KEY (rated_user_id) REFERENCES users(user_uuid)
  );

  CREATE TABLE users_bans (
    banned_by_user_id UUID NOT NULL,
    banned_user_id UUID NOT NULL,
    reason TEXT DEFAULT NULL,
    banned_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (banned_by_user_id, banned_user_id),
    CONSTRAINT fk_banned_by_user FOREIGN KEY (banned_by_user_id) REFERENCES users(user_uuid),
    CONSTRAINT fk_banned_user FOREIGN KEY (banned_user_id) REFERENCES users(user_uuid)
  );

  CREATE TABLE user_sports (
    user_uuid UUID NOT NULL,
    sport_id INTEGER NOT NULL,
    practice_level_id INTEGER NOT NULL,
    PRIMARY KEY(user_uuid, sport_id, practice_level_id),
    CONSTRAINT fk_user_sport FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
    CONSTRAINT fk_sport_user FOREIGN KEY (sport_id) REFERENCES sports(sport_id),
    CONSTRAINT fk_practice_level_user FOREIGN KEY (practice_level_id) REFERENCES practice_levels(practice_level_id)
  );
  ```
</details>

[^1]: Modèle Conceptuel de Données, qui représente les entités, leurs attributs et les relations sans spécifier les types de données.
[^2]: Modèle Logique de Données, qui commence à introduire des détails techniques comme les types de données et les contraintes.
[^3]: Modèle Physique de Données, qui décrit comment les données seront stockées physiquement dans la base de données.
[^4]: Méthode MERISE, Méthode d'Étude et de Réalisation Informatique pour les Systèmes d'Entreprise