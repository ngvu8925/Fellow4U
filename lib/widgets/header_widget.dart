import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: 220,
        width: double.infinity,
        color: primaryColor,
        child: Stack(
          children: [
            // Mây nhỏ bên trái
            Positioned(
              left: 140,
              top: 80,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset("assets/images/Vector.png", width: 50),
              ),
            ),
            // Mây to bên phải
            Positioned(
              right: 80,
              bottom: 40,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset("assets/images/Vector 1.png", width: 70),
              ),
            ),
            // Máy bay
            Positioned(
              right: 0,
              top: 20,
              child: Image.asset(
                "assets/images/Vector 6.png",
                width: 220,
                fit: BoxFit.contain,
              ),
            ),
            // Logo chữ 'b'
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Image.asset("assets/images/Group 3.png", width: 32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    var controlPoint = Offset(size.width * 0.5, size.height + 25);
    var endPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
