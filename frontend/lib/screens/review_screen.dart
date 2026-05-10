import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: const Center(
        child: Text('Review Screen'),
      ),
    );
  }
}
