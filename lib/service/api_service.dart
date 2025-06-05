import 'dart:convert';
import 'package:http/http.dart' as http;
import '../src/timesheet/model/timesheet_balance_card_model.dart';
import '../src/timesheet/model/timesheet_submitted_model.dart';
import '../src/timesheet/model/timesheet_withdraw_model.dart';
import '../src/timesheet/model/timesheet_flagged_model.dart';
import '../src/timesheet/model/timesheet_unattended_model.dart';

class ApiService {
  //Total Balance
  Future<TimesheetBalance> fetchTimesheetBalance() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/395122fc-7fe7-4a3c-9634-29183f017596'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TimesheetBalance.fromJson(json);
    } else {
      throw Exception('Failed to load timesheet balance');
    }
  }

  //Submitted tab
Future<TimesheetSubmitted> fetchSubmittedTabData() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/d606ccd6-6720-40a1-91c7-220f12ddf7b9'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print("::::::::Data in submitted tab::::::: $json");
      return TimesheetSubmitted.fromJson(json);
    } else {
      throw Exception('Failed to load submitted tab data');
    }
}

//withdraw tab
Future<TimesheetWithdrawResponse> fetchWithdrawTabData() async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/28807b48-23ae-4be8-929f-ab2b10f6f217'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print("::::::::Data in withdraw tab::::::: $json");
    return TimesheetWithdrawResponse.fromJson(json);
  } else {
    throw Exception('Failed to load withdraw tab data');
  }
}

//Flagged tab
  Future<TimesheetFlaggedResponse> fetchFlaggedTabData() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/8d4be20a-0fe6-4846-ab26-26ccee3374d7'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print("::::::::Data in Flagged tab:::::::");
      return TimesheetFlaggedResponse.fromJson(json);
    } else {
      throw Exception('Failed to load flagged tab data');
    }
  }

  //Unattended tab
  Future<TimesheetUnattendedResponse> fetchUnattendedTabData() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/be72b43a-5783-4767-a405-1ad2a00dbf47'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print("::::::::Data in Unattended tab::::::: $json");
      return TimesheetUnattendedResponse.fromJson(json);
    } else {
      throw Exception('Failed to load Unattended tab data');
    }
  }
}
