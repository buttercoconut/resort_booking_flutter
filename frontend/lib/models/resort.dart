class Resort {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final double pricePerNight;
  final double latitude;
  final double longitude;

  Resort({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.pricePerNight,
    required this.latitude,
    required this.longitude,
  });

  factory Resort.fromJson(Map<String, dynamic> json) {
    return Resort(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images: List<String>.from(json['images'] as List),
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
