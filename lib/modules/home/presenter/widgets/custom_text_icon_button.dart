import 'package:flutter/material.dart';

class CustomTextIconButton extends StatelessWidget {
  const CustomTextIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Read more",
          style: TextStyle(
            color: Colors.blue[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Icon(
          Icons.arrow_right_alt,
          color: Colors.blue[600],
        ),
      ],
    );
  }
}
