import 'package:flutter/material.dart';
import 'package:lunii_homework/features/search_movies/presentation/pages/search_movie_page_wrapper.dart';
import 'package:lunii_homework/setup/setup_sl.dart';

void main() async {
  await setupSL(
    omdbApiKey: const String.fromEnvironment('OMDB_API_KEY')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunii Homework',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchMoviePageWrapper(),
    );
  }
}