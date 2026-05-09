import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/screens/search_screen.dart';
import 'package:resort_booking_flutter/screens/detail_screen.dart';
import 'package:resort_booking_flutter/screens/booking_screen.dart';
import 'package:resort_booking_flutter/screens/payment_screen.dart';
import 'package:resort_booking_flutter/screens/review_screen.dart';
import 'package:resort_booking_flutter/screens/profile_screen.dart';
import 'routes.dart';

class ResortBookingApp extends ConsumerWidget {
  const ResortBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Resort Booking',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      themeMode: ThemeMode.system,
      initialRoute: Routes.search,
      routes: Routes.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ko', ''),
      ],
    );
  }
}
