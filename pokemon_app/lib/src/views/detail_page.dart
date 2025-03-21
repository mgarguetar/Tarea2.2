import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_app/src/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: getTypeColor(pokemon.types[0].type.name),
      ),
      backgroundColor: getTypeColor(pokemon.types[0].type.name),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del Pokémon (50% de la pantalla)
            SizedBox(
              height: screenHeight * 0.4, // 50% de la altura de la pantalla
              child: Center(
                child: Image.network(
                  width: screenHeight * 0.5, // 50% de la altura de la pantalla
                  pokemon.sprites.frontDefault,
                  fit: BoxFit.contain, // Ajustar la imagen dentro del espacio
                ),
              ),
            ),
            // Nombre del Pokémon
              Text(
              textAlign: TextAlign.center,
              pokemon.name.toUpperCase(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // Información básica
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Species: ${pokemon.species}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Height: ${pokemon.height / 10} M',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Weight: ${pokemon.weight / 10} KG',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            // Habilidades
            Text(
              'Abilities:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: pokemon.abilities.map((ability) {
                return ListTile(
                  title: Text(ability.ability.name),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Función para obtener el color según el tipo de Pokémon
  Color getTypeColor(String name) {
    switch (name) {
      case 'normal':
        return Colors.brown;
      case 'fighting':
        return Colors.red;
      case 'flying':
        return Colors.blue;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange;
      case 'rock':
        return Colors.grey;
      case 'bug':
        return Colors.green;
      case 'ghost':
        return Colors.indigo;
      case 'steel':
        return Colors.blueGrey;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'psychic':
        return Colors.pink;
      case 'ice':
        return Colors.cyan;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.brown;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}