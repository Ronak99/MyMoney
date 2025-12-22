import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';

typedef HeaderBuilder<T> = Widget Function(T);
typedef ItemBuilder<K> = Widget Function(K);

class ListViewWithHeader<T, K> extends StatelessWidget {
  final Map<T, List<K>> map;
  final HeaderBuilder<T> headerBuilder;
  final ItemBuilder<K> itemBuilder;
  final SeparatorBuilder? separatorBuilder;
  final bool fabSafeArea;

  const ListViewWithHeader({
    super.key,
    required this.map,
    required this.headerBuilder,
    required this.itemBuilder,
    this.separatorBuilder,
    this.fabSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        slivers: map.keys
            .map(
              (key) => SliverStickyHeader(
                header: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    border: Border(
                      bottom: BorderSide(
                        color: context.colorScheme.primary.withOpacity(.2),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: headerBuilder(key),
                ),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: map.keys.toList().indexOf(key) ==
                                    map.keys.length - 1 &&
                                fabSafeArea
                            ? 100
                            : 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: context.colorScheme.primary.withOpacity(.2),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: ListViewSeparated(
                      list: map[key]!,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: separatorBuilder,
                      itemBuilder: (context, index, item) => itemBuilder(item),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
