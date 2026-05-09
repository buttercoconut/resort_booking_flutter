import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/providers/api_service_provider.dart';
import 'package:resort_booking_flutter/models/resort.dart';
import 'package:resort_booking_flutter/routes.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<Resort>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(apiServiceProvider).fetchResorts();
  }

  void _search() {
    setState(() {
      _future = ref.read(apiServiceProvider).fetchResorts(query: _controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Search by name',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _search,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Resort>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final resorts = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: resorts.length,
                  itemBuilder: (context, index) {
                    final resort = resorts[index];
                    return ListTile(
                      leading: Image.network(
                        resort.images.isNotEmpty ? resort.images[0] : '',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(resort.name),
                      subtitle: Text('\$${resort.pricePerNight.toStringAsFixed(2)} per night'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.detail,
                          arguments: resort.id,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
