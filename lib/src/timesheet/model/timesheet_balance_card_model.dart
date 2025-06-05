class TimesheetBalance {
  final bool success;
  final TimesheetBalanceData data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  TimesheetBalance({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory TimesheetBalance.fromJson(Map<String, dynamic> json) {
    return TimesheetBalance(
      success: json['success'] ?? false,
      data: TimesheetBalanceData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      errors: json['errors'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.toJson(),
    'message': message,
    'status_code': statusCode,
    'errors': errors,
  };
}

class TimesheetBalanceData {
  final int basicPayAmount;
  final int holidayPayAmount;
  final int withdrawCount;

  TimesheetBalanceData({
    required this.basicPayAmount,
    required this.holidayPayAmount,
    required this.withdrawCount,
  });

  factory TimesheetBalanceData.fromJson(Map<String, dynamic> json) {
    return TimesheetBalanceData(
      basicPayAmount: json['basic_pay_amount'] ?? 0,
      holidayPayAmount: json['holiday_pay_amount'] ?? 0,
      withdrawCount: json['withdraw_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'basic_pay_amount': basicPayAmount,
    'holiday_pay_amount': holidayPayAmount,
    'withdraw_count': withdrawCount,
  };
}
