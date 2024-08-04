# 6. 1 Proposition de stratégie de sécurisation

[< Retour à l'accueil](specifications-techniques.md) | [< **Proposition de stratégie de sécurisation** >](strategie-securisation.md) | [Tableau comparatifs des technos](comparatif-technos.md) | [Proposition technique pour la réalisation du projet](proposition-technique.md) | [Architecture du projet](architecture-projet.md) | [Modélisation & Gestion des Données](modelisation-gestion-donnees.md)

L'application traitera des données personnelles sensibles, ce qui soulève des enjeux de sécurité importants. Nous avons élaboré une stratégie de sécurisation multicouche en suivant les recommandations de l’ANSSI, de la CNIL et en respectant les réglementations en vigueur, notamment ceux du RGPD[^1]. Notre approche se concentre sur trois aspects principaux : la prévention, la détection et la réponse aux menaces.

1. **Prévention** : Mise en œuvre des bonnes pratiques de développement sécurisé dès les premières phases de conception de notre application.
2. **Détection** : Mise en place de systèmes de journalisation et de surveillance des logs pour détecter efficacement toute erreur, problème ou activité suspecte.
3. **Réaction** : Mise en œuvre un protocole de réponse rapide en cas de détection d’une menace permettant de minimiser l’impact.

## Enjeux de sécurité et principales menaces

Les principales menaces identifiées :

- **Cross-Site Scripting (XSS)** : Injection de code malveillant dans les pages web.
- **Cross-Site Request Forgery (CSRF)** : Forçage d'exécution d'actions non désirées.
- **Injection SQL (SQLi)** : Accès, manipulation ou suppression de données sensibles.
- **Denial of Service (DoS/DDoS)** : Surcharge du serveur avec un volume élevé de requêtes.

## Stratégie de sécurisation

Avant de détailler les mesures spécifiques, il est important d’introduire trois concepts fondamentaux de notre stratégie de sécurisation, qui est le concept des « trois piliers » :

1. **Défense en profondeur** : Mise en place de plusieurs niveaux de sécurité pour chaque couche de l'application, de l'interface utilisateur aux données stockées, créant ainsi des barrières successives contre les attaques.
2. **Réduction de la surface d’attaque** : Limiter les points d'entrée pour minimiser les opportunités d'attaque en simplifiant l'architecture, en désactivant les services inutilisés et en appliquant les mises à jour de sécurité. Dans notre projet, cela inclut la limitation des ports ouverts à HTTP/HTTPS (ports 80 et 443), SSH (port 22) et PostgreSQL (port 5432).
3. **Principe de moindre privilège** : Limiter les droits d'accès aux seules permissions nécessaires pour chaque utilisateur, assurant ainsi que les utilisateurs lambda n'ont pas accès aux données administratives.

Symfony et React, accompagnés de TypeScript, offrent déjà plusieurs fonctionnalités et pratiques de sécurisation alignées sur les recommandations du guide de l’ANSSI, telles que la protection contre les attaques CSRF, XSS et SQLi, ainsi que la gestion des accès basés sur les rôles (RBAC). Cependant, il est crucial de rester vigilant et d'apporter des ajouts à ces mesures déjà présentes pour garantir une sécurité optimale.

### Role Based Access Control (RBAC)

Implémentation d'un contrôle d'accès basé sur les rôles pour restreindre l'accès aux fonctionnalités et aux informations sensibles.

### Tunnels de sécurisation (HTTPS/TLS/HSTS)

Utilisation de HTTPS pour chiffrer toutes les communications, garantissant la confidentialité des données.

### Sécurisation de l’API

- **JWT (Jetons Web JSON)** : Restriction d'accès à l'API aux utilisateurs autorisés.
- **Limitation des requêtes** : Limitation du nombre d'appels à l'API par utilisateur pour prévenir les abus.
- **Monitoring** : Surveillance continue pour détecter les comportements suspects.

### Sécurisation et validation des données des formulaires

Application de techniques de nettoyage et de validation des données à la fois sur le front-end et le back-end pour prévenir les injections SQL et XSS.

### Stratégies de sécurité web modernes

- **SOP (Same-Origin Policy)** : Prévention des attaques XSS.
- **CORS (Cross-Origin Resource Sharing)** : Sécurisation du partage de ressources entre différentes origines.
- **CSP (Content Security Policy)** : Définition de sources de contenu autorisées pour prévenir les attaques XSS.
- **SRI (Sub Resource Integrity)** : Vérification de l'intégrité des ressources chargées depuis des origines tierces.

### Sécurité de l’authentification et des sessions

- **Politique de mots de passe** : Imposition de mots de passe complexes et sécurisés.
- **Gestion des sessions** : Limitation de la durée des sessions, durée de validité de deux semaines, avec obligation de se reconnecter pour les actions sensibles telles que les paiements, les réservations et les changements de mot de passe. 
- **Utilisation de JWT**.

### Journalisation et rapport des événements

Intégration d'un système de journalisation pour suivre et enregistrer les activités importantes de l'application, détecter les comportements suspects et diagnostiquer les problèmes.

### Stratégie de sauvegarde

Réalisation de sauvegardes complètes quotidiennes, idéalement la nuit, et de sauvegardes partielles fréquentes, deux à trois fois par jour, pour protéger les données contre les incidents.

### Politique de rétention pour les sauvegardes

La politique de rétention des sauvegardes de notre application est conçue pour se conformer aux lois françaises et européennes et respecter les différentes recommandations des divers guides (ANSSI, CNIL, RGPD...).

Nous adoptons une approche systématique pour garantir que les données sont conservées pendant une durée appropriée, répondant ainsi aux exigences légales et opérationnelles.

1. **Durée de rétention** : Durée de rétention : Selon le type de données, le temps de conservation n'est pas le même et peut varier d'un an jusqu'à sept ans pour notre application.
   
2. **Rétention par type de données** :
   - **Données transactionnelles** : Conservées pendant 7 ans pour se conformer aux obligations fiscales et comptables.
   - **Données utilisateurs** : Conservées pendant 3 ans après la fin de la relation contractuelle, conformément aux recommandations de la CNIL.
   - **Logs de sécurité et d'accès** : Conservés pendant 1 an pour permettre la détection et la réponse aux incidents de sécurité, comme recommandé par l'ANSSI.
   
3. **Automatisation** : Utilisation d'outils de gestion des sauvegardes pour automatiser les processus de rétention, garantissant la suppression sécurisée et régulière des données expirées.

4. **Révision régulière** : La politique de rétention est réévaluée annuellement pour s'assurer qu'elle reste conforme aux dernières exigences légales et aux meilleures pratiques.

### Conformité RGPD

- **Consentement explicite** : Obtention du consentement clair des utilisateurs pour le traitement de leurs données.
- **Politique de Confidentialité** : Information claire et accessible aux utilisateurs sur la manière dont leurs données sont collectées, utilisées et protégées.
- **Minimisation des données** : Collecte uniquement des informations essentielles.
- **Droits des utilisateurs** : Information sur leurs droits, y compris l'accès, la rectification et l'effacement des données.
- **Sécurité des données** : Mise en place de mesures robustes pour protéger les données contre les accès non autorisés et les pertes.
- **Gestion des sous-traitants** : Conformité des traitements des paiements par des tiers avec le RGPD.
- **Notification des violations** : Obligation de notifier les autorités de protection des données et les utilisateurs en cas de violation de données personnelles dans les 72 heures.

## Conclusion

Notre stratégie de sécurisation repose sur des principes solides et des pratiques recommandées pour assurer la protection optimale des données sensibles de nos utilisateurs et garantir la fiabilité et la pérennité de l'application.

## Ressources

- [ANSSI - Recommandations pour la mise en œuvre d’un site web](https://cyber.gouv.fr/sites/default/files/2013/05/anssi-guide-recommandations_mise_en_oeuvre_site_web_maitriser_standards_securite_cote_navigateur-v2.0.pdf)
- [ANSSI - Recommandations relatives à l’authentification multifacteur et aux mots de passe](https://cyber.gouv.fr/sites/default/files/2021/10/anssi-guide-authentification_multifacteur_et_mots_de_passe.pdf)
- [CNIL - Mots de passe : une nouvelle recommandation pour maîtriser sa sécurité](https://www.cnil.fr/fr/mots-de-passe-une-nouvelle-recommandation-pour-maitriser-sa-securite)
- [Guide RGPD du développeur](https://lincnil.github.io/Guide-RGPD-du-developpeur/)
- [CNIL - Guide pratique RGPD](https://www.cnil.fr/sites/cnil/files/atoms/files/cnil_guide_securite_des_donnees_personnelles-2023.pdf)
- [Les 9 plus grands risques de sécurité des applications mobiles et comment les prévenir](https://datadome.co/fr/menaces/9-plus-grands-risques-de-securite-des-applications-mobiles-et-comment-les-prevenir/#poor-api-protection)

[^1]: Règlement général sur la protection des données.