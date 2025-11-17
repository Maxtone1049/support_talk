import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String selectedItem;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Container(
            height: 51.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryButton,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  config: TextViewConfig(
                    text: widget.selectedItem,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            height: 250, // Adjust height according to your need
            decoration: BoxDecoration(
              color: AppColors.secondaryButton,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    widget.onChanged(widget.items[index]);
                    setState(() {
                      isDropdownOpen = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColors.grey)),
                    ),
                    child: TextView(
                      config: TextViewConfig(
                        text: widget.items[index],
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
