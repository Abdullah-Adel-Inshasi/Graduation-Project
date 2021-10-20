
import 'package:flutter/material.dart';

class appbar extends SliverPersistentHeaderDelegate {
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.red,
    );
  }

  @override
  double get maxExtent => 75;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
