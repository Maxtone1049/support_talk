import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/custom_textfield.dart';
import 'package:wepay/custom/image_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class PhoneTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PhoneTextfield({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextField.bordered(
      labelText: "PHONE NUMBER",
      controller: controller,
      hintText: '0x0xxxxx',
      onChanged: onChanged,
      //labelText: "phone number",
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
        LengthLimitingTextInputFormatter(12), // Max length of 20
      ],
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        return null;
      },
      prefixIcon: CustomCard(
        //border: Border.all(color: kBDBDBD),
        size: 55,
        // height: 90,
        color: kTextFieldColor,
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(5)),
        padding: edgeInsetsSymetricResponsive(horizontal: 8),
        child: const Center(child: ImageCard.local('flag.svg', size: 25)),
      ),
    );
  }
}
