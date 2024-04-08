import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_padding.dart';
import 'package:lunii_homework/core/theme/app_spacing.dart';
import 'package:lunii_homework/features/movie_info/domain/entities/movie_info_entity.dart';
import 'package:lunii_homework/features/movie_info/presentation/widgets/movie_info_credit_widget.dart';
import 'package:lunii_homework/features/movie_info/presentation/widgets/movie_info_description_widget.dart';

class MovieInfoTabView extends StatefulWidget {

  final MovieInfoEntity movieInfo;

  const MovieInfoTabView({super.key, required this.movieInfo});

  @override
  State<MovieInfoTabView> createState() => _MovieInfoTabViewState();
}

class _MovieInfoTabViewState extends State<MovieInfoTabView> {

  final tabs = const [
    Tab(text: "Description",),
    Tab(text: "Credits",),
  ];

  int selectedTab = 0;

  void changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: tabs.length,
          child: TabBar(
            tabs: tabs,
            onTap: changeTab,
          )
        ),
        AppSpacing.h16,
        Padding(
          padding: AppPadding.h16,
          child: switch(selectedTab) {
            0 => MovieInfoDescriptionWidget(movieInfo: widget.movieInfo),
            1 => MovieInfoCreditWidget(movieInfo: widget.movieInfo),
            _ => MovieInfoDescriptionWidget(movieInfo: widget.movieInfo),
          } ,
        )
      ],
    );
  }

}
