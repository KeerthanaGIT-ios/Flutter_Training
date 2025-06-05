import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimesheetStickyTabWidget extends StatelessWidget {
  final String label;
  final String selectedTab;
  final Function(String) onTabSelected;

  const TimesheetStickyTabWidget({
    Key? key,
    required this.label,
    required this.selectedTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedTab == label;

    return GestureDetector(
      onTap: () => onTabSelected(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : const Color(0xFF999999),
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 2.h,
            width: 95.w,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
