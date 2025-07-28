import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: AppColorPath.darkBlue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Center(
          child: Icon(icon, color: Colors.white, weight: 700, size: 19),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
