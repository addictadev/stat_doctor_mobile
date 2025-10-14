class ShiftDetailsData {
  final String hospitalName;
  final String hospitalLocation;
  final String address;
  final String distance;
  final String date;
  final String time;
  final String rate;
  final String description;
  final String skillLevel;
  final String specialty;
  final String supportLevel;
  final String travelProvisions;
  final String accommodationProvisions;
  final String contactName;
  final String contactPhone;
  final String contactEmail;
  final List<Map<String, String>> similarShifts;
  final String status; // Applied, Accepted, Cancelled, Archived
  final List<Map<String, dynamic>> reviews; // For archived shifts

  const ShiftDetailsData({
    required this.hospitalName,
    required this.hospitalLocation,
    required this.address,
    required this.distance,
    required this.date,
    required this.time,
    required this.rate,
    required this.description,
    required this.skillLevel,
    required this.specialty,
    required this.supportLevel,
    required this.travelProvisions,
    required this.accommodationProvisions,
    required this.contactName,
    required this.contactPhone,
    required this.contactEmail,
    required this.similarShifts,
    this.status = 'Applied',
    this.reviews = const [],
  });
}
