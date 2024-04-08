import 'package:flutter/material.dart';
import 'package:lunii_homework/core/result/result.dart';

class PaginatedSliverListView<T extends Object> extends StatelessWidget {
  final List<T> items;
  final Failure? error;

  final Function() fetchMore;
  final Widget Function(T item) itemBuilder;
  final Widget Function(BuildContext context)? emptyBuilder;

  const PaginatedSliverListView({
    super.key,
    required this.items,
    this.error,

    this.emptyBuilder,
    required this.itemBuilder,
    required this.fetchMore,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SliverToBoxAdapter(
        child: emptyBuilder?.call(context)
          ?? const Center(child: Text("Empty data"),),
      );
    }

    if (error != null) {
      return SliverToBoxAdapter(
        child: Center(child: Text(error!.message),),
      );
    }

    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == items.length -1) {
          fetchMore();
        }
        return itemBuilder(items[index]);
      },
    );
  }
}
