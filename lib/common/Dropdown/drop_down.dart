import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Dropdown/Model/DropdownConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class ComportDropDown extends StatefulWidget {
  final DropdownConfig config;

  final String selectedItem;
  final double? height;

  const ComportDropDown({
    super.key,
    required this.selectedItem,
    required this.config,
    this.height,
  });

  @override
  State<ComportDropDown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<ComportDropDown> {
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
              color: AppColors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: TextView(
                    config: TextViewConfig(
                      text: widget.selectedItem,
                      fontSize: 14.sp,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Icon(
                    isDropdownOpen
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            height: 150, // Adjust height according to your need
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.builder(
              itemCount: widget.config.dropDownList.length,
              itemBuilder: (context, index) {
                var text = widget.config.dropDownList[index];
                return GestureDetector(
                  onTap: () {
                    widget.config.onChanged!(text);
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
                        text: text.name,
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
