import 'package:flutter/material.dart';
import 'package:flutter_projet_new/service/api_service.dart';
import '../model/timesheet_submitted_model.dart';

class SubmittedProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  String? error;
  TimesheetSubmitted? submittedData;

  Future<void> fetchSubmittedData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      submittedData = await _apiService.fetchSubmittedTabData();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
