import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/featured_screen.dart';
import 'screens/list_screen.dart';
import 'screens/favorites_screen.dart';
void main() {
  runApp(
	MultiProvider(
  	providers: [
    	ChangeNotifierProvider(create: (_) => FavoritesProvider()),
  	],
  	child: MyApp(),
	),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	return MaterialApp(
  	debugShowCheckedModeBanner: false,
  	title: 'Game of Thrones',
  	theme: ThemeData(primarySwatch: Colors.blue),
  	initialRoute: '/',
  	routes: {
    	'/': (context) => FeaturedScreen(),
    	'/list': (context) => ListScreen(),
    	'/favorites': (context) => FavoritesScreen(),
  	},
	);
  }
}
