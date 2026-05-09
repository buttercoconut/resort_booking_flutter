import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payload = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Paying for resort ${payload['resortId']}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.review, arguments: payload);
              },
              child: const Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
