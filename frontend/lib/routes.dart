import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/widgets/search_screen.dart';
import 'package:resort_booking_flutter/screens/detail_screen.dart';
import 'package:resort_booking_flutter/screens/booking_screen.dart';
import 'package:resort_booking_flutter/screens/payment_screen.dart';
import 'package:resort_booking_flutter/screens/review_screen.dart';
import 'package:resort_booking_flutter/screens/profile_screen.dart';

class Routes {
  static const String search = '/';
  static const String detail = '/detail';
  static const String booking = '/booking';
  static const String payment = '/payment';
  static const String review = '/review';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    search: (context) => const SearchScreen(),
    detail: (context) => const DetailScreen(),
    booking: (context) => const BookingScreen(),
    payment: (context) => const PaymentScreen(),
    review: (context) => const ReviewScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
