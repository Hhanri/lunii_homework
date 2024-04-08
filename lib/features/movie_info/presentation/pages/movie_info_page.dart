import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lunii_homework/core/theme/app_spacing.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/presentation/widgets/movie_info_header.dart';
import 'package:lunii_homework/features/movie_info/presentation/widgets/movie_info_tab_view.dart';
import 'package:provider/provider.dart';

import '../stores/movie_info_store.dart';

class MovieInfoPage extends StatefulWidget {
  const MovieInfoPage({super.key});

  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  late MovieInfoStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MovieInfoStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: MovieInfoHeader(
                  movieInfo: store.movieInfo ?? MovieInfoEntity.placeholder()
                ),
              ),
              const SliverToBoxAdapter(
                child: AppSpacing.h16,
              ),
              SliverToBoxAdapter(
                child: MovieInfoTabView(
                  movieInfo: store.movieInfo ?? MovieInfoEntity.placeholder(),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
