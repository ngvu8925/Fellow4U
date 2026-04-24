import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import 'trip_information_screen.dart';

class GuideProfileScreen extends StatelessWidget {
  final String guideName;
  final String heroImage;
  final String avatarImage;
  final int rating;
  final String reviews;
  final String location;

  const GuideProfileScreen({
    super.key,
    required this.guideName,
    required this.heroImage,
    required this.avatarImage,
    required this.rating,
    required this.reviews,
    required this.location,
  });

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
              _buildHeader(context),
              _buildGuideInfo(context),
              _buildIntroAndVideo(),
              _buildPricingTable(),
              _buildExperiencesList(),
              _buildReviewsSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cover Image
        Image.asset(
          'assets/images/Mask Group copy.png', // Fallback cover image based on provided layout
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(height: 220, color: Colors.grey[300]),
        ),
        // Dark gradient at the top for status bar and back button readability
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        // Overlapping Avatar
        Positioned(
          bottom: -40,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(avatarImage),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guideName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        reviews,
                        style: const TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TripInformationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 0,
                  minimumSize: const Size(140, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('CHOOSE THIS GUIDE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Language Chips
          Row(
            children: [
              _buildLangChip('Vietnamese'),
              const SizedBox(width: 8),
              _buildLangChip('English'),
              const SizedBox(width: 8),
              _buildLangChip('Korean'),
            ],
          ),
          const SizedBox(height: 12),
          // Location
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: primaryColor),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLangChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
    );
  }

  Widget _buildIntroAndVideo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
          ),
          const SizedBox(height: 20),
          // Video Thumbnail
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  avatarImage, // Reusing avatar as placeholder for video thumb based on design
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 200, color: Colors.grey[300]),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow, color: primaryColor, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            _buildPricingRow('1 - 3 Travelers', '\$10/ hour'),
            Divider(color: Colors.grey.withOpacity(0.3), height: 1),
            _buildPricingRow('4 - 6 Travelers', '\$14/ hour'),
            Divider(color: Colors.grey.withOpacity(0.3), height: 1),
            _buildPricingRow('7 - 9 Travelers', '\$17/ hour'),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingRow(String travelers, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(travelers, style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500)),
            ),
          ),
          Container(width: 1, height: 20, color: Colors.grey.withOpacity(0.3)),
          Expanded(
            child: Center(
              child: Text(price, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperiencesList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Experiences',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          _buildExperienceItem(
            mainImage: 'assets/images/Group 111.png', // Left large
            topRightImage: 'assets/images/Group 21.png', 
            bottomRightImage: 'assets/images/Group 22.png',
            title: '2 Hour Bicycle Tour exploring Hoian',
            location: 'Hoian, Vietnam',
            date: 'Jan 25, 2020',
            likes: '1234 Likes',
          ),
          const SizedBox(height: 24),
          _buildExperienceItem(
            mainImage: 'assets/images/Group 112.png',
            topRightImage: 'assets/images/Group 114.png',
            bottomRightImage: 'assets/images/Group 19.png',
            title: 'Food tour in Danang',
            location: 'Danang, Vietnam',
            date: 'Jan 20, 2020',
            likes: '234 Likes',
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String mainImage,
    required String topRightImage,
    required String bottomRightImage,
    required String title,
    required String location,
    required String date,
    required String likes,
  }) {
    return Container(
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
          // 3 Image Grid Layout
          SizedBox(
            height: 180,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(mainImage, fit: BoxFit.cover, height: double.infinity,
                      errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(topRightImage, fit: BoxFit.cover, width: double.infinity,
                            errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Expanded(
                          child: Image.asset(bottomRightImage, fit: BoxFit.cover, width: double.infinity,
                            errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: primaryColor),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 13, color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, size: 16, color: primaryColor),
                        const SizedBox(width: 4),
                        Text(likes, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reviews',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                'SEE MORE',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildReviewItem(
            avatar: 'assets/images/Guide Modal (1).png', // Assuming Emmy
            name: 'Pena Valdez',
            date: 'Jan 22, 2020',
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
          ),
          const Divider(height: 30, color: Colors.transparent),
          _buildReviewItem(
            avatar: 'assets/images/Guide Modal (2).png',
            name: 'Daehyun',
            date: 'Jan 22, 2020',
            content: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum'",
          ),
          const Divider(height: 30, color: Colors.transparent),
          _buildReviewItem(
            avatar: 'assets/images/Guide Modal (3).png',
            name: 'Burns Marks',
            date: 'Jan 22, 2020',
            content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required String avatar,
    required String name,
    required String date,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(avatar),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 12)),
                    ),
                    const SizedBox(width: 12),
                    Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
        ),
      ],
    );
  }
}
