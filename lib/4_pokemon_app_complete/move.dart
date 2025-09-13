class Move
{
  final String name;
  final int power; // we're just going to assume all moves have power, and are all attack moves

  Move({ required this.name, required this.power});

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      name: json['name'],
      power: json['power'] ?? 0,
    );
  }
}