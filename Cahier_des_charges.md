# Cahier des Charges

## Sommaire
1. [Introduction](#introduction)
2. [Objectifs](#objectifs)
3. [Fonctionnalités](#fonctionnalités)
4. [Architecture](#architecture)
5. [API Météo](#api-météo)
6. [Technologies Utilisées](#technologies-utilisées)
7. [Contraintes](#contraintes)
8. [Planning](#planning)

## Introduction
L'objectif de ce document est de définir les spécifications pour la création d'une application web de météo. Cette application permettra aux utilisateurs de consulter les prévisions météorologiques pour différentes localisations. Lien vers le [Trello](https://trello.com/b/PygR7QyU/ynov-camping)

## Objectifs
- Créer un site web
- Fournir des prévisions météorologiques à jour (API).
- Offrir une interface utilisateur intuitive et réactive.
- Fournir des prévisions météorologiques à jour (API)
- Developper un programme de machine learning qui permet de prédire la météo des prochains jours sous différentes conditions.

## Fonctionnalités
- Affichage des prévisions météorologiques sur plusieurs jours.
- Affichage des conditions météorologiques actuelles.
- Intégration de cartes météorologiques interactives.

## Architecture
L'application sera composée des éléments suivants :
- Frontend : Interface utilisateur développée en HTML, CSS et JavaScript.
- Backend : Serveur API pour récupérer les données météorologiques.
- Base de données : Stockage des données utilisateur et des préférences.

## API Météo
L'API météo sera responsable de :
- Récupérer les données météorologiques à partir de services tiers.
- Fournir des endpoints pour accéder aux prévisions météorologiques.
- Gérer les requêtes des utilisateurs et renvoyer les données au frontend.

## Technologies Utilisées
- Frontend : React.js, Vue.js ou Angular.
- Backend : Node.js avec Express.
- Base de données : MongoDB ou PostgreSQL ou MySQL.
- API tierce : OpenWeatherMap, WeatherAPI ou autre service de données météorologiques pour fournir des information a la DB. puis python pour le machine learning et créer notre api.

## Contraintes
- L'application doit être responsive et fonctionner sur différents appareils (desktop, mobile, tablette).
- Les données météorologiques doivent être mises à jour régulièrement.
- L'application doit être sécurisée et protéger les données des utilisateurs.

## Planning

| Phase   | Description                                          | Durée  |
|---------|------------------------------------------------------|--------|
| Phase 1 | Analyse des besoins et définition des spécifications | À voir |
| Phase 2 | Développement du backend et de l'API météo           | À voir |
| Phase 3 | Développement du frontend et intégration avec l'API  | À voir |
| Phase 4 | Tests et déploiement                                 | À voir |
| Phase 5 | Maintenance et mises à jour                          | À voir |