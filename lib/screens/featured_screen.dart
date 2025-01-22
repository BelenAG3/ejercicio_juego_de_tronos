import 'package:flutter/material.dart';
import 'package:ejercicio_juego_de_tronos/models/character.dart';
import 'package:ejercicio_juego_de_tronos/services/api_service.dart';
class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}
class _FeaturedScreenState extends State<FeaturedScreen> {
  Character? _character;
  bool _isLoading = true;
  @override
  void initState() {
	super.initState();
	_loadRandomCharacter();
  }
  Future<void> _loadRandomCharacter() async {
	setState(() => _isLoading = true);
	try {
  	final character = await ApiService.fetchRandomCharacter();
  	setState(() => _character = character);
	} catch (e) {
  	print('Error: $e');
	} finally {
  	setState(() => _isLoading = false);
	}
  }
  @override
  Widget build(BuildContext context) {
	return Scaffold(
  	appBar: AppBar(title: Text('Personaje Destacado')),
  	body: _isLoading
      	? Center(child: CircularProgressIndicator())
      	: _character == null
          	? Center(child: Text('No se pudo cargar el personaje'))
          	: Column(
              	mainAxisAlignment: MainAxisAlignment.center,
              	children: [
                	Text('Nombre: ${_character!.name}', style: TextStyle(fontSize: 20)),
                	Text('Género: ${_character!.gender}', style: TextStyle(fontSize: 16)),
                	Text('Cultura: ${_character!.culture}', style: TextStyle(fontSize: 16)),
                	ElevatedButton(
                  	onPressed: _loadRandomCharacter,
                  	child: Text('Cargar otro'),
                	),
              	],
            	),
  	drawer: Drawer(
    	child: ListView(
      	children: [
        	DrawerHeader(
          	child: Text('Game of Thrones', style: TextStyle(fontSize: 24, color: Colors.white)),
          	decoration: BoxDecoration(color: Colors.blue),
        	),
        	ListTile(
          	title: Text('Listado'),
          	onTap: () {
            	Navigator.pushNamed(context, '/list');
          	},
        	),
        	ListTile(
          	title: Text('Favoritos'),
          	onTap: () {
            	Navigator.pushNamed(context, '/favorites');
          	},
        	),
      	],
    	),
  	),
	);
  }
}