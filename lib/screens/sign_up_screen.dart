import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import 'sign_in_screen.dart';
import 'explore_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _userType = 1; // 1 = Traveler, 2 = Guide

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipPath(
                        clipper: _HeaderClipper(),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          color: primaryColor,
                          child: Stack(
                            children: [
                              // Flight path dashed line - centered
                              Positioned(
                                left: 120,
                                top: 40,
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFF15A888),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Vector 1.png',
                                    width: 260,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ),
                              // Cloud big - center right
                              Positioned(
                                right: 70,
                                top: 100,
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFF15A888),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Vector 6.png',
                                    width: 50,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ),
                              // Cloud small - near airplane
                              Positioned(
                                right: 38,
                                top: 95,
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFF15A888),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Vector 6.png',
                                    width: 30,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ),
                              // Airplane - upper right
                              Positioned(
                                right: 8,
                                top: 38,
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFF15A888),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Vector.png',
                                    width: 65,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Logo
                      Positioned(
                        left: 28,
                        top: 58,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/Group 3.png',
                              width: 36,
                              height: 36,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.eco_rounded,
                                color: primaryColor,
                                size: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Radio Buttons
                        Row(
                          children: [
                            _buildRadio(1, 'Traveler'),
                            const SizedBox(width: 40),
                            _buildRadio(2, 'Guide'),
                          ],
                        ),
                        const SizedBox(height: 28),

                        // First Name & Last Name
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField('First Name', 'Yoo'),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildTextField('Last Name', 'Jin'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Country
                        _buildTextField('Country', 'Country'),
                        const SizedBox(height: 24),

                        // Email
                        _buildTextField('Email', 'Type email'),
                        const SizedBox(height: 24),

                        // Password
                        _buildTextField(
                          'Password',
                          'Type password',
                          helperText: 'Password has more than 6 letters',
                          isPassword: true,
                        ),
                        const SizedBox(height: 24),

                        // Confirm Password
                        _buildTextField(
                          'Confirm Password',
                          '••••••',
                          isPassword: true,
                          initialValue: '123456',
                        ),

                        const SizedBox(height: 36),

                        // Terms & Conditions
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              text: 'By Signing Up, you agree to our ',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExploreScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Sign In text
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignInScreen(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadio(int value, String title) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Radio<int>(
            value: value,
            groupValue: _userType,
            activeColor: primaryColor,
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return const Color(0xFF424242);
            }),
            onChanged: (int? val) {
              setState(() {
                _userType = val!;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    String? helperText,
    bool isPassword = false,
    String? initialValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: initialValue,
          obscureText: isPassword,
          obscuringCharacter: '•',
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFC4C4C4)),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 6),
          Text(
            helperText,
            style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
          ),
        ],
      ],
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
      size.width * 0.3,
      size.height - 40,
      size.width * 0.7,
      size.height - 40,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
