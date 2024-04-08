import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_padding.dart';
import 'package:lunii_homework/core/theme/app_shaping.dart';
import 'package:lunii_homework/core/utils/duration_format.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

class MovieInfoDetailsCardWidget extends StatelessWidget {
  final MovieInfoEntity movieInfo;
  const MovieInfoDetailsCardWidget({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all16,
      decoration: const BoxDecoration(
        borderRadius: AppShaping.borderRadius16,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 14
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoPiece(
            context: context,
            title: "Rated",
            value: movieInfo.rated
          ),
          _infoPiece(
            context: context,
            title: "Duration",
            value: formatDuration(movieInfo.runtime)
          ),
          _infoPiece(
            context: context,
            title: "Language",
            value: movieInfo.language
          ),
          _infoPiece(
            context: context,
            title: "Rating",
            value: "${movieInfo.rating ?? "??"}/10"
          )
        ],
      ),
    );
  }

  Widget _infoPiece({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
