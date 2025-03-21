class Pokemon {
  final String name;
  final int height;
  final int weight;
  final Sprites sprites;
  final List<PokemonType> types;
  final List<Ability> abilities;
  final String species;

  Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.types,
    required this.abilities,
    required this.species,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var types = (json['types'] as List)
        .map((type) => PokemonType.fromJson(type))
        .toList();
    var abilities = (json['abilities'] as List)
        .map((ability) => Ability.fromJson(ability))
        .toList();
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprites: Sprites.fromJson(json['sprites']),
      types: types,
      abilities: abilities,
      species: json['species']['name'], // Obtener el nombre de la especie
    );
  }

  get id => null;
}

class Sprites {
  final String frontDefault;

  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'],
    );
  }
}

class PokemonType {
  final TypeDetail type;

  PokemonType({
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      type: TypeDetail.fromJson(json['type']),
    );
  }
}

class TypeDetail {
  final String name;

  TypeDetail({
    required this.name,
  });

  factory TypeDetail.fromJson(Map<String, dynamic> json) {
    return TypeDetail(
      name: json['name'],
    );
  }
}

class Ability {
  final AbilityDetail ability;

  Ability({
    required this.ability,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      ability: AbilityDetail.fromJson(json['ability']),
    );
  }
}

class AbilityDetail {
  final String name;

  AbilityDetail({
    required this.name,
  });

  factory AbilityDetail.fromJson(Map<String, dynamic> json) {
    return AbilityDetail(
      name: json['name'],
    );
  }
}