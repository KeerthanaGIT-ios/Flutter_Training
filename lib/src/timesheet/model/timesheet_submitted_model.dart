class TimesheetSubmitted {
  final bool success;
  final TimesheetSubmittedData data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  TimesheetSubmitted({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory TimesheetSubmitted.fromJson(Map<String, dynamic> json) {
    return TimesheetSubmitted(
      success: json['success'] ?? false,
      data: TimesheetSubmittedData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      errors: json['errors'] ?? [],
    );
  }
}

class TimesheetSubmittedData {
  final List<TimesheetWeekData> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  TimesheetSubmittedData({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory TimesheetSubmittedData.fromJson(Map<String, dynamic> json) {
    return TimesheetSubmittedData(
      data: (json['data'] as List<dynamic>)
          .map((e) => TimesheetWeekData.fromJson(e))
          .toList(),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalCount: json['total_count'] ?? 0,
      perPage: json['per_page'] ?? 10,
      currentPage: json['current_page'] ?? 1,
    );
  }
}

class TimesheetWeekData {
  final String week;
  final String weekId;
  final List<Shift> shifts;

  TimesheetWeekData({
    required this.week,
    required this.weekId,
    required this.shifts,
  });

  @override
  String toString() {
    return 'TimesheetWeekData(week: $week, weekId: $weekId, shiftsCount: ${shifts.length})';
  }

  factory TimesheetWeekData.fromJson(Map<String, dynamic> json) {
    return TimesheetWeekData(
      week: json['week'] ?? '',
      weekId: json['week_id'] ?? '',
      shifts: (json['shifts'] as List<dynamic>)
          .map((e) => Shift.fromJson(e))
          .toList(),
    );
  }
}

class Shift {
  final String id;
  final String date;
  final String shiftCode;
  final Client client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String expectedDate;
  final int checkoutType;

  Shift({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    required this.expectedDate,
    required this.checkoutType,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      shiftCode: json['shift_code'] ?? '',
      client: Client.fromJson(json['client'] ?? {}),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] ?? 0).toDouble(),
      shiftTiming: json['shift_timing'] ?? '',
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      status: json['status'] ?? 0,
      expectedDate: json['expected_date'] ?? '',
      checkoutType: json['checkout_type'] ?? 0,
    );
  }
}

class Client {
  final String id;
  final String name;
  final String? address;
  final int checkInDistance;
  final Location location;
  final County county;
  final String photo;
  final List<dynamic> preference;
  final int type;
  final RegionalManager regionalManager;
  final String sdrEmail;
  final int breakTimePayment;

  Client({
    required this.id,
    required this.name,
    required this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    required this.photo,
    required this.preference,
    required this.type,
    required this.regionalManager,
    required this.sdrEmail,
    required this.breakTimePayment,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'],
      checkInDistance: json['check_in_distance'] ?? 0,
      location: Location.fromJson(json['location'] ?? {}),
      county: County.fromJson(json['county'] ?? {}),
      photo: json['photo'] ?? '',
      preference: json['preference'] ?? [],
      type: json['type'] ?? 0,
      regionalManager:
      RegionalManager.fromJson(json['regional_manager'] ?? {}),
      sdrEmail: json['sdr_email'] ?? '',
      breakTimePayment: json['break_time_payment'] ?? 0,
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates: List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }
}

class County {
  final String id;
  final String name;

  County({
    required this.id,
    required this.name,
  });

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class RegionalManager {
  final String id;
  final String name;

  RegionalManager({
    required this.id,
    required this.name,
  });

  factory RegionalManager.fromJson(Map<String, dynamic> json) {
    return RegionalManager(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
