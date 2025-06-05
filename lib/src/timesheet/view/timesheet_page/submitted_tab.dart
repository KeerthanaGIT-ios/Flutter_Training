import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/src/timesheet/providers/submitted_provider.dart';
import 'widget/submitted_card_item.dart';
import 'widget/common_section_title.dart';


class TimeSheetSubmittedTab extends StatefulWidget {
  @override
  _TimeSheetSubmittedTabState createState() => _TimeSheetSubmittedTabState();
}

class _TimeSheetSubmittedTabState extends State<TimeSheetSubmittedTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<SubmittedProvider>(context, listen: false).fetchSubmittedData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubmittedProvider>(context);

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    final weekData = provider.submittedData?.data.data ?? [];

    print("Data checking::::::: ${weekData}");

    return ListView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: weekData.length,
      itemBuilder: (context, index) {
        final week = weekData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(week.week),
            ...week.shifts.map((shift) =>
                SubmittedCardItem(
                 shift: shift,
              onTap: () {
                // handle navigation or other action
              },
              isSelected: false,
              selectedChanged: (_) {},
            )),
          ],
        );
      },
    );
  }
}
