import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projet_new/src/bottombar/view/bottom_bar.dart';
import 'src/timesheet/providers/submitted_provider.dart';
import 'src/timesheet/providers/timesheet_page_provider.dart';
import 'src/timesheet/providers/withdraw_provider.dart';
import 'src/timesheet/providers/flagged_provider.dart';
import 'src/timesheet/providers/unattended_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubmittedProvider()),
        ChangeNotifierProvider(create: (_) => TimesheetPageProvider()),
        ChangeNotifierProvider(create: (_) => WithdrawProvider()),
        ChangeNotifierProvider(create: (_) => FlaggedProvider()),
        ChangeNotifierProvider(create: (_) => UnattendedProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF019B5B),
          ),
          home: BottomNav(),
        );
      },
    );
  }
}
