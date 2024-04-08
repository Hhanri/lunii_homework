import 'package:flutter/material.dart';
import 'package:lunii_homework/features/search_movies/presentation/pages/search_movie_page.dart';
import 'package:lunii_homework/features/search_movies/presentation/stores/search_movies_store.dart';
import 'package:lunii_homework/setup/setup_sl.dart';
import 'package:provider/provider.dart';

class SearchMoviePageWrapper extends StatelessWidget {
  const SearchMoviePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SearchMoviesStore>(
          create: (_) => sl.get<SearchMoviesStore>(),
        )
      ],
      child: const SearchMoviePage(),
    );
  }
}
