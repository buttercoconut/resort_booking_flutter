import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/models/resort.dart';
import 'package:resort_booking_flutter/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final resortsProvider = StateNotifierProvider<ResortsNotifier, AsyncValue<List<Resort>>>((ref) {
  return ResortsNotifier(ref.read);
});

class ResortsNotifier extends StateNotifier<AsyncValue<List<Resort>>> {
  final Reader _read;
  ResortsNotifier(this._read) : super(const AsyncValue.loading());

  Future<void> loadResorts({String? query}) async {
    try {
      final resorts = await _read(apiServiceProvider).fetchResorts(query: query);
      state = AsyncValue.data(resorts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
