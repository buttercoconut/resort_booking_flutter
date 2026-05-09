import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
