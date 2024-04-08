import 'package:flutter/material.dart';
import 'package:lunii_homework/features/search_movies/presentation/widgets/search_movie_app_bar.dart';
import 'package:lunii_homework/features/search_movies/presentation/widgets/search_movie_list_view.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchMovieAppBar(),
          SearchMovieListView()
        ],
      ),
    );
  }
}
