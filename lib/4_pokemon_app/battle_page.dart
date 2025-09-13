import 'package:flutter/material.dart';
import 'package:intro_to_flutter/4_pokemon_app/pokemon.dart';
import 'package:intro_to_flutter/4_pokemon_app/utils.dart';

import 'api.dart';
import 'move.dart';

class BattlePage extends StatefulWidget
{
  final Pokemon pokemon1, pokemon2;

  const BattlePage({super.key, required this.pokemon1, required this.pokemon2});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage>
{
  // TODO: store state for each Pokemon's HP, status effects, etc.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("${widget.pokemon1.name.capitalize()} VS ${widget.pokemon2.name.capitalize()}"),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: PokemonDisplay(
              pokemon: widget.pokemon1,
              hp: 100,
              onMoveSelected: (move) {
                //TODO: implement attack logic
              }
            )
          ),
          Flexible(
            child: PokemonDisplay(
              pokemon: widget.pokemon2,
              hp: 100,
              onMoveSelected: (move) {
                //TODO: implement attack logic
              }
            )
          ),
        ]
      )
    );
  }
}

class PokemonDisplay extends StatelessWidget {
  final Pokemon pokemon;
  final int hp;
  final Function(Move move)? onMoveSelected;

  const PokemonDisplay({super.key, required this.pokemon, required this.hp, this.onMoveSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Api.getPokemonImage(pokemon),
            builder: (context, snapshot) {
              String? imageUrl = snapshot.data;
              return imageUrl == null ? CircularProgressIndicator() : Image.network(imageUrl);
            }
          ),
          Text(pokemon.name.capitalize(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Text("HP: $hp", style: TextStyle(fontSize: 18),),
          FutureBuilder(
            future: Api.getMoves(pokemon),
            builder: (context, snapshot) {
              List<Move>? moves = snapshot.data;
              if (moves == null) return CircularProgressIndicator();
              return Column(
                children: moves.map((move) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () {
                      if (onMoveSelected != null) onMoveSelected!(move);
                    }, child: Text(move.name.capitalize())),
                  );
                }).toList()
              );
            }
          )
        ],
      )
    );
  }
}
