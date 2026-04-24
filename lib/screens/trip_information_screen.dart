import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'tour_detail_screen.dart';

class TripInformationScreen extends StatefulWidget {
  const TripInformationScreen({super.key});

  @override
  State<TripInformationScreen> createState() => _TripInformationScreenState();
}

class _TripInformationScreenState extends State<TripInformationScreen> {
  int _travelerCount = 1;

  final List<Map<String, dynamic>> _attractions = [
    {
      'title': 'Dragon Bridge',
      'image': 'assets/images/Group 158.png',
      'selected': true,
    },
    {
      'title': 'Cham Museum',
      'image': 'assets/images/Group 111.png',
      'selected': false,
    },
    {
      'title': 'My Khe Beach',
      'image': 'assets/images/Group 112.png',
      'selected': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Trip Information',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildLabel('Date'),
              _buildIconField(Icons.calendar_today, 'mm/dd/yy'),
              const SizedBox(height: 24),
              _buildLabel('Time'),
              Row(
                children: [
                  Expanded(child: _buildIconField(Icons.access_time, 'From')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildIconField(Icons.access_time, 'To')),
                ],
              ),
              const SizedBox(height: 24),
              _buildLabel('City'),
              _buildIconField(Icons.location_on, 'Danang'),
              const SizedBox(height: 24),
              _buildLabel('Number of travelers'),
              const SizedBox(height: 8),
              _buildTravelerCounter(),
              const SizedBox(height: 32),
              _buildLabel('Attractions'),
              const SizedBox(height: 16),
              _buildAttractionsGrid(),
              const SizedBox(height: 40),
              _buildDoneButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildIconField(IconData icon, String hintText) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelerCounter() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_travelerCount > 1) {
              setState(() => _travelerCount--);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.arrow_drop_down, color: primaryColor),
          ),
        ),
        Container(
          width: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            '$_travelerCount',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() => _travelerCount++);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.arrow_drop_up, color: primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildAttractionsGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildAddNewCard(),
        ..._attractions.map((attr) => _buildAttractionCard(attr)).toList(),
      ],
    );
  }

  Widget _buildAddNewCard() {
    final double cardSize = (MediaQuery.of(context).size.width - 24 * 2 - 16) / 2;
    return Container(
      width: cardSize,
      height: cardSize * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add, color: primaryColor, size: 28),
          SizedBox(height: 4),
          Text(
            'Add New',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttractionCard(Map<String, dynamic> attr) {
    final double cardSize = (MediaQuery.of(context).size.width - 24 * 2 - 16) / 2;
    return GestureDetector(
      onTap: () {
        setState(() {
          attr['selected'] = !attr['selected'];
        });
      },
      child: Stack(
        children: [
          Container(
            width: cardSize,
            height: cardSize * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(attr['image']),
                fit: BoxFit.cover,
                colorFilter: attr['selected']
                    ? null
                    : ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                attr['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (attr['selected'])
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDoneButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TourDetailScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: const Text(
          'DONE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
