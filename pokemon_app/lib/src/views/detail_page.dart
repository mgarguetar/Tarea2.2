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

   final Map<String, Color> typeColors = {
    'normal': Colors.brown,
    'fighting': Colors.red,
    'flying': Colors.blue,
    'poison': Colors.purple,
    'ground': Colors.orange,
    'rock': Colors.grey,
    'bug': Colors.green,
    'ghost': Colors.indigo,
    'steel': Colors.blueGrey,
    'fire': Colors.red,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.amber,
    'psychic': Colors.pink,
    'ice': Colors.cyan,
    'dragon': Colors.indigo,
    'dark': Colors.brown,
    'fairy': Colors.pinkAccent,
  };

  Color getTextColor(String name) {
    return name == 'normal' || name == 'fighting' || name == 'ground'
        ? Colors.black
        : Colors.white;
  }
  
    Color getTypeColor(String name) {
    return typeColors[name] ?? Colors.grey;
  }
  
}
