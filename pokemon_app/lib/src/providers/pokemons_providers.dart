import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/src/models/pokemon.dart';

class PokemonsProvider {
  Future<List<Pokemon>> fetchPokemons() async {
    // Obtener la lista de Pokémon
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));

    if (response.statusCode == 200) {
      // Parsear la lista de Pokémon
      var pokemonListResponse = PokemonListResponse.fromJson(json.decode(response.body));
      List<Pokemon> pokemons = [];

      // Obtener los detalles de cada Pokémon
      for (var item in pokemonListResponse.results) {
        final pokemonResponse = await http.get(Uri.parse(item.url));
        if (pokemonResponse.statusCode == 200) {
          var pokemon = Pokemon.fromJson(json.decode(pokemonResponse.body));
          pokemons.add(pokemon);
        }
      }

      return pokemons; // Devuelve una lista de Pokémon
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }
}

class PokemonListResponse {
  final List<PokemonListItem> results;

  PokemonListResponse({required this.results});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<PokemonListItem> pokemonList =
        list.map((i) => PokemonListItem.fromJson(i)).toList();
    return PokemonListResponse(results: pokemonList);
  }
}

class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({required this.name, required this.url});

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return PokemonListItem(
      name: json['name'],
      url: json['url'],
    );
  }
}