import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ejercicio_juego_de_tronos/models/character.dart';
class ApiService {
  static const String baseUrl = 'https://anapioficeandfire.com/api';
  // Obtener personajes con paginación
  static Future<List<Character>> fetchCharacters(int page, int pageSize) async {
	final url = Uri.parse('$baseUrl/characters?page=$page&pageSize=$pageSize');
	final response = await http.get(url);
	if (response.statusCode == 200) {
  	final List<dynamic> data = json.decode(response.body);
  	return data.map((json) => Character.fromJson(json)).toList();
	} else {
  	throw Exception('Error al obtener los personajes');
	}
  }
  // Obtener un personaje aleatorio
  static Future<Character> fetchRandomCharacter() async {
	final randomPage = (DateTime.now().millisecond % 50) + 1;
	final characters = await fetchCharacters(randomPage, 1);
	return characters.first;
  }
}
