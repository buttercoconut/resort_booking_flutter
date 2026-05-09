import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/routes.dart';

void main() {
  runApp(const ProviderScope(child: ResortApp()));
}

class ResortApp extends StatelessWidget {
  const ResortApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resort Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.search,
      routes: Routes.routes,
    );
}
