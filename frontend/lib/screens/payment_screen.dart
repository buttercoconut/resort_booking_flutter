import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: const Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}
