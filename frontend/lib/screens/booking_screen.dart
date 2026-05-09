import 'package:flutter/material.dart';
import 'package:resort_booking_flutter/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resort_booking_flutter/providers/api_service_provider.dart';

class BookingScreen extends ConsumerStatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _guestsController = TextEditingController(text: '1');

  @override
  void dispose() {
    _checkInController.dispose();
    _checkOutController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final id = ModalRoute.of(context)!.settings.arguments as String;
      final payload = {
        'resortId': id,
        'checkIn': _checkInController.text,
        'checkOut': _checkOutController.text,
        'guests': int.parse(_guestsController.text),
      };
      try {
        await ref.read(apiServiceProvider).createBooking(payload);
        Navigator.pushNamed(context, Routes.payment, arguments: payload);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _checkInController,
                decoration: const InputDecoration(labelText: 'Check‑in Date'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _checkOutController,
                decoration: const InputDecoration(labelText: 'Check‑out Date'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _guestsController,
                decoration: const InputDecoration(labelText: 'Guests'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
