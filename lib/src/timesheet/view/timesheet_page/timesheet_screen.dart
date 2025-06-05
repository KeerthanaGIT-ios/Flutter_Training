import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_projet_new/res/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_projet_new/src/timesheet/view/timesheet_summary/timesheet_summary_page.dart';
import 'package:flutter_projet_new/src/timesheet/view/timesheet_payments/timesheet_payments_page.dart';
import 'widget/timesheet_card_item.dart';
import 'widget/timesheet_balance_card.dart';
import 'widget/timesheet_sticky_tab.dart';
import 'widget/tab_header_delegate.dart';
import 'submitted_tab.dart';
import 'flagged_tab.dart';
import 'withdraw_tab.dart';
import 'unattended_tab.dart';


class TimeSheetPage extends StatefulWidget {
  @override
  _TimeSheetPageState createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  String selectedTab = 'Submitted';
  bool isSelected = false;
  List<bool> selectedStates = [true, false];
  bool isAllSelected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) =>
        [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/black_menu_icon.svg',
                height: 24.h,
                width: 24.w,
              ),
              onPressed: () {},
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TimeSheetPaymentsPage(),
                    ),
                  );
                },
                child: Text(
                  'View Payments',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
            title: Text(
              'Time Sheet',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SliverToBoxAdapter(child: TimesheetBalanceCardWidget()),
          // Sticky Tab Section
          SliverPersistentHeader(
            pinned: true,
            delegate: TabHeaderDelegate(
              child: Container(
                color: Colors.white,
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 1.5.h,
                      width: double.infinity,
                      color: Color(0xFFDEDEDE),
                    ),
                // In SliverPersistentHeader → Replace _buildTab
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                          child:
                          Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          TimesheetStickyTabWidget(
                          label: 'Submitted',
                          selectedTab: selectedTab,
                          onTabSelected: (label) {
                      setState(() {
                      selectedTab = label;
                      });
                      },
                      ),
                      SizedBox(width: 5.w),
                      TimesheetStickyTabWidget(
                        label: 'Withdraw',
                        selectedTab: selectedTab,
                        onTabSelected: (label) {
                          setState(() {
                            selectedTab = label;
                          });
                        },
                      ),
                      SizedBox(width: 5.w),
                      TimesheetStickyTabWidget(
                        label: 'Flagged',
                        selectedTab: selectedTab,
                        onTabSelected: (label) {
                          setState(() {
                            selectedTab = label;
                          });
                        },
                      ),
                      SizedBox(width: 5.w),
                      TimesheetStickyTabWidget(
                        label: 'Unattended',
                        selectedTab: selectedTab,
                        onTabSelected: (label) {
                          setState(() {
                            selectedTab = label;
                          });
                        },
                      ),
                      ],
                    ),
                      ))

                  ],
                ),
              ),
            ),
          ),
        ],
        body:
  Builder(
      builder: (context) {
      switch (selectedTab) {
      case 'Submitted':
      return TimeSheetSubmittedTab();
      case 'Withdraw':
      return TimeSheetWithdrawTab();
      case 'Flagged':
      return TimeSheetFlaggedTab();
      case 'Unattended':
      return TimeSheetUnattendedTab();
      default:
      return const SizedBox.shrink();
      }
      }
  )
      ),
    );
  }
}
