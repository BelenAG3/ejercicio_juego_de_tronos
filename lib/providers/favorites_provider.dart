import 'package:flutter/material.dart';
import 'package:ejercicio_juego_de_tronos/models/character.dart';
class FavoritesProvider with ChangeNotifier {
  final List<Character> _favorites = [];
  List<Character> get favorites => _favorites;
  void addFavorite(Character character) {
	if (!_favorites.contains(character)) {
  	_favorites.add(character);
  	notifyListeners();
	}
  }
  void removeFavorite(Character character) {
	_favorites.remove(character);
	notifyListeners();
  }
}
