import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunii_homework/core/theme/app_spacing.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

class MovieInfoCreditWidget extends StatelessWidget {
  final MovieInfoEntity movieInfo;
  const MovieInfoCreditWidget({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row(context: context, title: "Release", value: DateFormat(DateFormat.YEAR_NUM_MONTH_DAY).format(movieInfo.released)),
        _row(context: context, title: "Director", value: movieInfo.director),
        _row(context: context, title: "Writers", value: movieInfo.writers.join(' | ')),
        _row(context: context, title: "Actors", value: movieInfo.actors.join(' | ')),
      ],
    );
  }

  Widget _row({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSpacing.w32,
        Flexible(child: Text(value))
      ],
    );
  }
}
