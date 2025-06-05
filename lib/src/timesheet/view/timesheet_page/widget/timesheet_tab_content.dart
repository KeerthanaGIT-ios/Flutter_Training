// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_projet_new/src/timesheet/view/timesheet_summary/timesheet_summary_page.dart';
// import 'timesheet_card_item.dart';
//
// typedef SelectionChanged = void Function(bool);
//
// class TimesheetTabContent extends StatelessWidget {
//   final String selectedTab;
//   final List<bool> selectedStates;
//   final bool isAllSelected;
//   final Function(int index, bool value) onSelectChanged;
//   final void Function(bool?) onSelectAllChanged;
//
//
//   const TimesheetTabContent({
//     super.key,
//     required this.selectedTab,
//     required this.selectedStates,
//     required this.isAllSelected,
//     required this.onSelectChanged,
//     required this.onSelectAllChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     switch (selectedTab) {
//       case 'Submitted':
//         return _buildSubmitted(context);
//       case 'Withdraw':
//         return _buildWithdraw(context);
//       case 'Flagged':
//         return _buildFlagged(context);
//       case 'Unattended':
//         return _buildUnattended(context);
//       default:
//         return const SizedBox.shrink();
//     }
//   }
// }