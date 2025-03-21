import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/src/models/pokemon.dart';
import 'package:pokemon_app/src/providers/pokemons_providers.dart';
import 'package:pokemon_app/src/widgets/item_list.dart';


class HomePage extends StatelessWidget {
  final PokemonsProvider pokemonsProvider = PokemonsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Logo.png',
          height: 60,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        backgroundColor: Colors.white12,
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonsProvider.fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ItemList(
              pokemons: snapshot.data!,
              onPokemonSelected: (pokemon) {
                context.goNamed(
                  'pokemon-detail',
                  extra: pokemon,
                );
              },
            );
          }
        },
      ),
    );
  }
}