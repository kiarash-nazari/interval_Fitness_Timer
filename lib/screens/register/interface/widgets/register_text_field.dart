import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool scure;
  final String hint;
  const RegisterTextField(
      {super.key,
      required this.textEditingController,
      required this.scure,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 1.3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            // Light shadow on top-left
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6, -6),
              blurRadius: 16,
            ),
            // Dark shadow on bottom-right
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(6, 6),
              blurRadius: 16,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          controller: textEditingController,
          obscureText: scure,
        ),
      ),
    );
  }
}
