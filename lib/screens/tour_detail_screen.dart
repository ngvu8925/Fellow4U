import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TourDetailScreen extends StatefulWidget {
  const TourDetailScreen({super.key});

  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  int _selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleSection(),
                  const SizedBox(height: 24),
                  _buildSummaryCard(),
                  const SizedBox(height: 32),
                  _buildScheduleSection(),
                  const SizedBox(height: 32),
                  _buildPriceSection(),
                  const SizedBox(height: 40),
                  _buildBookButton(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Group 158.png',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    _buildHeaderCircleIcon(Icons.share_outlined),
                    const SizedBox(width: 8),
                    _buildHeaderCircleIcon(Icons.favorite_border),
                    const SizedBox(width: 8),
                    _buildHeaderCircleIcon(Icons.bookmark_border),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => Container(
              width: index == 0 ? 20 : 8,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: index == 0 ? primaryColor : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            )),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Da Nang - Ba Na - Hoi An',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$400.00',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 14)),
                ),
                const SizedBox(width: 8),
                const Text('145 Reviews', style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const Text(
              '\$450.00',
              style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Provider ', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const Text('dulichviet', style: TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          const Text('Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildSummaryItem('Itinerary', 'Da Nang - Ba Na - Hoi An'),
          _buildSummaryItem('Duration', '2 days, 2 nights'),
          _buildSummaryItem('Departure Date', 'Feb 12'),
          _buildSummaryItem('Departure Place', 'Ho Chi Minh'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.map_outlined, color: Colors.black, size: 24),
            SizedBox(width: 12),
            Text('Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildDayTab(1),
            const SizedBox(width: 12),
            _buildDayTab(2),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Ho Chi Minh - Da Nang',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildTimelineItem('6:00AM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
        _buildTimelineItem('10:00AM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
        _buildTimelineItem('1:00PM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets.'),
        _buildTimelineItem('8:00PM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.', isLast: true),
      ],
    );
  }

  Widget _buildDayTab(int day) {
    bool isSelected = _selectedDay == day;
    return GestureDetector(
      onTap: () => setState(() => _selectedDay = day),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? primaryColor : Colors.grey.withOpacity(0.3)),
        ),
        child: Text(
          'Day $day',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String time, String description, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.monetization_on_outlined, color: Colors.black, size: 24),
            SizedBox(width: 12),
            Text('Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
        Table(
          border: TableBorder.all(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
          children: [
            _buildPriceTableRow('Adult (>10 years old)', '\$400.00'),
            _buildPriceTableRow('Child (5 - 10 years old)', '\$320.00'),
            _buildPriceTableRow('Child (<5 years old)', 'Free'),
          ],
        ),
      ],
    );
  }

  TableRow _buildPriceTableRow(String age, String price) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(age, style: const TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text(price, style: const TextStyle(fontSize: 14))),
        ),
      ],
    );
  }

  Widget _buildBookButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => _showShareModal(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: const Text('BOOK THIS TOUR',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  void _showShareModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const Text(
                      'Share on',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildShareIcon(Icons.facebook, 'Facebook',
                            const Color(0xFF3B5998)),
                        _buildShareIcon(
                            Icons.g_mobiledata, 'Google', const Color(0xFFDB4437)),
                        _buildShareIcon(Icons.chat_bubble, 'Kakao Talk',
                            const Color(0xFFFFE812)),
                        _buildShareIcon(
                            Icons.call, 'Whatsapp', const Color(0xFF25D366)),
                        _buildShareIcon(
                            Icons.send, 'Twitter', const Color(0xFF1DA1F2)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
