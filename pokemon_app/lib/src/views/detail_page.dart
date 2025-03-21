import 'package:flutter/material.dart';
import 'package:pokemon_app/src/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: getTypeColor(pokemon.types[0].type.name),
      ),
      backgroundColor: getTypeColor(pokemon.types[0].type.name),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.4, 
            child: Center(
              child: Image.network(
                width: screenHeight * 0.5,
                pokemon.sprites.frontDefault,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        pokemon.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sobre',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Especie: ${pokemon.species}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Altura: ${pokemon.height / 10} M',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Peso: ${pokemon.weight / 10} KG',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Habilidades:',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Color getTextColor(String name) {
    return name == 'normal' || name == 'fighting' || name == 'ground'
        ? Colors.black
        : Colors.white;
  }
}
