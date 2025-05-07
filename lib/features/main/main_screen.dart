import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../bookings/bookings_screen.dart';
import '../profile/profile_screen.dart';
import '../../app/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  // This will hold the list of bookings
  List<Map<String, dynamic>> bookings = [
    // Sample booking data for demonstration
    {
      'image': 'assets/sample_image.jpg',
      'name': 'Paris',
      'date': DateTime.now(),
      'numberOfPeople': 2,
    },
  ];

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages.addAll([
      HomeScreen(),
      BookingScreen(bookings: bookings),  // Pass bookings dynamically
      ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.background,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
