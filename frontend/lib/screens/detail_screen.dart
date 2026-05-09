import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/models/resort.dart';
import 'package:resort_booking_flutter/providers/api_service_provider.dart';
import 'package:resort_booking_flutter/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  late Future<Resort> _future;

  @override
  void initState() {
    super.initState();
    final id = ModalRoute.of(context)!.settings.arguments as String;
    _future = ref.read(apiServiceProvider).fetchResortById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort Detail'),
      ),
      body: FutureBuilder<Resort>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final resort = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: resort.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        resort.images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    resort.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    resort.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Price: \$${resort.pricePerNight.toStringAsFixed(2)} per night',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.booking,
                        arguments: resort.id,
                      );
                    },
                    child: const Text('Book Now'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
