import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'guide_profile_screen.dart';
import 'tour_detail_screen.dart';

class SearchResultScreen extends StatefulWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildSectionHeader('Guides in Danang'),
                    const SizedBox(height: 16),
                    _buildGuidesGrid(),
                    const SizedBox(height: 32),
                    _buildSectionHeader('Tours in Danang'),
                    const SizedBox(height: 16),
                    _buildToursList(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF0F0F0)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Danang, Vietnam',
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                  ),
                  Icon(Icons.cancel, color: Colors.grey[400], size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Icon(Icons.tune, color: Colors.grey[700], size: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'SEE MORE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75, // Adjusted for better fit
        children: [
          _buildGuideItem('Tuan Tran', 'assets/images/Mask Group copy.png'),
          _buildGuideItem('Linh Hana', 'assets/images/Mask Group (1).png'),
          _buildGuideItem('Tuan Tran', 'assets/images/Mask Group (2).png'),
          _buildGuideItem('Linh Hana', 'assets/images/Mask Group (3).png'),
          _buildGuideItem('Tuan Tran', 'assets/images/Mask Group.png'),
          _buildGuideItem('Linh Hana', 'assets/images/Mask Group (1) copy.png'),
        ],
      ),
    );
  }

  Widget _buildGuideItem(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GuideProfileScreen(
              guideName: name,
              heroImage: image,
              avatarImage: image,
              rating: 5,
              reviews: '127 Reviews',
              location: 'Danang, Vietnam',
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                            5,
                            (index) => const Icon(Icons.star,
                                color: Colors.amber, size: 10)),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '127 Reviews',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.location_on, color: primaryColor, size: 14),
              SizedBox(width: 4),
              Text(
                'Danang, Vietnam',
                style: TextStyle(color: primaryColor, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToursList() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildTourItem(
            'Da Nang - Ba Na - Hoi An', 'assets/images/danang_pool.png', '\$400.00'),
        const SizedBox(height: 20),
        _buildTourItem(
            'Melbourne - Sydney', 'assets/images/thailand.png', '\$600.00'),
        const SizedBox(height: 20),
        _buildTourItem(
            'Hanoi - Ha Long Bay', 'assets/images/hanoi_bay.png', '\$300.00'),
        const SizedBox(height: 20),
        _buildTourItem(
            'Da Nang - Ba Na - Hoi An', 'assets/images/danang_pool.png', '\$400.00'),
      ],
    );
  }

  Widget _buildTourItem(String title, String image, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TourDetailScreen()),
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
                offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    image,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: Colors.amber, size: 12)),
                          ),
                          const SizedBox(width: 8),
                          const Text('1247 likes',
                              style: TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const Icon(Icons.favorite_border,
                          color: primaryColor, size: 20),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.grey, size: 14),
                      const SizedBox(width: 8),
                      const Text('Jan 30, 2020',
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const Spacer(),
                      Text(price,
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.grey, size: 14),
                      const SizedBox(width: 8),
                      Text('3 days',
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
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
}
