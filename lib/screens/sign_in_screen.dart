import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import 'explore_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                  ClipPath(
                    clipper: _HeaderClipper(),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      color: primaryColor,
                      child: Stack(
                        children: [
                          // Flight path dashed line
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
                                errorBuilder: (_, __, ___) => const SizedBox(),
                              ),
                            ),
                          ),
                          // Cloud big
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
                                errorBuilder: (_, __, ___) => const SizedBox(),
                              ),
                            ),
                          ),
                          // Cloud small
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
                                errorBuilder: (_, __, ___) => const SizedBox(),
                              ),
                            ),
                          ),
                          // Airplane
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
                                errorBuilder: (_, __, ___) => const SizedBox(),
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
                      'Sign In',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Welcome back text
                    const Text(
                      'Welcome back, Yoo Jin',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Email
                    _buildTextField('Email', 'yoojin@gmail.com'),
                    const SizedBox(height: 28),

                    // Password
                    _buildTextField('Password', '••••••',
                        isPassword: true, initialValue: '123456'),
                    const SizedBox(height: 10),

                    // Forgot Password
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Sign In Button
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
                              builder: (_) => const ExploreScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // or sign in with
                    const Center(
                      child: Text(
                        'or sign in with',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Social login buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Facebook
                        _socialButton(
                          color: const Color(0xFF3B5998),
                          icon: Icons.facebook,
                        ),
                        const SizedBox(width: 16),
                        // KakaoTalk
                        _socialButton(
                          color: const Color(0xFFFEE500),
                          text: 'TALK',
                          textColor: Colors.black87,
                        ),
                        const SizedBox(width: 16),
                        // LINE
                        _socialButton(
                          color: const Color(0xFF00C300),
                          text: 'LINE',
                          textColor: Colors.white,
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Don't have an account? Sign Up
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
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
    );
  }

  Widget _buildTextField(String label, String hint,
      {bool isPassword = false, String? initialValue}) {
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
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xFFC4C4C4),
            ),
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
      ],
    );
  }

  Widget _socialButton({
    required Color color,
    IconData? icon,
    String? text,
    Color textColor = Colors.white,
  }) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: Colors.white, size: 28)
            : Text(
                text ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
      ),
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
