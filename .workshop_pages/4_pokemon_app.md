[🏠 Back to Workshop Home](/WORKSHOP.md)

# 4. A Full Sample App (Flutter-mon!)
In the [`lib/main.dart`](lib/main.dart) file, change the `import` statement on **line 5**:
```dart
import 'package:intro_to_flutter/4_pokemon_app/main.dart';
```
and **Hot Restart** by pressing the green restart button ![Restart](/.workshop_images/restart.png)

We're going to explore and improve this sample application. It uses the [PokéAPI](https://pokeapi.co/) to retrieve data about different pokemon and their moves.

# These instructions aren't complete yet

## Exploring the Code
- pokemon class
  - ListView.builder 
  - initState
  - fetch (Future)
- api class
  - http package (import, and pubspec.yaml)
  - getPokemon
    - jsonDecode

## Add image to each item
- FutureBuilder

## Navigation
- implement PokemonList(onSelected) in HomePageState
- Make column
- add a header text based upon selected pokemon
- Add a button to battle
- getting ugly, extract functions

## Attacks
- add state for each pokemon's hp (100)
- make each attack button reduce the opponent's hp by its power
- extra bonus: add turns (including disabling buttons)
- extra bonus: detect game over
- extra bonus: add PP

- [🏠 Back to Workshop Home](/WORKSHOP.md)