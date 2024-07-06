# 5. 2 Règles de gestion

[< Retour à l'accueil](specifications-fonctionnelles.md) | [Maquettes Web & Mobile](maquettes.md) | [< **Règles de gestion** >](regles_de_gestion.md) | [RBAC](rbac.md)

Les règles de gestion, également appelées règles métier, sont essentielles pour assurer la cohérence et l'efficacité des opérations. Elles sont des contraintes qui s'appliquent à une action, une activité ou un processus de l'entreprise. Ces règles peuvent être imposées par l'entreprise/le client ou définies par l'équipe en charge de la conception/développement du projet.

## 👥 Profil Membre

- **Nom** : Le profil contient un nom.
- **Prénom** : Le profil contient un prénom.
- **Pseudo** : Utilisé pour les propositions d'adversaires, offrant anonymat ou personnalisation.
- **Photo (facultatif)** : Les membres peuvent ajouter une photo de profil.
- **Adresse Email** : Utilisée pour la communication et la récupération de compte.
- **Mot de Passe** : Doit être sécurisé, avec au moins 8 caractères incluant des chiffres, des lettres majuscules et minuscules, et des symboles.
- **Profil Public/Privé** : Les membres peuvent choisir d'être visibles ou non dans les propositions d'adversaires.

## 🔐 Gestion de l'Authentification

- **Authentification Sécurisée** : Vérification du mot de passe requise.
- **Sécurité des Sessions** : Les sessions expirent après 2 semaines d'inactivité.
- **Ré-authentification** : Requise pour les actions sensibles comme le changement d'email, de mot de passe, ou pour effectuer des paiements.

## 📅 Gestion de l'Abonnement

- **Accès aux Fonctionnalités** : Les fonctionnalités avancées nécessitent un abonnement.
- **Paiement Sécurisé** : Les paiements sont sécurisés et automatisés.
- **Renouvellement Automatique** : Les abonnements se renouvellent et sont facturés mensuellement.
- **Annulation** : Les membres peuvent annuler à tout moment, avec effet immédiat ou à la fin de la période de facturation en cours.

## 🏟️ Gestion des Réservations

- **Réservation** : Les membres peuvent réserver des terrains libres.
**Réservation à l'Avance** : Idéalement, les réservations doivent être effectuées au moins 30 minutes avant le début du créneau souhaité. Par exemple, un membre ne peut pas réserver pour 12h00 s'il est déjà 11h30. Cependant, afin de maximiser l'occupation des terrains, des réservations de dernière minute peuvent être proposées pour éviter que des terrains ne restent vides.
- **Membres Uniquement** : Seuls les membres abonnés peuvent réserver des terrains.
- **Disponibilité** : Les terrains ne peuvent être réservés que s'ils sont disponibles.
- **Pas de Double Réservation** : Les membres ne peuvent pas réserver plusieurs créneaux à la même heure.
- **Disponibilité en Temps Réel** : Affichage de la disponibilité des terrains en temps réel.

## 🚫 Gestion des Annulations

- **Annulation Sans Pénalité** : Les annulations doivent être faites au minimum la veille de la réservation.

## 📬 Gestion des Notifications

- **Notifications par Email** : Pour chaque étape importante :
  - **Propositions de Match** : Notification lorsqu'un membre est sélectionné comme partenaire potentiel.
  - **Confirmation de Réservation** : Email de confirmation des réservations de terrains.
  - **Annulation de Réservation** : Notification en cas d'annulation de réservation.
  - **Rappel de Match** : Email de rappel 12 heures avant le match.
- **Notifications Détailées** : Incluent la date, l'heure, et les informations sur les participants.

## 🔍 Système de Matching

- **Évaluation de la Compatibilité** : Basée sur les évaluations, la disponibilité, le niveau de jeu, et les préférences sportives.

## ✅ Confirmation de Réservation

- **Proposition Automatique** : Propose le premier créneau disponible correspondant.
- **Confirmation Mutuelle** : Les deux parties doivent confirmer pour finaliser la réservation.
- **Notification Finale** : Chaque partie reçoit une confirmation finale avec les détails du match.

## ⭐ Gestion de la Notation des Partenaires

- **Évaluations Post-Match** : Les membres peuvent noter leurs partenaires sur une échelle de 1 à 5 étoiles.
- **Score Moyen** : Influence les futures propositions de trouvailles de partenaires pour les match.
- **Affichage des Notes** : Affichées à côté des pseudos.

## 🚷 Bannir/Ignorer un Joueur

- **Bouton Ignorer** : Disponible à côté de chaque joueur dans les suggestions de match.
- **Confirmation Pop-Up** : Nécessite de sélectionner une raison prédéfinie.
- **Action Invisible** : Le joueur ignoré n'est pas informé de l'action.
- **Exclusion des Suggestions** : Les joueurs ignorés ne sont plus affichés dans les propositions futures.
- **Exclusion Mutuelle** : Les joueurs ignorés ne peuvent pas voir ni interagir avec le membre qui les a ignorés.

## 👤 Profil Administrateur

- **Gestion des Réservations** : L'administrateur peut créer, modifier et annuler des réservations de terrains.
- **Consultation de Statistiques** : Accès à des statistiques détaillées sur l'utilisation des terrains, les habitudes de réservation des membres, et les revenus générés par les abonnements.
- **Gestion des Membres** : L'administrateur peut consulter et modifier les informations des membres.