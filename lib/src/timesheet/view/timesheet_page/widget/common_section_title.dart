import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget SectionTitle(String title) => Padding(
  padding: EdgeInsets.only(bottom: 10.h),
  child: Text(
    title,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  ),
);