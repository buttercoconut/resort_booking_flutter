import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:resort_booking_flutter/models/resort.dart';

class ApiService {
  final String baseUrl = 'https://api.example.com';

  Future<List<Resort>> fetchResorts({String? query}) async {
    final uri = Uri.parse('$baseUrl/resorts')
        .replace(queryParameters: query != null ? {'search': query} : null);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Resort.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load resorts');
    }
  }

  Future<Resort> fetchResortById(String id) async {
    final uri = Uri.parse('$baseUrl/resorts/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Resort.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load resort');
    }
  }

  Future<void> createBooking(Map<String, dynamic> payload) async {
    final uri = Uri.parse('$baseUrl/bookings');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create booking');
    }
  }
}
