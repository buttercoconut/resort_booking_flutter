class Resort {
  final String id;
  final String name;
  final String location;
  final double pricePerNight;
  final String imageUrl;
  final String description;

  Resort({
    required this.id,
    required this.name,
    required this.location,
    required this.pricePerNight,
    required this.imageUrl,
    required this.description,
  });

  factory Resort.fromJson(Map<String, dynamic> json) {
    return Resort(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'pricePerNight': pricePerNight,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
