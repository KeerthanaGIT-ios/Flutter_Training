import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_projet_new/utils/common_widgets/custom_dashedline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/src/timesheet/model/timesheet_unattended_model.dart';
import 'package:flutter_projet_new/utils/date_utils.dart';


class UnattendedCardItem extends StatelessWidget {
  // final String date;
  // final String title;
  // final String distance;
  // final String duration;
  // final String buttonTitle;
  // final bool isPremium;
  // final bool isDay;\
  final UnattendedShiftItem shiftItem;
  final String selectedTab;
  final VoidCallback onTap;
  final bool isSelected;
  final ValueChanged<bool> selectedChanged;
  final bool isRejected;
  final bool isWaitingForApproval;

  const UnattendedCardItem({
    Key? key,
    // required this.date,
    // required this.title,
    // required this.distance,
    // required this.duration,
    // required this.buttonTitle,
    // required this.isPremium,
    // required this.isDay,
    required this.shiftItem,
    required this.onTap,
    required this.selectedTab,
    required this.isSelected,
    required this.selectedChanged,
    this.isRejected = false,
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
              // Gradient Header
              Padding(
                padding: EdgeInsets.all(5.r),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF5E1FA),
                        Color(0xFFFFF2C5),
                        Color(0xFFE65656)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child:
                      // Left content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //premium content
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 15.h, 0.w, 0.h), //15
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
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
                                        formatToCustomDate(shiftItem.date),
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xFF191B1E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //title
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.w, 10.h, 0.w, 0.h),
                            child: Text(
                              shiftItem.client,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //description

Padding(
  padding: EdgeInsets.fromLTRB(15.w, 10.h, 0.w, 10.h),
  child: Row(
    children: [
      SvgPicture.asset(
        'assets/icons/timesheet/timesheet_direction.svg',
        height: 12.h,
        width: 12.w,
      ),
      SizedBox(width: 5,),
      Text(
        shiftItem.distance.toString(),
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(width: 10,),
      SvgPicture.asset(
        'assets/icons/timesheet/timesheet_unattended_clock.svg',
        height: 12.h,
        width: 12.w,
      ),
      SizedBox(width: 5,),
      Text(
       '${shiftItem.startTime}  -  ${shiftItem.endTime}',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  ),
)
                        ],
                      ),
                ),
              ),

              // Bottom Details and Conditional Button
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 4.h), //(16, 0, 0, 4)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isRejected
                        ?
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.h),
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/timesheet/timesheet_flagged_exclamation.svg',
                            height: 16.h,
                            width: 16.w,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: RichText(
                              text:
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    'The hours logged in the timesheet don’t match the actual working hours... ',
                                    style: TextStyle(
                                      color: Color(0xFFE53B40),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Handle Read More
                                      },
                                      child: Text(
                                        'Read more',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF191B1E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                        : Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '€${shiftItem.totalPayRate.toString()}',
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
                                      borderRadius: BorderRadius.circular(
                                        15.r,
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFFFC076),
                                        width: 1.w,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 2.h,
                                    ), // This stays
                                    child:
                                    //instant payout
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/timesheet/timesheet_payout_icon.svg',
                                          height: 13.h,
                                          width: 13.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        // Space between icon and text
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
                              "Total: ${shiftItem.duration} Hrs * €${shiftItem.hourlyRate}/hr",
                              style: TextStyle(color: Color(0xFF616169)),
                            ),
                          ],
                        ),
                        Spacer(),
                        selectedTab == 'Withdraw'
                            ? Padding(
                          padding: EdgeInsets.only(right: 0.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                isSelected ? 'Selected' : 'Select',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF191B1E),
                                ),
                              ),
                              Checkbox(
                                value: isSelected,
                                onChanged:
                                    (value) => selectedChanged(value!),
                                activeColor: Colors.black,
                                side: BorderSide(
                                  color: Color(0xFFB8BBBE),
                                  // Customize border color
                                  width: 2.w,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    4.r,
                                  ),
                                ),
                                visualDensity:
                                VisualDensity
                                    .compact, // Makes it tighter if needed
                              ),
                            ],
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.only(right: 0.w),
                          child: TextButton(
                            onPressed: onTap,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: isWaitingForApproval ? Colors.grey.withValues(alpha: 0.5)
                                    :
                                kPrimaryColor,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  color: isWaitingForApproval ? Colors.black :
                                  Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    if (selectedTab == 'Submitted')
                    //dashed line
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.w,
                              vertical: 8.h,
                            ),
                            child: const MySeparator(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/timesheet/timesheet_submitted_exclamation.svg',
                                  height: 16.h,
                                  width: 16.w,
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 0.h,
                                  ),
                                  child: Text(
                                    'Payment will be credited by Feb 24',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF191B1E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
