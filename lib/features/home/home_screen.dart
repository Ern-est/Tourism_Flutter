import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/text_styles.dart';
import 'destination_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['Beaches', 'Mountains', 'Cities', 'Lakes'];
  String selectedCategory = 'Beaches';

  final Map<String, List<Map<String, String>>> destinationsByCategory = {
    'Beaches': [
      {
        'image': 'assets/images/beaches/beach1.webp',
        'name': 'Bali, Indonesia',
        'subtitle': 'Tropical paradise',
      },
      {
        'image': 'assets/images/beaches/beach2.webp',
        'name': 'Maui, Hawaii',
        'subtitle': 'Golden sands & waves',
      },
      {
        'image': 'assets/images/beaches/beach3.jpg',
        'name': 'Santorini, Greece',
        'subtitle': 'Famous white cliffs',
      },
      {
        'image': 'assets/images/beaches/beach4.jpg',
        'name': 'Phuket, Thailand',
        'subtitle': 'Vibrant coastal town',
      },
      {
        'image': 'assets/images/beaches/beach5.webp',
        'name': 'Maldives',
        'subtitle': 'Crystal clear waters',
      },
      {
        'image': 'assets/images/beaches/beach6.jpg',
        'name': 'Copacabana, Brazil',
        'subtitle': 'Energetic beach life',
      },
    ],
    'Mountains': [
      {
        'image': 'assets/images/mountains/mountain1.jpg',
        'name': 'Swiss Alps',
        'subtitle': 'Snowy peaks',
      },
      {
        'image': 'assets/images/mountains/mountain2.jpg',
        'name': 'Rocky Mountains',
        'subtitle': 'Adventure awaits',
      },
      {
        'image': 'assets/images/mountains/mountain3.webp',
        'name': 'Mount Fuji',
        'subtitle': 'Iconic Japan landmark',
      },
      {
        'image': 'assets/images/mountains/mountain4.jpg',
        'name': 'Andes, Peru',
        'subtitle': 'Home of Machu Picchu',
      },
      {
        'image': 'assets/images/mountains/mountain5.jpg',
        'name': 'Himalayas',
        'subtitle': 'Roof of the world',
      },
      {
        'image': 'assets/images/mountains/mountain6.jpg',
        'name': 'Table Mountain',
        'subtitle': 'Cape Town views',
      },
    ],
    'Cities': [
      {
        'image': 'assets/images/cities/city1.jpg',
        'name': 'New York, USA',
        'subtitle': 'The city that never sleeps',
      },
      {
        'image': 'assets/images/cities/city2.jpg',
        'name': 'Paris, France',
        'subtitle': 'City of lights',
      },
      {
        'image': 'assets/images/cities/city3.jpg',
        'name': 'Tokyo, Japan',
        'subtitle': 'Technology & tradition',
      },
      {
        'image': 'assets/images/cities/city4.webp',
        'name': 'Dubai, UAE',
        'subtitle': 'Modern marvel',
      },
      {
        'image': 'assets/images/cities/city5.jpg',
        'name': 'Nairobi, Kenya',
        'subtitle': 'Green city in the sun',
      },
      {
        'image': 'assets/images/cities/city6.jpg',
        'name': 'London, UK',
        'subtitle': 'History & fashion',
      },
    ],
    'Lakes': [
      {
        'image': 'assets/images/lakes/lake1.jpg',
        'name': 'Lake Tahoe, USA',
        'subtitle': 'Crystal blue lake',
      },
      {
        'image': 'assets/images/lakes/lake2.jpg',
        'name': 'Lake Como, Italy',
        'subtitle': 'Luxury & serenity',
      },
      {
        'image': 'assets/images/lakes/lake3.webp',
        'name': 'Lake Victoria',
        'subtitle': 'Africa’s largest lake',
      },
      {
        'image': 'assets/images/lakes/lake4.jpg',
        'name': 'Lake Bled, Slovenia',
        'subtitle': 'Fairytale island',
      },
      {
        'image': 'assets/images/lakes/lake5.jpg',
        'name': 'Plitvice Lakes, Croatia',
        'subtitle': 'Waterfall wonderland',
      },
      {
        'image': 'assets/images/lakes/lake6.jpg',
        'name': 'Moraine Lake, Canada',
        'subtitle': 'Turquoise beauty',
      },
    ],
  };

  final Set<String> favoriteDestinations = {};

  @override
  Widget build(BuildContext context) {
    final destinations = destinationsByCategory[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Wanderlust',
            style: GoogleFonts.pacifico(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 7, 95), // Light Blue
              Color.fromARGB(255, 82, 56, 251), // Light Pink
              Color.fromARGB(255, 245, 23, 215), // Light Purple
              Color.fromARGB(255, 253, 42, 154), // Light Berry
              Color.fromARGB(255, 252, 156, 1), // Light Orange
              Color.fromARGB(255, 253, 184, 36), // Light Yellow
              Color.fromARGB(255, 245, 48, 133), // Light Purple again
              Color.fromARGB(255, 143, 35, 134), // Light Violet
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore $selectedCategory',
                style: AppTextStyles.heading.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    final isSelected = categories[index] == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedCategory = categories[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color.fromARGB(255, 255, 31, 206)
                                  : AppColors.primary.withAlpha(
                                    (0.3 * 255).toInt(),
                                  ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  itemCount: destinations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final place = destinations[index];
                    final isFavorited = favoriteDestinations.contains(
                      place['name'],
                    );
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DestinationDetailsScreen(
                                  image: place['image']!,
                                  name: place['name']!,
                                  subtitle: place['subtitle']!,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                place['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.5),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place['name']!,
                                    style: AppTextStyles.subheading.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    place['subtitle']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      icon: Icon(
                                        isFavorited
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.redAccent,
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (isFavorited) {
                                            favoriteDestinations.remove(
                                              place['name'],
                                            );
                                          } else {
                                            favoriteDestinations.add(
                                              place['name']!,
                                            );
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
