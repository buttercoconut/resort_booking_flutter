import '../models/resort.dart';

class ResortService {
  final List<Resort> _resorts = [];

  Future<List<Resort>> getAllResorts() async {
    return _resorts;
  }

  Future<Resort?> getResortById(String id) async {
    return _resorts.firstWhere((r) => r.id == id, orElse: () => null);
  }

  Future<Resort> createResort(String jsonString) async {
    // Very naive parsing; in real code use jsonDecode
    final resort = Resort(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'Sample Resort',
      location: 'Sample Location',
      pricePerNight: 100.0,
      imageUrl: 'https://example.com/image.jpg',
      description: 'A nice resort',
    );
    _resorts.add(resort);
    return resort;
  }

  Future<Resort?> updateResort(String id, String jsonString) async {
    final index = _resorts.indexWhere((r) => r.id == id);
    if (index == -1) return null;
    final resort = Resort(
      id: id,
      name: 'Updated Resort',
      location: 'Updated Location',
      pricePerNight: 150.0,
      imageUrl: 'https://example.com/updated.jpg',
      description: 'Updated description',
    );
    _resorts[index] = resort;
    return resort;
  }

  Future<bool> deleteResort(String id) async {
    return _resorts.removeWhere((r) => r.id == id) > 0;
  }
}
