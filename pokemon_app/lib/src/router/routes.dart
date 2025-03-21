import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/src/models/pokemon.dart';
import 'package:pokemon_app/src/views/detail_page.dart';
import 'package:pokemon_app/src/views/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // Ruta principal (HomePage)
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'pokemon-detail',
          name: 'pokemon-detail',
          builder: (BuildContext context, GoRouterState state) {
            // Obtener el Pokémon pasado como argumento
            final pokemon = state.extra as Pokemon;
            return PokemonDetailPage(pokemon: pokemon);
          },
        ),
      ],
    ),
  ],
);
