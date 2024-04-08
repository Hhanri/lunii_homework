import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_colors.dart';
import 'package:lunii_homework/core/theme/app_shaping.dart';
import 'package:lunii_homework/core/value_objects/url.dart';

class PosterImageWidget extends StatelessWidget {

  final Url? url;
  final double? size;

  const PosterImageWidget({
    super.key,
    required this.url,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 100,
      width: size ?? 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2
        ),
        borderRadius: AppShaping.borderRadius8,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 14,
            offset: Offset(0, 2)
          )
        ]
      ),
      child: url == null
        ? const ColoredBox(color: AppColors.errorBackground)
        : CachedNetworkImage(
            imageUrl: url!.value,
            fit: BoxFit.cover
          )
    );
  }
}
