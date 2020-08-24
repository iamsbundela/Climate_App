import 'package:flutter/material.dart';
import 'package:movieezz/screens/home_screen.dart';
import 'package:movieezz/screens/movie_screen.dart';
import 'package:movieezz/screens/search_result.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        MovieScreen.id: (context) => MovieScreen(),
      },
    );
  }
}
