# Activité n°5 — Qualité Logicielle Mobile

Projet Flutter corrigé : débogage, tests, DevTools, performance, sobriété et préparation au déploiement.

## Lancer le projet
```bash
flutter pub get
flutter run
```

## Exécuter les tests
```bash
flutter test
flutter test integration_test/app_test.dart
```

## Résultat attendu
- Liste de 5 étudiants.
- Clic sur un étudiant -> page de détails.
- Bouton de moyenne -> dialogue affichant 14.35.
- Tests unitaires, widgets et intégration.

## Analyse des corrections
1. `Padding` contient maintenant un `Column`, ce qui permet d'utiliser correctement `children` et les propriétés d'alignement.
2. `total` n'est déclaré qu'une seule fois et accumule les moyennes.
3. Les moyennes restent en `double`, sans cast vers `int`.
4. Le guillemet incorrect du texte du bouton a été remplacé.
5. La navigation nommée transmet l'objet `Etudiant` à `DetailPage`.
6. Les widgets statiques sont rendus `const` lorsque possible.
7. La moyenne est affichée avec deux décimales.
8. Le cas d'une liste vide retourne 0.0 pour éviter une division par zéro.

## DevTools / performance
Dans DevTools, vérifier la hiérarchie des widgets, les rebuilds et les performances. `ListView.builder` est adapté à une liste dynamique et les widgets statiques peuvent être `const`.

## Sobriété
- Limiter les dépendances inutiles.
- Éviter les reconstructions inutiles.
- Garder une interface simple.
- Garder un code et une arborescence propres pour faciliter la maintenance.

