import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_projet_new/utils/common_widgets/custom_dashedline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/src/timesheet/model/timesheet_withdraw_model.dart';
import 'package:flutter_projet_new/utils/date_utils.dart';

class WithdrawCardItem extends StatelessWidget {
  final WithdrawShift shift;
  final bool isPremium;
  // final bool isDay;
  // final String selectedTab;
  final VoidCallback onTap;
  final bool isSelected;
  final ValueChanged<bool> selectedChanged;
  // final bool isRejected;
  final bool isWaitingForApproval;

  const WithdrawCardItem({
    Key? key,
    required this.shift,
    required this.isPremium,
    // required this.isDay,
    required this.onTap,
    // required this.selectedTab,
    required this.isSelected,
    required this.selectedChanged,
    // this.isRejected = false,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                        formatToCustomDate(shift.date),
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
                              shift.client.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //description
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
                            color:
                            Color(0xFF191B1E)
                            // isDay ?
                            // Color(0xFF191B1E) : Colors.white,
                          ),
                        ),
                      ),
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

                                // if (isSelected)
                                //   Container(
                                //     decoration: BoxDecoration(
                                //       color: Color(0xFFFFF8D1),
                                //       borderRadius: BorderRadius.circular(
                                //         15.r,
                                //       ),
                                //       border: Border.all(
                                //         color: Color(0xFFFFC076),
                                //         width: 1.w,
                                //       ),
                                //     ),
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 8.w,
                                //       vertical: 2.h,
                                //     ), // This stays
                                //     child:
                                //     //instant payout
                                //     Row(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         SvgPicture.asset(
                                //           'assets/icons/timesheet/timesheet_payout_icon.svg',
                                //           height: 13.h,
                                //           width: 13.w,
                                //         ),
                                //         SizedBox(width: 4.w),
                                //         // Space between icon and text
                                //         Text(
                                //           'Instant payout',
                                //           style: TextStyle(
                                //             color: Color(0xFFB17F00),
                                //             fontSize: 12.sp,
                                //             fontWeight: FontWeight.w500,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
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

                        Padding(
                          padding: EdgeInsets.only(right: 0.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                // isSelected ? 'Selected' :
                                'Select',
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
