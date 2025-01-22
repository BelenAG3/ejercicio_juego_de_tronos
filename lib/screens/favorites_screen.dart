import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejercicio_juego_de_tronos/providers/favorites_provider.dart';
import 'package:ejercicio_juego_de_tronos/screens/detail_screen.dart';
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	final favoritesProvider = Provider.of<FavoritesProvider>(context);
	final favorites = favoritesProvider.favorites;
	return Scaffold(
  	appBar: AppBar(
    	title: Text('Favoritos'),
  	),
  	body: favorites.isEmpty
      	? Center(
          	child: Text(
            	'No tienes personajes favoritos aún.',
            	style: TextStyle(fontSize: 18),
          	),
        	)
      	: ListView.builder(
          	itemCount: favorites.length,
          	itemBuilder: (context, index) {
            	final character = favorites[index];
            	return ListTile(
              	title: Text(character.name),
              	subtitle: Text(character.culture),
              	onTap: () {
                	Navigator.push(
                  	context,
                  	MaterialPageRoute(
                    	builder: (context) => DetailScreen(character: character),
                  	),
                	);
              	},
            	);
          	},
        	),
	);
  }
}