import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class CustomDropdown<T> extends StatelessWidget {
  final Iterable<DropdownMenuItem<T>> list;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final String? labelText;
  final String? hintText;
  final String? Function(T?)? validator; // New property for validation

  const CustomDropdown({
    super.key,
    required this.list,
    this.onChanged,
    this.value,
    this.labelText,
    this.hintText,
    this.validator, // Pass the validator function here
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          ResponsiveText.w600(labelText!, fontSize: 14, color: k333333),
          verticalSpaceCustom(4),
        ],
        FormField<T>(
          initialValue: value,
          validator: validator, // Use the validator here
          builder: (FormFieldState<T> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  height: 56,
                  borderRadius: k4pxBorderRadius,
                  border: k1pxBorder,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: kTextFieldColor,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<T?>(
                      dropdownColor: Colors.white,

                      hint:
                          hintText != null
                              ? ResponsiveText.w500(
                                hintText!,
                                fontSize: 16,
                                color: kB0B0B0,
                              )
                              : null,
                      icon: const ResponsiveIcon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      onChanged: (T? selected) {
                        state.didChange(
                          selected,
                        ); // Notify the form field of the value change
                        if (onChanged != null) {
                          onChanged!(selected);
                        }
                      },

                      value: value,
                      style: TextStyle(color: kB0B0B0),
                      items: list.toList(),
                    ),
                  ),
                ),
                // Show the validation error message if any
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(color: kBF0303, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T?> {
  final String title;
  final T? e;

  CustomDropdownMenuItem({required this.title, this.e, super.key})
    : super(child: ResponsiveText.w500(title), value: e);
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.labelText,
    this.hintText,
    required this.list,
    this.onChanged,
  });
  final String? labelText;
  final String? hintText;
  final List<String> list;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          ResponsiveText.w600(labelText!, fontSize: 14, color: k333333),
          verticalSpaceCustom(4),
        ],
        CustomCard(
          height: 56,
          borderRadius: k4pxBorderRadius,
          border: k1pxBorder,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextDropdownFormField(
            options: list,
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: k005312,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),

              enabledBorder: OutlineInputBorder(
                gapPadding: 10,
                borderRadius: k5pxBorderRadius,
                borderSide: BorderSide(width: 0.5, color: k005312),
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 10,
                borderRadius: k5pxBorderRadius,
                borderSide: BorderSide(width: 0.5, color: k005312),
              ),
              labelText: labelText,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 16, color: kB0B0B0),
              suffixIcon: const ResponsiveIcon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ),
            dropdownHeight: 100,
          ),
        ),
      ],
    );
  }
}
