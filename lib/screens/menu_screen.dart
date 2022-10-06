import 'package:flutter/material.dart';
import 'package:hackathon/screens/movies_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
              width: double.infinity,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MoviesScreen.id,
                );
              },
              child: Material(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8),
                elevation: 4,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Abrir seleção de filmes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
