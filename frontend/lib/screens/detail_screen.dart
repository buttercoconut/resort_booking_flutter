import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/models/resort.dart';
import 'package:resort_booking_flutter/routes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort Detail'),
      ),
      body: const Center(
        child: Text('Detail Screen'),
      ),
    );
  }
}
