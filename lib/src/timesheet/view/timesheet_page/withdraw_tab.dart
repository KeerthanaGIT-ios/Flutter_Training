import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projet_new/src/timesheet/providers/withdraw_provider.dart';
import 'widget/withdraw_card_item.dart';
import 'widget/common_section_title.dart';

class TimeSheetWithdrawTab extends StatefulWidget {
  @override
  _TimeSheetWithdrawTabState createState() => _TimeSheetWithdrawTabState();
}

class _TimeSheetWithdrawTabState extends State<TimeSheetWithdrawTab> {
  // For checkbox selection tracking
  Set<String> selectedShiftIds = {};

  @override
  void initState() {
    super.initState();
    Provider.of<WithdrawProvider>(context, listen: false).fetchWithdrawData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WithdrawProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    final weekData = provider.timesheetWithdrawResponse?.data.data ?? [];

    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: weekData.length,
      itemBuilder: (context, weekIndex) {
        final week = weekData[weekIndex];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(week.week), // Section title for week
            ...List.generate(week.shifts.length, (shiftIndex) {
              final shift = week.shifts[shiftIndex];
              final isSelected = selectedShiftIds.contains(shift.id);

              return WithdrawCardItem(
               shift: shift,
                isPremium: false,
                // isDay: shiftIndex.isEven,
                isSelected: isSelected,
                selectedChanged: (value) {
                  setState(() {
                    if (value) {
                      selectedShiftIds.add(shift.id);
                    } else {
                      selectedShiftIds.remove(shift.id);
                    }
                  });
                },
                onTap: () {
                  // Handle tap (optional)
                  print('Tapped shift ${shift.id}');
                },
              );
            }),
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
