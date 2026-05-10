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

  @override
  Widget build(BuildContext context) {
    final resorts = ref.watch(resortsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Resorts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ResortList(resorts: resorts),
          ),
        ],
      ),
    );
  }
}
