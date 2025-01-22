class Character {
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  Character({
	required this.name,
	required this.gender,
	required this.culture,
	required this.born,
	required this.died,
  });
  factory Character.fromJson(Map<String, dynamic> json) {
	return Character(
  	name: json['name'] ?? 'Unknown',
  	gender: json['gender'] ?? 'Unknown',
  	culture: json['culture'] ?? 'Unknown',
  	born: json['born'] ?? 'Unknown',
  	died: json['died'] ?? 'Unknown',
	);
  }
  static String _getValidString(String? value) {
    if (value == null || value.isEmpty) {
      return "Desconocido";
    }
    return value;
  }
}