import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wanderlust/features/home/home_screen.dart'; // Adjust this to your actual HomeScreen file path
import 'package:wanderlust/features/main/main_screen.dart'; // Adjust this to your actual MainScreen file path
import 'app/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wanderlust',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        fontFamily: 'Raleway',
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      initialRoute: '/home', // Set the default route to HomeScreen
      routes: {
        '/home':
            (context) => const MainScreen(), // Directly navigate to MainScreen
      },
    );
  }
}
