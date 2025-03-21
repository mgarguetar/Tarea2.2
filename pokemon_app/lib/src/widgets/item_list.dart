import 'package:flutter/material.dart';
import 'package:pokemon_app/src/models/pokemon.dart';

class ItemList extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Function(Pokemon) onPokemonSelected;

  ItemList({required this.pokemons, required this.onPokemonSelected});

  static const Map<String, MaterialColor> typeColors = {
    'fire': Colors.red,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.yellow,
    'psychic': Colors.purple,
    'ice': Colors.cyan,
    'dragon': Colors.indigo,
    'dark': Colors.brown,
    'fairy': Colors.pink,
    'fighting': Colors.orange,
    'flying': Colors.lightBlue,
    'poison': Colors.deepPurple,
    'ground': Colors.brown,
    'rock': Colors.grey,
    'bug': Colors.lightGreen,
    'ghost': Colors.deepPurple,
    'steel': Colors.blueGrey,
  };

  Color getTypeColor(String type) {
    return typeColors[type]?.shade300 ?? Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        final primaryType = pokemon.types.isNotEmpty ? pokemon.types[0].type.name : 'unknown';

        return GestureDetector(
          onTap: () => onPokemonSelected(pokemon),
          child: Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: getTypeColor(primaryType),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Image.network(
                      pokemon.sprites.frontDefault,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Tipo: ${primaryType.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Altura: ${pokemon.height / 10} m',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Peso: ${pokemon.weight / 10} kg',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
