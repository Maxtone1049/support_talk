import 'package:flutter/material.dart';

import '../../assets/app_colors.dart';

class CustomSelectionButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const CustomSelectionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<CustomSelectionButton> createState() => _CustomSelectionButtonState();
}

class _CustomSelectionButtonState extends State<CustomSelectionButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
        widget.onTap(); // Call the original onTap callback
      },
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _isTapped ? AppColors.primary : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            color: _isTapped ? AppColors.primary : AppColors.secondary,
            //fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
