class TimesheetFlaggedResponse {
  final bool success;
  final FlaggedData data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  TimesheetFlaggedResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory TimesheetFlaggedResponse.fromJson(Map<String, dynamic> json) {
    return TimesheetFlaggedResponse(
      success: json['success'],
      data: FlaggedData.fromJson(json['data']),
      message: json['message'],
      statusCode: json['status_code'],
      errors: json['errors'],
    );
  }
}

class FlaggedData {
  final List<TimesheetWeekData> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  FlaggedData({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory FlaggedData.fromJson(Map<String, dynamic> json) {
    return FlaggedData(
      data: (json['data'] as List).map((e) => TimesheetWeekData.fromJson(e)).toList(),
      totalPayRate: (json['total_pay_rate'] as num).toDouble(),
      totalCount: json['total_count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
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

  factory TimesheetWeekData.fromJson(Map<String, dynamic> json) {
    return TimesheetWeekData(
      week: json['week'],
      weekId: json['week_id'],
      shifts: (json['shifts'] as List).map((e) => Shift.fromJson(e)).toList(),
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
  final String? expectedDate;
  final int? checkoutType;
  final bool? getApproval;
  final String? disputeReason;

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
    this.expectedDate,
    this.checkoutType,
    this.getApproval,
    this.disputeReason,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'],
      date: json['date'],
      shiftCode: json['shift_code'],
      client: Client.fromJson(json['client']),
      totalPayRate: (json['total_pay_rate'] as num).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] as num).toDouble(),
      shiftTiming: json['shift_timing'],
      hourlyRate: (json['hourly_rate'] as num).toDouble(),
      status: json['status'],
      expectedDate: json['expected_date'],
      checkoutType: json['checkout_type'],
      getApproval: json['get_approval'],
      disputeReason: json['dispute_reason'],
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
  final String? photo;
  final List<dynamic> preference;
  final int type;
  final RegionalManager? regionalManager;
  final String? sdrEmail;
  final int breakTimePayment;

  Client({
    required this.id,
    required this.name,
    this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    this.photo,
    required this.preference,
    required this.type,
    this.regionalManager,
    this.sdrEmail,
    required this.breakTimePayment,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      checkInDistance: json['check_in_distance'],
      location: Location.fromJson(json['location']),
      county: County.fromJson(json['county']),
      photo: json['photo'],
      preference: json['preference'] ?? [],
      type: json['type'],
      regionalManager: json['regional_manager'] != null
          ? RegionalManager.fromJson(json['regional_manager'])
          : null,
      sdrEmail: json['sdr_email'],
      breakTimePayment: json['break_time_payment'],
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
      type: json['type'],
      coordinates: (json['coordinates'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
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
      id: json['id'],
      name: json['name'],
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
      id: json['id'],
      name: json['name'],
    );
  }
}
