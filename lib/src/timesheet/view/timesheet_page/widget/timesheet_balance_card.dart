import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import '../../../providers/timesheet_page_provider.dart';
import 'package:provider/provider.dart';

class TimesheetBalanceCardWidget extends StatefulWidget {
  const TimesheetBalanceCardWidget({super.key});

  @override
  State<TimesheetBalanceCardWidget> createState() => _TimesheetBalanceCardWidgetState();
}

class _TimesheetBalanceCardWidgetState extends State<TimesheetBalanceCardWidget> {
  @override
  void initState() {
    super.initState();
    // Load API data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TimesheetPageProvider>(context, listen: false).loadTotalBalanceData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimesheetPageProvider>(context);

    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF616169),
              ),
            ),
            Text(
              '€${provider.summary?.basicPayAmount ?? 0}', // Example usage
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF181A1A),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(40, (index) {
                return Container(
                  width: 2.5.w,
                  height: 1.h,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                );
              }),
            ),
            Row(
              children: [
                Text(
                  'Holiday Pay Balance ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF181A1A),
                  ),
                ),
                Text(
                  '€${provider.summary?.holidayPayAmount ?? 0}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: 16.r,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


