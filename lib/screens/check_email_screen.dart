import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../constants/colors.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const HeaderWidget(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check Email',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please check your email for the instructions on how to reset your password.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/images/Vector 1.png",
                    width: 150,
                    color: primaryColor,
                  ),
                ), // Demo icon bìa thư
                const SizedBox(height: 50),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).popUntil((route) => route.isFirst),
                    child: const Text.rich(
                      TextSpan(
                        text: "Back to ",
                        style: TextStyle(color: greyTextColor),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
