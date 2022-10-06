import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/models/movie_model.dart';
import 'package:http/http.dart';

class MoviesScreen extends StatefulWidget {
  static const String id = 'movies_screen';

  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  var moviesList = <MovieModel>[];

  @override
  void initState() {
    super.initState();

    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de filmes'),
      ),
      body: (moviesList.isEmpty)
          ? const Center(
              child: Text('Carregando...'),
            )
          : ListView.separated(
              itemCount: moviesList.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  elevation: 4,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.network(
                          moviesList[index].image,
                          width: 80,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moviesList[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              moviesList[index].description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void fetchMovies() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      moviesList = responseJson['results']
          .map<MovieModel>((e) => MovieModel(
                title: e['original_title'],
                description: e['overview'],
                image: e['poster_path'],
              ))
          .toList();

      setState(() {});
    } catch (error) {
      print('deu ruim');
    }
  }
}
