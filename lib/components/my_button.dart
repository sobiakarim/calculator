import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  final bool isRectangle; // Added parameter for shape

  const MyButton({
    super.key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress,
    this.isRectangle = false, // Default is false, meaning circular button
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: isRectangle ? BoxShape.rectangle : BoxShape.circle, // Conditional shape
              color: color,
              borderRadius: isRectangle ? BorderRadius.circular(10) : null, // Rounded corners for rectangle
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
