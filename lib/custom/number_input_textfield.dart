import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/custom_textfield.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class NumberInputTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool showSiffix;
  final String? hintText;

  const NumberInputTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.showSiffix = false,
    this.hintText,
  });

  @override
  State<NumberInputTextField> createState() => _NumberInputTextFieldState();
}

class _NumberInputTextFieldState extends State<NumberInputTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateCount);
  }

  @override
  void dispose() {
    // Only dispose the controller if we created it ourselves
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_updateCount);
    }
    super.dispose();
  }

  void _updateCount() {
    if (widget.showSiffix) {
      setState(() {}); // Trigger rebuild to update the count
    }
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextField.bordered(
            controller: _controller,
            hintText: widget.hintText ?? 'enter number',
            onChanged: (value) => _updateCount(),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allow only digits
              LengthLimitingTextInputFormatter(11), // Max length of 11
            ],
            borderRadius: BorderRadius.circular(10),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your BVN';
              }
              return null;
            },
            suffixIcon:
                widget.showSiffix
                    ? Container(
                      height: 20,
                      width: 20,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kDeactivatedColor,
                        border: Border.all(color: k188C18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ResponsiveText(
                          _controller.text.length.toString(),
                        ),
                      ),
                    )
                    : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
// class NumberInputTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final bool showSiffix;
//   final String? hintText;

//   const NumberInputTextField({
//     super.key,
//     this.controller,
//     this.onChanged,
//     this.showSiffix = false,
//     this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: CustomTextField.bordered(
//             controller: controller,
//             hintText: hintText ?? 'enter number',
//             onChanged: onChanged,
//             keyboardType: TextInputType.phone,
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly, // Allow only digits
//               LengthLimitingTextInputFormatter(11), // Max length of 20
//             ],
//             borderRadius: BorderRadius.circular(10),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Enter your BVN';
//               }
//               return null;
//             },
//             suffixIcon:
//                 showSiffix
//                     ? Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         color: kDeactivatedColor,
//                         border: Border.all(color: k188C18),
//                         borderRadius: BorderRadius.circular(10),
//                       ),

//                       child: Center(child: ResponsiveText('0')),
//                     )
//                     : SizedBox(),
//           ),
//         ),
//       ],
//     );
//   }
// }
