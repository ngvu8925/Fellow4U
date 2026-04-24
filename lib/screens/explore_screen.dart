import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'search_screen.dart';
import 'tour_detail_screen.dart';
import 'my_trips_screen.dart';
import '../constants/colors.dart';
import 'guide_profile_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Mask Group.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Explore',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Da Nang',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '26°C',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Search Bar
                  Positioned(
                    bottom: -25,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Hi, where do you want to explore?',
                          hintStyle: const TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFFC4C4C4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 45),

              // Top Journeys
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Top Journeys',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280, // Increased to avoid overflow
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 4,
                    bottom: 20,
                  ),
                  children: [
                    _buildJourneyCard(
                      image: 'assets/images/danang_pool.png', // Pool image
                      title: 'Da Nang - Ba Na - Hoi An',
                      date: 'Jan 30, 2020',
                      duration: '3 days',
                      price: '\$400.00',
                      rating: 5,
                      likes: '1247 likes',
                      isSaved: true,
                      context: context,
                    ),
                    const SizedBox(width: 16),
                    _buildJourneyCard(
                      image: 'assets/images/thailand.png',
                      title: 'Thailand',
                      date: 'Jan 30, 2020',
                      duration: '3 days',
                      price: '\$600.00',
                      rating: 5,
                      likes: '1247 likes',
                      context: context,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),

              // Best Guides
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best Guides',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'SEE MORE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    _buildGuideCard(
                      context: context,
                      image: 'assets/images/Guide Modal.png',
                      name: 'Tuan Tran',
                      location: 'Danang, Vietnam',
                      rating: 5,
                      reviews: '127 Reviews',
                    ),
                    _buildGuideCard(
                      context: context,
                      image: 'assets/images/Guide Modal (1).png',
                      name: 'Emmy',
                      location: 'Hanoi, Vietnam',
                      rating: 4,
                      reviews: '89 Reviews',
                    ),
                    _buildGuideCard(
                      context: context,
                      image: 'assets/images/Guide Modal (2).png',
                      name: 'Linh Hana',
                      location: 'Danang, Vietnam',
                      rating: 5,
                      reviews: '127 Reviews',
                    ),
                    _buildGuideCard(
                      context: context,
                      image: 'assets/images/Guide Modal (3).png',
                      name: 'Khai Ho',
                      location: 'Ho Chi Minh, Vietnam',
                      rating: 5,
                      reviews: '127 Reviews',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Top Experiences
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Top Experiences',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildExperienceCard(
                      image: 'assets/images/Mask Group (1).png',
                      guideImage: 'assets/images/Guide Modal.png',
                      guideName: 'Tuan Tran',
                      title: '2 Hour Bicycle Tour exploring Hoian',
                      location: 'Hoian, Vietnam',
                    ),
                    const SizedBox(width: 16),
                    _buildExperienceCard(
                      image: 'assets/images/Group 111.png',
                      guideImage: 'assets/images/Guide Modal (2).png',
                      guideName: 'Linh Hana',
                      title: '1 day at Bana Hill',
                      location: 'Bana, Vietnam',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Featured Tours
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Tours',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'SEE MORE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                children: [
                  _buildFeaturedCard(
                    image: 'assets/images/danang_pool.png',
                    title: 'Da Nang - Ba Na - Hoi An',
                    date: 'Jan 30, 2020',
                    duration: '3 days',
                    price: '\$400.00',
                    rating: 5,
                    likes: '1247 likes',
                    isLiked: false,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildFeaturedCard(
                    image: 'assets/images/duc_ba_church.png',
                    title: 'Melbourne - Sydney',
                    date: 'Jan 30, 2020',
                    duration: '3 days',
                    price: '\$600.00',
                    rating: 5,
                    likes: '1247 likes',
                    isLiked: true,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildFeaturedCard(
                    image: 'assets/images/hanoi_bay.png',
                    title: 'Hanoi - Ha Long Bay',
                    date: 'Jan 30, 2020',
                    duration: '3 days',
                    price: '\$300.00',
                    rating: 5,
                    likes: '1247 likes',
                    isLiked: false,
                    context: context,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Travel News
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Travel News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'SEE MORE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildNewsCard(
                    title: 'New Destination in Danang City',
                    date: 'Feb 5, 2020',
                    image: 'assets/images/Mask Group copy.png',
                  ),
                  const SizedBox(height: 20),
                  _buildNewsCard(
                    title: '\$1 Flight Ticket',
                    date: 'Feb 5, 2020',
                    image: 'assets/images/Group 112.png',
                  ),
                  const SizedBox(height: 20),
                  _buildNewsCard(
                    title: 'Visit Korea in this Tet Holiday',
                    date: 'Jan 26, 2020',
                    image: 'assets/images/Group 114.png',
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedFontSize: 10,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyTripsScreen()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJourneyCard({
    required String image,
    required String title,
    required String date,
    required String duration,
    required String price,
    required int rating,
    required String likes,
    bool isSaved = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TourDetailScreen(),
          ),
        );
      },
      child: Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(height: 140, color: Colors.grey[300]),
                ),
              ),
              // Gradient for text readability
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              if (isSaved)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    // No background circle in the new design! Just the icon
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              Positioned(
                bottom: 8,
                left: 10,
                child: Text(
                  likes,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
          Expanded(
            // Expanded prevents bottom overflow
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildGuideCard({
    required BuildContext context,
    required String image,
    required String name,
    required String location,
    required int rating,
    required String reviews,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GuideProfileScreen(
              guideName: name,
              heroImage: 'assets/images/Mask Group copy.png',
              avatarImage: image,
              rating: rating,
              reviews: reviews,
              location: location,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[300]),
                  ),
                ),
                // Gradient for text readability
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Text(
                    reviews,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Icon(Icons.location_on, size: 12, color: primaryColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: primaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ), // Row
        ], // Column - Dấu ngoặc vuông này phải nằm TRƯỚC dấu đóng của Column
      ), // Column
    ); // GestureDetector
  }

  Widget _buildExperienceCard({
    required String image,
    required String guideImage,
    required String guideName,
    required String title,
    required String location,
  }) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 200,
                  width: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 200,
                    width: 180,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Positioned(
                bottom: -24,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(guideImage),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -10, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        guideName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 12, color: primaryColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: primaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard({
    required String image,
    required String title,
    required String date,
    required String duration,
    required String price,
    required int rating,
    required String likes,
    required bool isLiked,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TourDetailScreen(),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(height: 140, color: Colors.grey[300]),
                ),
              ),
              // Gradient for text readability
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: const Icon(Icons.bookmark_border, color: Colors.white),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  likes,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: primaryColor,
                      size: 20,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildNewsCard({
    required String title,
    required String date,
    required String image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(date, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(height: 140, color: Colors.grey[300]),
          ),
        ),
      ],
    );
  }
}
