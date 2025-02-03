The Gossip Project

Description

Le Gossip Project est une application web simple construite avec Sinatra et Bootstrap. L'application permet aux utilisateurs de créer et de gérer des potins. Chaque potin est associé à un auteur et à un contenu. Les utilisateurs peuvent également commenter ces potins, et chaque commentaire est lié à un potin spécifique.

Fonctionnalités

Créer un potin : Les utilisateurs peuvent ajouter un potin avec un auteur et un contenu.
Voir les potins : La liste des potins est affichée sur la page d'accueil, et chaque potin peut être consulté individuellement.
Éditer un potin : Les utilisateurs peuvent modifier un potin existant via une interface d'édition.
Ajouter des commentaires : Les utilisateurs peuvent commenter un potin spécifique, et les commentaires sont affichés sous chaque potin.
Base de données simple : L'application utilise des fichiers CSV pour stocker les potins et les commentaires.
Prérequis

Avant de démarrer, assurez-vous d'avoir installé Ruby sur votre machine ainsi que Bundler.

Installation
Clonez le repository :
git clone https://github.com/ton-utilisateur/the-gossip-project.git
cd the-gossip-project
Installez les dépendances :
bundle install
Démarrez le serveur :
ruby config.ru
L'application sera accessible à l'adresse http://localhost:4567.
Structure des fichiers

config.ru : Fichier de configuration pour lancer l'application avec Rack.
lib/controller.rb : Le contrôleur principal qui gère les routes et les actions.
lib/gossip.rb : La classe Gossip, qui gère les potins (création, récupération, mise à jour).
lib/comment.rb : La classe Comment, qui gère les commentaires associés aux potins.
views/ : Dossier contenant les vues ERB pour afficher l'interface.
db/ : Dossier contenant les fichiers CSV pour les potins (gossip.csv) et les commentaires (comments.csv).
Fonctionnement du code

1. Créer un potin
L'utilisateur entre un nom et un contenu dans un formulaire.
Le potin est ajouté à un fichier CSV gossip.csv.
2. Voir un potin
L'utilisateur peut cliquer sur un potin depuis la page d'accueil pour voir son détail.
Les commentaires associés à ce potin sont affichés, s'il y en a.
3. Éditer un potin
L'utilisateur peut modifier un potin en cliquant sur le lien d'édition depuis la page du potin.
Le formulaire de mise à jour envoie les nouvelles informations au fichier CSV.
4. Ajouter un commentaire
L'utilisateur peut ajouter un commentaire sous un potin.
Le commentaire est enregistré dans le fichier comments.csv, associé au potin spécifique.
Screenshots

Voici à quoi ressemble l'interface :

Page d'accueil : Affiche tous les potins.
Page d'un potin : Affiche les détails du potin ainsi que ses commentaires.
Page d'édition : Permet de modifier un potin existant.
Contribuer

Si vous souhaitez contribuer à ce projet, veuillez suivre ces étapes :

Forkez le repository.
Créez une nouvelle branche (git checkout -b feature-nouvelle-fonctionnalite).
Effectuez vos modifications.
Commitez vos modifications (git commit -m 'Ajout d\'une nouvelle fonctionnalité').
Poussez la branche (git push origin feature-nouvelle-fonctionnalite).
Ouvrez une pull request.
Auteurs

Auteur : Jade