import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSheetPaymentsPage extends StatefulWidget {
  @override
  _TimeSheetPaymentsPageState createState() => _TimeSheetPaymentsPageState();
}

class _TimeSheetPaymentsPageState extends State<TimeSheetPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
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
          'Payments',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C1C1C),
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Week 28',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Gross Pay',
                    style: TextStyle(
                      color: Color(0xFF191B1E),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '€204.72',
                        style: TextStyle(
                          color: Color(0xFF191B1E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Show Details',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF019B5B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Container(
              padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.h), //16
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Week 28',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Gross Pay',
                    style: TextStyle(
                      color: Color(0xFF191B1E),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '€342.00',
                        style: TextStyle(
                          color: Color(0xFF191B1E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Hide Details',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF019B5B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  customRow('Paye', '€ null'),
                  customRow('USC', '€ null'),
                  customRow('PRSI', '€ null'),
                  customRow('Allowance', '€ 0.00'),
                  customRow('Net Pay', '€ null', true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customRow(String payType, String amt, [bool isLastLine = false]) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payType,
                style: TextStyle(
                  color: Color(0xFF191B1E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                amt,
                style: TextStyle(
                  color: Color(0xFF191B1E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          //line
          if (!isLastLine)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.w),
                height: 1.h,
                color: Color(0xFFE7E7E7),
              ),
            ),
        ],
      ),
    );
  }
}
