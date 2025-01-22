import 'package:flutter/material.dart';
import 'package:ejercicio_juego_de_tronos/models/character.dart';
import 'package:ejercicio_juego_de_tronos/services/api_service.dart';
import 'package:ejercicio_juego_de_tronos/screens/detail_screen.dart';
class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}
class _ListScreenState extends State<ListScreen> {
  final int _pageSize = 10;
  int _currentPage = 1;
  List<Character> _characters = [];
  bool _isLoading = false;
  @override
  void initState() {
	super.initState();
	_loadCharacters();
  }
  Future<void> _loadCharacters() async {
	setState(() => _isLoading = true);
	try {
  	final characters = await ApiService.fetchCharacters(_currentPage, _pageSize);
  	setState(() => _characters.addAll(characters));
	} catch (e) {
  	print('Error: $e');
	} finally {
  	setState(() => _isLoading = false);
	}
  }
  @override
  Widget build(BuildContext context) {
	return Scaffold(
  	appBar: AppBar(title: Text('Lista de Personajes')),
  	body: ListView.builder(
    	itemCount: _characters.length + 1,
    	itemBuilder: (context, index) {
      	if (index == _characters.length) {
        	return _isLoading
            	? Center(child: CircularProgressIndicator())
            	: ElevatedButton(
                	onPressed: () {
                  	_currentPage++;
                  	_loadCharacters();
                	},
                	child: Text('Cargar más'),
              	);
      	}
      	final character = _characters[index];
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