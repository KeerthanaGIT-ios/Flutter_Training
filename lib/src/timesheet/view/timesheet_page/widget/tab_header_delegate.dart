// tab_header_delegate.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  TabHeaderDelegate({required this.child});

  @override
  double get minExtent => 48.h;

  @override
  double get maxExtent => 48.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant TabHeaderDelegate oldDelegate) {
    return true;
  }
}
