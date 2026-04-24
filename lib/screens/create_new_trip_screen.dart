import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CreateNewTripScreen extends StatefulWidget {
  const CreateNewTripScreen({super.key});

  @override
  State<CreateNewTripScreen> createState() => _CreateNewTripScreenState();
}

class _CreateNewTripScreenState extends State<CreateNewTripScreen> {
  int _travelers = 1;
  final Set<int> _selectedAttractions = {1, 3}; // Default selected as in screenshot

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 26),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create New Trip',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Where to explore
            _buildLabel('Where you want to explore'),
            _buildTextField(
              hint: 'Danang, Vietnam',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 28),

            // Date
            _buildLabel('Date'),
            _buildTextField(
              hint: 'mm/dd/yy',
              icon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 28),

            // Time
            _buildLabel('Time'),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    hint: 'From',
                    icon: Icons.access_time,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildTextField(
                    hint: 'To',
                    icon: Icons.access_time,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Number of travelers
            _buildLabel('Number of travelers'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCounterControl(Icons.arrow_drop_down, () {
                  if (_travelers > 1) setState(() => _travelers--);
                }),
                Container(
                  width: 100,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  child: Text(
                    '$_travelers',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _buildCounterControl(Icons.arrow_drop_up, () {
                  setState(() => _travelers++);
                }),
              ],
            ),
            const SizedBox(height: 28),

            // Fee
            _buildLabel('Fee'),
            _buildTextField(
              hint: 'Fee',
              icon: Icons.monetization_on_outlined,
              suffix: '(\$/hour)',
            ),
            const SizedBox(height: 28),

            // Guide Language
            _buildLabel('Guide’s Language'),
            _buildTextField(
              hint: 'Korean, English',
              icon: Icons.public_outlined,
            ),
            const SizedBox(height: 32),

            // Attractions
            const Text(
              'Attractions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.35,
              children: [
                _buildAddCard(),
                _buildAttractionCard(
                  id: 1,
                  title: 'Dragon Bridge',
                  image: 'assets/images/danang_bridge.png',
                ),
                _buildAttractionCard(
                  id: 2,
                  title: 'Cham Museum',
                  image: 'assets/images/Mask Group (1).png',
                ),
                _buildAttractionCard(
                  id: 3,
                  title: 'My Khe Beach',
                  image: 'assets/images/danang_pool.png',
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Done Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    String? suffix,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFC4C4C4), fontSize: 16),
        prefixIcon: Icon(icon, color: Colors.grey, size: 22),
        prefixIconConstraints: const BoxConstraints(minWidth: 36),
        suffixText: suffix,
        suffixStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildCounterControl(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFF0FDFB), // Very light teal
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: primaryColor, size: 32),
      ),
    );
  }

  Widget _buildAddCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF2F2F2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add, color: primaryColor, size: 36),
          SizedBox(height: 8),
          Text(
            'Add New',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttractionCard({
    required int id,
    required String title,
    required String image,
  }) {
    bool isSelected = _selectedAttractions.contains(id);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedAttractions.remove(id);
          } else {
            _selectedAttractions.add(id);
          }
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
            ),
          ),
          // Gradient for text
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
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
            left: 10,
            right: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isSelected)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          if (!isSelected)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.15),
                  border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
