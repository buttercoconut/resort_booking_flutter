import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/providers/resort_provider.dart';
import 'package:resort_booking_flutter/widgets/resort_list.dart';
import 'package:resort_booking_flutter/routes.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(resortsProvider.notifier).loadResorts();
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    ref.read(resortsProvider.notifier).loadResorts(query: query.isEmpty ? null : query);
  }

  @override
  Widget build(BuildContext context) {
    final resortsAsync = ref.watch(resortsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort Booking'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search resorts',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _onSearch(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ],
            ),
          ),
          Expanded(
            child: resortsAsync.when(
              data: (resorts) => ResortList(resorts: resorts),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
