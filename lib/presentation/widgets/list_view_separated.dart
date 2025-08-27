import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);

typedef SeapratorBuilder = Widget Function(BuildContext context, int index);

class ListViewSeparated<T> extends StatelessWidget {
  final List<T> list;
  final SeapratorBuilder? seapratorBuilder;
  final ItemBuilder<T> itemBuilder;
  final String emptyStateText;
  final Axis axis;
  final EdgeInsets padding;

  const ListViewSeparated({
    super.key,
    required this.list,
    required this.itemBuilder,
    this.emptyStateText = "No items.",
    this.seapratorBuilder,
    this.axis = Axis.vertical,
    this.padding =  EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text(emptyStateText),
      );
    }
    return ListView.separated(
      scrollDirection: axis,
      padding: padding,
      itemBuilder: (context, index) => itemBuilder(context, index, list[index]),
      separatorBuilder: seapratorBuilder ?? (context, index) => const Divider(),
      itemCount: list.length,
    );
  }
}
