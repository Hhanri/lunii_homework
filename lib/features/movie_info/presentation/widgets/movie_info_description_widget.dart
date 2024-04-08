import 'package:flutter/material.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/presentation/widgets/movie_info_details_card_widget.dart';

import '../../../../core/theme/app_spacing.dart';

class MovieInfoDescriptionWidget extends StatelessWidget {
  final MovieInfoEntity movieInfo;
  const MovieInfoDescriptionWidget({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieInfoDetailsCardWidget(movieInfo: movieInfo),
        AppSpacing.h16,
        Text(
          movieInfo.plot,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
