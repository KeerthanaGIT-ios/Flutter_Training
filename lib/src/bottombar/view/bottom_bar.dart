import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_projet_new/src/timesheet/view/timesheet_page/timesheet_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Always fixed to 3 (Time sheets tab)
  final int _currentIndex = 3;

  final Widget _timesheetPage = Center(child: TimeSheetPage());

  void _onItemTapped(int index) {
    if (index != 3) return; // Prevent navigation to other tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _timesheetPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        selectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1C1C1C),
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tab_home_unselected.svg',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tab_find_unselected.svg',
              width: 24,
              height: 24,
            ),
            label: 'Find Shifts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tab_booking_unselected.svg',
              width: 24,
              height: 24,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tab_timesheet_selected.svg',
              width: 24,
              height: 24,
            ),
            label: 'Time sheets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/tab_availability_unselected.svg',
              width: 24,
              height: 24,
            ),
            label: 'Availability',
          ),
        ],
      ),
    );
  }
}
