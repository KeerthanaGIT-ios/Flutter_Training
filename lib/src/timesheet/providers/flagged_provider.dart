import 'package:flutter/material.dart';
import 'package:flutter_projet_new/service/api_service.dart';
import '../model/timesheet_flagged_model.dart'; // Make sure this points to your flagged model

class FlaggedProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? error;
  TimesheetFlaggedResponse? flaggedData;

  Future<void> fetchFlaggedData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      flaggedData = await _apiService.fetchFlaggedTabData();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
