class Booking {
  final String id;
  final String resortId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;

  Booking({
    required this.id,
    required this.resortId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      resortId: json['resortId'] as String,
      userId: json['userId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }
}
