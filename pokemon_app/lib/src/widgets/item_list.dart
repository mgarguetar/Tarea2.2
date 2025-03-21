import 'package:flutter/material.dart';
import 'package:pokemon_app/src/models/pokemon.dart';

class ItemList extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Function(Pokemon) onPokemonSelected;

  ItemList({required this.pokemons, required this.onPokemonSelected});

  // Función para obtener el color según el tipo de Pokémon
  Color getTypeColor(String type) {
    switch (type) {
      case 'fire':
        return Colors.red[300]!;
      case 'water':
        return Colors.blue[300]!;
      case 'grass':
        return Colors.green[300]!;
      case 'electric':
        return Colors.yellow[600]!;
      case 'psychic':
        return Colors.purple[300]!;
      case 'ice':
        return Colors.cyan[200]!;
      case 'dragon':
        return Colors.indigo[300]!;
      case 'dark':
        return Colors.brown[300]!;
      case 'fairy':
        return Colors.pink[200]!;
      case 'fighting':
        return Colors.orange[300]!;
      case 'flying':
        return Colors.lightBlue[200]!;
      case 'poison':
        return Colors.deepPurple[300]!;
      case 'ground':
        return Colors.brown[400]!;
      case 'rock':
        return Colors.grey[500]!;
      case 'bug':
        return Colors.lightGreen[300]!;
      case 'ghost':
        return Colors.deepPurple[400]!;
      case 'steel':
        return Colors.blueGrey[300]!;
      default:
        return Colors.grey[300]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        final primaryType = pokemon.types.isNotEmpty ? pokemon.types[0].type.name : 'unknown';

        return GestureDetector(
          onTap: () => onPokemonSelected(pokemon), // Manejar el clic
          child: Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: getTypeColor(primaryType), // Color de fondo según el tipo
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Imagen del Pokémon
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white.withOpacity(0.3), // Fondo semi-transparente
                    ),
                    child: Image.network(
                      pokemon.sprites.frontDefault,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  // Información del Pokémon
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Texto en blanco para contrastar
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Type: ${primaryType.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8), // Texto semi-transparente
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Height: ${pokemon.height / 10} m', // Convertir a metros
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Weight: ${pokemon.weight / 10} kg', // Convertir a kilogramos
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