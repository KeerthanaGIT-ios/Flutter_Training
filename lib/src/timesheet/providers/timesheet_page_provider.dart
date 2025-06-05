import 'package:flutter/material.dart';
import '../model/timesheet_balance_card_model.dart';
import 'package:flutter_projet_new/service/api_service.dart';

class TimesheetPageProvider with ChangeNotifier {
  TimesheetBalanceData? _totalBalanceData;
  bool _isLoading = false;

  TimesheetBalanceData? get summary => _totalBalanceData;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> loadTotalBalanceData() async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.fetchTimesheetBalance();
    _totalBalanceData = result.data;

    print("RESULT: ${_totalBalanceData?.basicPayAmount}");
    _isLoading = false;
    notifyListeners();
  }

  // Call 2: For Submitted Tab Data (you can customize it as needed)
  Future<void> loadSubmittedTabData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await _apiService.fetchSubmittedTabData();
      // Process result, maybe save it in another property

      print("Submitted Tab Data Loaded: ${result.data}");

    } catch (e) {
      print("Error loading submitted tab data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
