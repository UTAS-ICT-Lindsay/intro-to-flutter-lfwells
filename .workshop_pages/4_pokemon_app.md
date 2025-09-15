[🏠 Back to Workshop Home](/WORKSHOP.md)

# 4. A Full Sample App (Flutter-mon!)
In the [`lib/main.dart`](lib/main.dart) file, change the `import` statement on **line 5**:
```dart
import 'package:intro_to_flutter/4_pokemon_app/main.dart';
```
and **Hot Restart** by pressing the green restart button ![Restart](/.workshop_images/restart.png)

We're going to explore and improve this sample application. It uses the [PokéAPI](https://pokeapi.co/) 
to retrieve data about different Pokémon and their moves. We're going to add some interactivity to it, 
in the form of a highly simplified "battle" between two Pokémon.

![Pokemon App](/.workshop_images/pokemon_start.png)

## Exploring the Code
### [`lib/4_pokemon_app/main.dart`](/lib/4_pokemon_app/main.dart)
Notice the attempt to "theme" the app using a `ThemeData` object in `MyApp`. 

`HomePage` is a pretty simple page with two identical `PokemonList` widgets side-by-side in a `Row`.

`PokemonList` is a `StatefulWidget` which fetches a list of Pokémon from the `Api`, and displays them in a `ListView.builder` 
which creates some custom `PokemonListItem` widgets.
It supports keeping track of which Pokémon is selected in the list.
- `initState` is called once when the widget is first created. It calls the `fetch` function to get the list of Pokémon.
- The `fetch` function is `async` meaning it takes time to complete. It uses the `await` keyword to wait for the `Api.getPokemon` function to complete.
- In `build`, we're using a `ListView.builder` to create a scrollable list of items. This is more efficient than creating all the items at once, especially for long lists.

### [`lib/4_pokemon_app/api.dart`](/lib/4_pokemon_app/api.dart)
This class has static functions to fetch data from the PokéAPI, `getPokemon`, `getPokemonImage` and `getMoves`.

Again these are `async` functions which use the `http` package to make network requests, and `jsonDecode` to parse the JSON responses.
(Notice that we had to add `http` to the [`pubspec.yaml`](/pubspec.yaml) file to use that package)

### Data Classes
Familiarise yourself with the data classes in [`lib/4_pokemon_app/pokemon.dart`](/lib/4_pokemon_app/pokemon.dart) an [`lib/4_pokemon_app/move.dart`](/lib/4_pokemon_app/move.dart).

## Task 1: Adding Images to the List
In `PokemonListItem`, we *could* use the same `fetch` function approach that we used in `PokemonList` 
to fetch the image URL for each Pokémon, but to try something different, we're going to use a `FutureBuilder` widget.
1. In `PokemonListItem`, select the `ListTile` widget.
2. Press **Ctrl+.** to open the Quick Fix menu.
3. Choose **Wrap with FutureBuilder**.
4. For the `future` parameter, set this to `Api.getPokemonImage(pokemon)`.
5. For the `builder` parameter, add a new line to the *start* of this function:
```dart
var imageUrl = asyncSnapshot.data;
```
The `builder` function will be called multiple times:
- once when the `Future` is still loading (in which case `asyncSnapshot.data` will be `null`)
- once when the `Future` has completed (in which case `asyncSnapshot.data` will have the image URL)

6. Uncomment the `leading` parameter of the `ListTile`. Notice that it uses a conditional expression 
to show a `CircularProgressIndicator` while the image is loading, and an `Image.network` widget when the image URL is available.

Your final `PokemonListItem.build` function should look like this:
```dart
@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: Api.getPokemonImage(pokemon),
    builder: (context, asyncSnapshot) {
      var imageUrl = asyncSnapshot.data;
      return ListTile(
        leading: imageUrl == null ? CircularProgressIndicator() : Image.network(imageUrl),
        title: Text(pokemon.name.capitalize(), style: TextStyle(fontWeight: FontWeight.bold),),
        onTap: () => onSelect(),
        selected: isSelected,
      );
    }
  );
}
```

## Task 2: Selecting Pokémon to Battle
### Handling Selection
First we need to modify `HomePage` to keep track of which Pokémon is selected in each list. 
Once two Pokémon are selected, we can show a button to navigate to a new page to "battle" them.
1. In `PokemonList`, add a new parameter for a callback function to be called when a Pokémon is selected (1)
and include this in the constructor (2):
```dart
class PokemonList extends StatefulWidget {
  final Function(Pokemon) onSelected; // (1) new parameter

  const PokemonList({super.key, required this.onSelected}); // (2) include in constructor
  ...
}
```

