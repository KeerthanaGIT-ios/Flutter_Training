import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_projet_new/utils/common_widgets/custom_dashedline.dart';
import 'package:flutter_projet_new/src/timesheet/model/timesheet_submitted_model.dart'; // Adjust the import path
import 'package:flutter_projet_new/utils/date_utils.dart';

class SubmittedCardItem extends StatelessWidget {
  // final TimesheetSubmitted? submittedData;
  final Shift shift; // instead of TimesheetSubmitted
  final VoidCallback onTap;
  final bool isSelected;
  final ValueChanged<bool> selectedChanged;
  final bool isWaitingForApproval;

  const SubmittedCardItem({
    Key? key,
    required this.shift,
    // required this.submittedData,
    required this.onTap,
    required this.isSelected,
    required this.selectedChanged,
    this.isWaitingForApproval = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 16.h),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD5D5D5), width: 1.w),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top header
              Padding(
                padding: EdgeInsets.all(5.r),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF5E1FA),
                        Color(0xFFFFF2C5),
                        Color(0xFFE65656),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 15.h, 0.w, 0.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 3.h,
                                ),
                                child: Text(
                                formatToCustomDate(shift.date),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Color(0xFF191B1E),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Title
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 10.h, 0.w, 0.h),
                            child: Text(
                             shift.client.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Address (replace with real value when available)
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 5.h, 0.w, 10.h),
                            child: Text(
                              shift.client.address ?? '',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 15.h, 15.w, 0.h),
                        child: Text(
                          '#${shift.shiftCode}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Details + button
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "€${shift.hourlyRate}",
                                  style: TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (isSelected)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF8D1),
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                        color: Color(0xFFFFC076),
                                        width: 1.w,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 2.h,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/timesheet/timesheet_payout_icon.svg',
                                          height: 13.h,
                                          width: 13.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          'Instant payout',
                                          style: TextStyle(
                                            color: Color(0xFFB17F00),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Total: ${shift.totalWorkedHours} Hrs * €${shift.hourlyRate}/hr",
                              style: TextStyle(color: Color(0xFF616169)),
                            ),
                          ],
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: onTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: isWaitingForApproval
                                  ? Colors.grey.withOpacity(0.5)
                                  : kPrimaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                color: isWaitingForApproval ? Colors.black : Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Dashed line + info
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.w,
                            vertical: 8.h,
                          ),
                          child: const MySeparator(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/timesheet/timesheet_submitted_exclamation.svg',
                              height: 16.h,
                              width: 16.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                'Payment will be credited by ${shift.expectedDate}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF191B1E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
