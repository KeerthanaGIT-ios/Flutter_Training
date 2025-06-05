import 'package:flutter/material.dart';
import 'package:flutter_projet_new/service/api_service.dart';
import '../model/timesheet_withdraw_model.dart';

class WithdrawProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? error;
  TimesheetWithdrawResponse? timesheetWithdrawResponse;

  Future<void> fetchWithdrawData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      timesheetWithdrawResponse = await _apiService.fetchWithdrawTabData();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}