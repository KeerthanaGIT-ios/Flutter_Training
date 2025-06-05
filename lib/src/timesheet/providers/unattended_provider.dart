import 'package:flutter/material.dart';
import 'package:flutter_projet_new/service/api_service.dart';
import '../model/timesheet_unattended_model.dart';

class UnattendedProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? error;
  TimesheetUnattendedResponse? unattendedData;

  Future<void> fetchUnattendedData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      unattendedData = await _apiService.fetchUnattendedTabData();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
