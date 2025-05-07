import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookings;

  const BookingScreen({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Bookings')),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return ListTile(
            leading: Image.asset(booking['image']),
            title: Text(booking['name']),
            subtitle: Text(
              'Date: ${booking['date']} - People: ${booking['numberOfPeople']}',
            ),
          );
        },
      ),
    );
  }
}
