import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payload = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review & Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Review booking for resort ${payload['resortId']}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
