import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_padding.dart';
import 'package:lunii_homework/core/theme/app_spacing.dart';
import 'package:lunii_homework/core/widgets/poster_image_widget.dart';
import 'package:lunii_homework/features/movie_info/presentation/pages/movie_info_page_wrapper.dart';
import 'package:lunii_homework/features/search_movies/domain/entities/movie_preview_entity.dart';

class SearchMoviePreviewTile extends StatelessWidget {
  final MoviePreviewEntity movie;
  const SearchMoviePreviewTile(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.all8,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return MovieInfoPageWrapper(id: movie.id);
            })
          );
        },
        child: Row(
          children: [
            Padding(
              padding: AppPadding.all4,
              child: PosterImageWidget(
                url: movie.posterUrl,
                size: 75,
              ),
            ),
            AppSpacing.w8,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text("${movie.type.name} | ${movie.year}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