2. Find the `TODO` comment in `_PokemonListState.build`. This is called when a Pokémon is tapped in the list.
We want to call the `onSelected` callback function, passing in the selected Pokémon:
```dart
return PokemonListItem(pokemon: p, isSelected: p == selected, onSelect: () {
  setState(() {
    selected = p;
  });
  widget.onSelected(p); // add this line
});
```

We have a compiler error in `HomePage` because we need to provide the new `onSelected` parameter for each `PokemonList`.
Let's use the IDE to help us.
3. Click on the first `PokemonList` in `HomePage.build`.
4. Press **Ctrl+.** to open the Quick Fix menu.
5. Choose **Add required parameter**.
6. Write some code to store the selected Pokémon in the state variable `pokemone1`.
7. Do the same for the second `PokemonList`, storing the selected Pokémon in `pokemon2`.

Your two list widgets should now look like this:
```dart
Flexible(child: PokemonList(onSelected: (pokemon) {
  setState(() {
    pokemon1 = pokemon;
  });
},)),
Flexible(child: PokemonList(onSelected: (pokemon) {
  setState(() {
    pokemon2 = pokemon;
  });
},)),
```

### Showing the Selected Pokémon
We want to show the names of the selected Pokémon above the two lists.
1. In `HomePage.build`, select the `Row` widget.
2. Press **Ctrl+.** to open the Quick Fix menu.
3. Choose **Wrap with Column**.
4. I've already made you a function to draw the header called `buildBattleInfo`. Call this as the first child of the `Column`.
5. We need the two lists to fill up the remaining space, so select the `Row` widget again.
6. Press **Ctrl+.** to open the Quick Fix menu.
7. Choose **Wrap with Expanded**.
Your page should now look like this when done (double check [`/lib/4_pokemon_app_complete/main.dart`](/lib/4_pokemon_app_complete/main.dart) if you're stuck):

![Pokemon App](/.workshop_images/pokemon_task2.png)

## Task 3: Navigating with a Battle Button and Tidying the Code
1. In `HomePage.build`, below the `buildBattleInfo` call, add a conditional expression to show an `ElevatedButton`

```dart
if (pokemon1 != null && pokemon2 != null)
  ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BattlePage(pokemon1: pokemon1!, pokemon2: pokemon2!)));
    },
    child: Text("Battle!"),
  );
```
  - Notice how we can use `if` statements in the `children` list to conditionally include widgets.
  - Take a moment to understand how the `Navigator.push` function works to navigate to a new page (we create a `BattlePage` widget, and navigate to it).
The `build` function is getting a bit long. Let's extract the `ElevatedButton` and `Expanded` into their own functions.
2. Click on the `ElevatedButton` widget.
3. Press **Ctrl+.** to open the Quick Fix menu.
4. Choose **Extract method**.
5. Name the new method `buildBattleButton`.
6. Do the same for the `Expanded` widget, naming the new method `buildPokemonLists`.

Notice how the `children` list in the `build` function is now much cleaner:
```dart
//heading
children: [
  buildBattleInfo(),
  if (pokemon1 != null && pokemon2 != null)
    buildBattleButton(),
  
  //two lists side by side
  buildTwoLists(),
],
```

## Task 4: Improving the Battle Page
At the moment the [`/lib/4_pokemon_app/battle_page.dart`](/lib/4_pokemon_app/battle_page.dart) is looking a little basic. 
The Pokémon names and images are shown, but they never lose any HP or use any moves.

See if you can implement the following features:
- Add state for each pokemon's hp in `_BattlePageState`.
- Make each move button reduce the opponent's hp by its `power` -- you can use `setState` to update the hp inside the `onMoveSelected` parameter of each of the Pokemon.

![Pokemon App](/.workshop_images/pokemon_battle.png)

### Extensions
- Add turns (including disabling the buttons of the Pokémon whose turn it isn't)
- Detect game over state and navigate to a game over screen
- Make it so the moves drain PP (Power Points) and disable moves with 0 PP

# ⏩ Next: [What to Learn Next](/.workshop_pages/5_next_steps.md)

- [🏠 Back to Workshop Home](/WORKSHOP.md)