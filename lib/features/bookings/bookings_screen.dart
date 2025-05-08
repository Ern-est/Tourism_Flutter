import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:wanderlust/features/bookings/booking_controller.dart';
import '../../models/booking.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<BookingProvider>(context).bookings;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Center(
          child: Text(
            'Your Bookings',
            style: GoogleFonts.lobster(color: Colors.white, fontSize: 25),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:
          bookings.isEmpty
              ? const Center(
                child: Text(
                  'No bookings yet!',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              )
              : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: bookings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final Booking booking = bookings[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          booking.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        booking.name,
                        style: AppTextStyles.subheading,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${DateFormat('yMMMd').format(booking.date)} · ${booking.numberOfPeople} ${booking.numberOfPeople == 1 ? "person" : "people"}',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
