import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSheetSummaryPage extends StatefulWidget {
  @override
  _TimeSheetSummaryPageState createState() => _TimeSheetSummaryPageState();
}

class _TimeSheetSummaryPageState extends State<TimeSheetSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/black_backarrow.svg',
            height: 17.h,
            width: 19.w,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Summary',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C1C1C),
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Total Working Hours
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF5E1FA).withValues(alpha: 0.8),
                      Color(0xFFFFF2C5).withValues(alpha: 0.8),
                      Color(0xFFE65656).withValues(alpha: 0.8),
                    ], // Example colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/timesheet/timesheet_summary_clock.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'Total Working Hours',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Jul 25, 2024',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6.15 Hrs',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                          Text(
                            '€8.99/hr',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Check In',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              '25 Jul 04:00 PM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF191B1E),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              '25 Jul 10:00 PM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF191B1E),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.5,
                        color: Color(0x12E43144),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Text(
                            'Kens Care Home',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                        ),
                        Text(
                          'Kens Care Home Chapel Rd, Abbey \nknockmoy, Tuam, Co Galway H56RX78',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 5.h),
                          child: Text(
                            'Break: 15 Minutes',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                        ),
                        Text(
                          'Break time is unpaid and not part of \nworking hours.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //User updated Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Container(
                padding: EdgeInsets.all(15.0.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Color(0xFF3FC78F), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Updated Details',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF191B1E),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Text(
                      '6.15 Hrs',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF191B1E),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check In',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                              Text(
                                '25 Jul 04:00 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF191B1E),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Check Out',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1C1C1C),
                                ),
                              ),
                              Text(
                                '25 Jul 10:00 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF191B1E),
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
            //Manager Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
              child: Container(
                padding: EdgeInsets.all(15.0.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manager Details',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/up_arrow.svg',
                            height: 10.h,
                            width: 14.w,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'keje@gnaul.com',
                      style: TextStyle(
                        color: Color(0xFF191B1E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'ken@xpresshealth.ie',
                      style: TextStyle(
                        color: Color(0xFF191B1E),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        '6.15 Hrs',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF191B1E),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Check In',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              '25 Jul 04:00 PM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF191B1E),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              '25 Jul 10:00 PM',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF191B1E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Payment Summary
            Padding(
              padding: EdgeInsets.fromLTRB(16.0.w, 0.h, 16.0.w, 20.0.h),
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0.w, 10.0.h, 15.0.w, 15.0.h), //15
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Summary',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191B1E),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/up_arrow.svg',
                              height: 10.h,
                              width: 14.w,
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Hour(s)',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        Text(
                          '6.15',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hourly Pay',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '€32',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF1C1C1C),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Basic Pay',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        Text(
                          '28.12',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Holiday Pay',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        Text(
                          '3.88',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Basic',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 5.w, 0.h), child:
                        Text(
                          '1.99*28.12 =',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        ),
                        Text(
                          '55.96',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Holiday pay',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                            Text(
                              '(holiday pay is being accrued)',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1C1C1C),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 5.w, 0.h), child:
                        Text(
                          '1.99*28.12 =',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1C1C1C),
                          ),
                        )
                          ,),
                        Text(
                          '7.72',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Travel allowance',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 5.w, 0.h), child:
                        Text(
                          '0 =',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Net pay',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                        Spacer(),
                        Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 5.w, 0.h), child:
                        Text(
                          '55.96+7.72+0 =',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),),
                        Text(
                          '63.68',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1C1C),
                          ),
                        ),
                      ],
                    ),
                    //line
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 1.h,
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF191B1E),
                          ),
                        ),
                        Text(
                          '€63.68',
                          style: TextStyle(
                            color: Color(0xFF00BB6E),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
