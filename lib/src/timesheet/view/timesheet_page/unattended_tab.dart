import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/common_section_title.dart';
import 'widget/unattended_card_item.dart';
import 'package:flutter_projet_new/src/timesheet/providers/unattended_provider.dart';

class TimeSheetUnattendedTab extends StatefulWidget {
  @override
  _TimeSheetUnattendedTabState createState() => _TimeSheetUnattendedTabState();
}

class _TimeSheetUnattendedTabState extends State<TimeSheetUnattendedTab> {
  final String selectedTab = "Unattended";

  @override
  void initState() {
    super.initState();
    Provider.of<UnattendedProvider>(context, listen: false).fetchUnattendedData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UnattendedProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    final unattendedList = provider.unattendedData?.data.data ?? [];

    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        SectionTitle('Unattended Shifts'),
        ...unattendedList.map((shift) {
          return UnattendedCardItem(
           shiftItem: shift,
            // isDay: shift.shiftTiming == "day",
            onTap: () {
              // handle on tap
            },
            selectedTab: selectedTab,
            isSelected: false,
            selectedChanged: (_) {},
          );
        }).toList(),
      ],
    );
  }
}
