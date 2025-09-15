import 'package:flutter/material.dart';
import 'package:intro_to_flutter/4_pokemon_app/api.dart';
import 'package:intro_to_flutter/4_pokemon_app/pokemon.dart';
import 'package:intro_to_flutter/4_pokemon_app/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4 - Pokemon App',
      //a pokemon theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
          accentColor: Colors.red,
          cardColor: Colors.red,
        ),
        canvasColor: Colors.amber,
        listTileTheme: ListTileThemeData(
          selectedColor: Colors.yellow,
          selectedTileColor: Colors.red,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  Pokemon? pokemon1;
  Pokemon? pokemon2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text("Flutter-mon: Gotta catch 'em all!",),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [

          // TODO: add battle selection logic

          //two lists side by side
          Expanded(
            child: Row(
              children: [
                Flexible(child:
                  PokemonList()
                ),
                Flexible(child:
                  PokemonList()
                ),
              ],
            ),
          )

        ],
      )
    );
  }

  Padding buildBattleInfo() {
    if (pokemon1 != null && pokemon2 != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${pokemon1!.name.capitalize()} vs ${pokemon2!.name.capitalize()}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Select two Pokémon to battle!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      );
    }
  }
}


class PokemonList extends StatefulWidget
{
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList>
{
  List<Pokemon> pokemon = [];
  Pokemon? selected;

  @override
  void initState() {
    super.initState();
    fetch();
  }
  Future fetch() async
  {
    final data = await Api.getPokemon();
    setState(() {
      pokemon = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemon.length,
        itemBuilder: (context, index) {
          final p = pokemon[index];
          return PokemonListItem(pokemon: p, isSelected: p == selected, onSelect: () {
            setState(() {
              selected = p;
            });

            // TODO: tell the parent that a Pokemon was selected

          });
        }
    );
  }
}

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    super.key,
    required this.pokemon,
    required this.isSelected,
    required this.onSelect,
  });

  final Pokemon pokemon;
  final bool isSelected;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: imageUrl == null ? CircularProgressIndicator() : Image.network(imageUrl),
      title: Text(pokemon.name.capitalize(), style: TextStyle(fontWeight: FontWeight.bold),),
      onTap: () => onSelect(),
      selected: isSelected,
    );
  }
}
