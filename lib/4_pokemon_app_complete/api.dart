import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intro_to_flutter/4_pokemon_app/pokemon.dart';

import 'move.dart';

class Api
{
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  /// Fetch a list of Pokemon from the PokeAPI
  static Future<List<Pokemon>> getPokemon({ int limit = 20, int offset = 0 }) async {
    var url = Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset');

    var response = await http.get(url);
    if (kDebugMode) {
      print(response.body);
    }
    var decoded = jsonDecode(response.body);
    var results = decoded['results'] as List;
    return results.map((e) => Pokemon.fromJson(e)).toList();
  }

  /// Fetch the image URL for a given Pokemon
  static Future<String> getPokemonImage(Pokemon pokemon) async {
    var uri = Uri.parse('$baseUrl/pokemon/${pokemon.name}');
    var response = await http.get(uri);
    var decoded = jsonDecode(response.body);
    return decoded['sprites']['front_default'];
  }

  /// Fetch the list of moves for a given Pokemon
  static Future<List<Move>> getMoves(Pokemon pokemon) async {
    var uri = Uri.parse('$baseUrl/pokemon/${pokemon.name}');
    var response = await http.get(uri);
    var decoded = jsonDecode(response.body);
    var results = decoded['moves'] as List;

    //go through each move, and get the name (with special logic for checking if its a starting move)
    var urls = results
        .where((e) => e["version_group_details"][0]["move_learn_method"]["name"] == "level-up" && e["version_group_details"][0]["level_learned_at"] == 1)
        .map((e) => e["move"]["url"] as String)
        .toList();

    //for each url, fetch the move details and convert to Move object
    List<Move> moves = [];
    for (var url in urls) {
      var moveResponse = await http.get(Uri.parse(url));
      var moveDecoded = jsonDecode(moveResponse.body);
      moves.add(Move.fromJson(moveDecoded));
    }
    return moves;
  }
}