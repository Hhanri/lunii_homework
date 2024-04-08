import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_colors.dart';
import 'package:lunii_homework/core/theme/app_padding.dart';
import 'package:lunii_homework/core/theme/app_shaping.dart';
import 'package:lunii_homework/core/theme/app_spacing.dart';
import 'package:lunii_homework/core/widgets/poster_image_widget.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';

class MovieInfoHeader extends StatelessWidget {

  final MovieInfoEntity movieInfo;

  const MovieInfoHeader({super.key, required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: _HeaderCurvePainter(),
          size: Size(
            double.infinity,
            MediaQuery.sizeOf(context).height*0.3
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              AppSpacing.h32,

              PosterImageWidget(
                url: movieInfo.posterUrl,
                size: 160,
              ),
              AppSpacing.h16,
              Text(
                movieInfo.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AppSpacing.h16,
              FilledButton.tonalIcon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text("Watch")
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: AppPadding.all16,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: AppShaping.borderRadius24
            ),
            child: IconButton(
              onPressed: Navigator.of(context).maybePop,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        )
      ],
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = AppColors.primary;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}