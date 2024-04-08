import 'package:flutter/material.dart';
import 'package:lunii_homework/features/movie_info/presentation/pages/movie_info_page.dart';
import 'package:lunii_homework/features/movie_info/presentation/stores/movie_info_store.dart';
import 'package:provider/provider.dart';

import '../../../../setup/setup_sl.dart';

class MovieInfoPageWrapper extends StatelessWidget {

  final String id;

  const MovieInfoPageWrapper({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieInfoStore>(
          create: (_) => sl.get<MovieInfoStore>(param1: id)..fetch(),
        )
      ],
      child: const MovieInfoPage(),
    );
  }
}
