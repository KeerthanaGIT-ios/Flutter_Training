import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projet_new/src/timesheet/providers/flagged_provider.dart';
import 'widget/flagged_card_item.dart';
import 'widget/common_section_title.dart';

class TimeSheetFlaggedTab extends StatefulWidget {
  @override
  _TimeSheetFlaggedTabState createState() => _TimeSheetFlaggedTabState();
}

class _TimeSheetFlaggedTabState extends State<TimeSheetFlaggedTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<FlaggedProvider>(context, listen: false).fetchFlaggedData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlaggedProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    final weekList = provider.flaggedData?.data.data ?? [];

    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: weekList.length,
      itemBuilder: (context, index) {
        final week = weekList[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(week.week),
            ...week.shifts.map((shift) {
              final client = shift.client;
              return
                FlaggedCardItem(
                shift: shift,
                // isDay: true,
                onTap: () {
                  // Handle tap
                },
                isSelected: false,
                selectedChanged: (_) {},
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
