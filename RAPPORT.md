# Rapport — Activité n°5 : Qualité Logicielle Mobile

## 1. Objectif
L'activité consiste à déboguer une application Flutter affichant une liste d'étudiants, leurs moyennes et une page de détails, puis à sécuriser l'application avec des tests unitaires, de widgets et d'intégration. Le support demande également une observation avec DevTools, une réflexion sur la performance et la sobriété, et une préparation au déploiement.

## 2. Erreurs détectées et corrections

### 2.1 Structure de l'interface
Le `body` utilisait directement `Padding` avec `mainAxisAlignment`, `crossAxisAlignment` et `children`. Ces propriétés appartiennent à un widget de mise en page comme `Column`. La correction consiste donc à placer un `Column` dans le `Padding`.

### 2.2 Texte du bouton
Le texte du bouton contenait un guillemet typographique incorrect. Il a été remplacé par une chaîne Dart correctement délimitée.

### 2.3 Calcul de la moyenne
Le code original redéclarait `total` à l'intérieur de la boucle. Cette variable masquait la variable extérieure et empêchait l'accumulation. De plus, le cast vers `int` faisait perdre les décimales.

Correction :
- une seule variable `double total = 0.0`;
- addition de `etudiant.moyenne`;
- division par le nombre d'étudiants;
- gestion de la liste vide.

Avec Alice, Bob, Charlie, David et Eve, la moyenne obtenue est **14.35**.

### 2.4 Navigation
La navigation nommée `/details` transmet l'objet `Etudiant` dans `arguments`. `DetailPage` récupère ensuite cet objet pour afficher son nom et sa moyenne.

## 3. Tests réalisés

### Test unitaire
- `[10.0, 14.0]` donne `12.0`.
- Les cinq moyennes de l'application donnent `14.35`.
- Une liste vide donne `0.0`.

### Test de widgets
- Vérification du titre « Liste des étudiants ».
- Vérification de la présence des étudiants.
- Clic sur le bouton de moyenne.
- Vérification de la boîte de dialogue et de la valeur `14.35`.
- Clic sur Alice et vérification de la page de détail.

### Test d'intégration
Scénario de bout en bout :
1. Lancement de l'application.
2. Clic sur Alice.
3. Vérification de la page de détail.
4. Retour à la liste.
5. Clic sur le calcul de moyenne.
6. Vérification de la boîte de dialogue.

## 4. DevTools et performance
DevTools doit permettre de vérifier la hiérarchie des widgets, les rebuilds et le comportement de l'application. La liste utilise `ListView.builder`, approprié pour une liste dynamique. Les widgets statiques sont marqués `const` lorsque possible afin de limiter les reconstructions inutiles.

## 5. Sobriété
Les principales pratiques retenues sont :
- limiter les dépendances inutilisées ;
- éviter les rebuilds inutiles ;
- conserver une interface simple ;
- éviter les conversions de types inutiles ;
- maintenir une structure de projet claire.

## 6. Déploiement
Le projet est organisé avec `lib/`, `test/` et `integration_test/`. Avant une remise finale, il faut exécuter les tests, nettoyer les messages de debug temporaires et vérifier l'application en mode release.

## 7. Conclusion
L'application initialement imparfaite a été restructurée et sécurisée. Le calcul de moyenne est maintenant fiable, la navigation fonctionne, la boîte de dialogue affiche le bon résultat et les trois niveaux de tests couvrent la logique, l'interface et le parcours utilisateur.
