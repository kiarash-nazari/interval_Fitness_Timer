import 'package:flutter/material.dart';
import 'package:interval_timer/res/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key, required this.buttontext, required this.onTap});

  final String buttontext;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 1.3,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainblue, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero, // Remove default padding
          elevation: 0, // Remove default elevation to prevent shadow in center
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: AppColors.grMidLevel,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            // color: AppColors.mainblue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              // Light shadow on top-left
              BoxShadow(
                color: Colors.green.withOpacity(0.6),
                offset: const Offset(-6, -6),
                blurRadius: 16,
              ),
              // Dark shadow on bottom-right
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(6, 6),
                blurRadius: 16,
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttontext,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
