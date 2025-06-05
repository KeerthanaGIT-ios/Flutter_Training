class TimesheetUnattendedResponse {
  final bool success;
  final UnattendedShiftDataWrapper data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  TimesheetUnattendedResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory TimesheetUnattendedResponse.fromJson(Map<String, dynamic> json) {
    return TimesheetUnattendedResponse(
      success: json['success'],
      data: UnattendedShiftDataWrapper.fromJson(json['data']),
      message: json['message'],
      statusCode: json['status_code'],
      errors: json['errors'] ?? [],
    );
  }
}

class UnattendedShiftDataWrapper {
  final List<UnattendedShiftItem> data;
  final int totalCount;
  final int perPage;
  final int currentPage;

  UnattendedShiftDataWrapper({
    required this.data,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory UnattendedShiftDataWrapper.fromJson(Map<String, dynamic> json) {
    return UnattendedShiftDataWrapper(
      data: (json['data'] as List)
          .map((item) => UnattendedShiftItem.fromJson(item))
          .toList(),
      totalCount: json['total_count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
    );
  }
}

class UnattendedShiftItem {
  final String parentId;
  final String shiftId;
  final String client;
  final int checkInDistance;
  final String date;
  final String dateTimeFormat;
  final String endDateTimeFormat;
  final String startTime;
  final String endTime;
  final int distance;
  final String shiftTiming;
  final String type;
  final String county;
  final double longitude;
  final double latitude;
  final double duration;
  final double hourlyRate;
  final double totalPayRate;

  UnattendedShiftItem({
    required this.parentId,
    required this.shiftId,
    required this.client,
    required this.checkInDistance,
    required this.date,
    required this.dateTimeFormat,
    required this.endDateTimeFormat,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.shiftTiming,
    required this.type,
    required this.county,
    required this.longitude,
    required this.latitude,
    required this.duration,
    required this.hourlyRate,
    required this.totalPayRate,
  });

  factory UnattendedShiftItem.fromJson(Map<String, dynamic> json) {
    return UnattendedShiftItem(
      parentId: json['parent_id'],
      shiftId: json['shift_id'],
      client: json['client'],
      checkInDistance: json['check_in_distance'],
      date: json['date'],
      dateTimeFormat: json['date_time_format'],
      endDateTimeFormat: json['end_date_time_format'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      distance: json['distance'],
      shiftTiming: json['shift_timing'],
      type: json['type'],
      county: json['county'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      duration: json['duration'].toDouble(),
      hourlyRate: json['hourly_rate'].toDouble(),
      totalPayRate: json['total_pay_rate'].toDouble(),
    );
  }
}
