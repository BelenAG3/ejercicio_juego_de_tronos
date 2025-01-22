import 'package:ejercicio_juego_de_tronos/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejercicio_juego_de_tronos/models/character.dart';
import 'package:ejercicio_juego_de_tronos/services/api_service.dart';
class DetailScreen extends StatelessWidget {
  final Character character;
  const DetailScreen({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
	final favoritesProvider = Provider.of<FavoritesProvider>(context);
	final isFavorite = favoritesProvider.favorites.contains(character);
	return Scaffold(
  	appBar: AppBar(
    	title: Text(character.name),
  	),
  	body: Padding(
    	padding: const EdgeInsets.all(16.0),
    	child: Column(
      	crossAxisAlignment: CrossAxisAlignment.start,
      	children: [
        	Text(
          	'Nombre: ${character.name}',
          	style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        	),
        	SizedBox(height: 8),
        	Text('Género: ${character.gender}', style: TextStyle(fontSize: 16)),
        	Text('Cultura: ${character.culture}', style: TextStyle(fontSize: 16)),
        	Text('Nacido: ${character.born}', style: TextStyle(fontSize: 16)),
        	Text('Fallecido: ${character.died}', style: TextStyle(fontSize: 16)),
        	Spacer(),
        	ElevatedButton.icon(
          	onPressed: () {
            	if (isFavorite) {
              	favoritesProvider.removeFavorite(character);
            	} else {
              	favoritesProvider.addFavorite(character);
            	}
          	},
          	icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          	label: Text(isFavorite ? 'Eliminar de Favoritos' : 'Agregar a Favoritos'),
        	),
      	],
    	),
  	),
	);
  }
}
