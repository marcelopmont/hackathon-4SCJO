import 'package:flutter/material.dart';
import 'package:hackathon/screens/menu_screen.dart';
import 'package:hackathon/screens/movies_screen.dart';

void main() {
  runApp(const HackathonApp());
}

class HackathonApp extends StatelessWidget {
  const HackathonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => const MenuScreen(),
        MoviesScreen.id: (context) => const MoviesScreen(),
      },
    );
  }
}
