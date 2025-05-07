import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wanderlust/features/bookings/bookings_screen.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/text_styles.dart';

class DestinationDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  final String subtitle;

  const DestinationDetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.subtitle,
  });

  @override
  _DestinationDetailsScreenState createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetailsScreen> {
  DateTime selectedDate = DateTime.now();
  int numberOfPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(widget.name, style: AppTextStyles.subheading),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.asset(
                widget.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.name, style: AppTextStyles.heading),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.subtitle,
                style: AppTextStyles.subheading.copyWith(
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Experience the breathtaking beauty of ${widget.name}. From stunning views to unforgettable adventures, this destination offers a once-in-a-lifetime escape.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Date Picker
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "Selected Date: ${DateFormat('yMMMd').format(selectedDate)}",
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.date_range, color: Colors.white),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Number of People Picker
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.people, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    "Number of People: $numberOfPeople",
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        numberOfPeople++;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.white),
                    onPressed: () {
                      if (numberOfPeople > 1) {
                        setState(() {
                          numberOfPeople--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Book Now Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate back to the HomeScreen with the booking details
                  Navigator.pop(context);

                  // Add the booking details directly to the BookingScreen list
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BookingScreen(
                            bookings: [
                              {
                                'image': widget.image,
                                'name': widget.name,
                                'date': selectedDate,
                                'numberOfPeople': numberOfPeople,
                              },
                            ],
                          ),
                    ),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text('Book Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
