import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lunii_homework/core/widgets/paginated_sliver_list_view.dart';
import 'package:lunii_homework/features/search_movies/presentation/stores/search_movies_store.dart';
import 'package:lunii_homework/features/search_movies/presentation/widgets/search_movie_preview_tile.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/movie_preview_entity.dart';

class SearchMovieListView extends StatefulWidget {
  const SearchMovieListView({super.key});

  @override
  State<SearchMovieListView> createState() => _SearchMovieListViewState();
}

class _SearchMovieListViewState extends State<SearchMovieListView> {

  late SearchMoviesStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<SearchMoviesStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (store.isLoading && store.movies.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return PaginatedSliverListView<MoviePreviewEntity>(
          items: store.movies,
          itemBuilder: SearchMoviePreviewTile.new,
          fetchMore: store.loadMore,
          error: store.error,
        );
      },
    );
  }
}
