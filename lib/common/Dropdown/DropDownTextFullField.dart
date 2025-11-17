import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assets/app_colors.dart';
import '../Gap.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'DropDownTextField.dart';
import 'Model/DropdownConfig.dart';

class DropDownTextFullField extends StatefulWidget {
  const DropDownTextFullField({required this.config, super.key});

  final DropdownConfig config;

  @override
  State<DropDownTextFullField> createState() => _DropDownTextFullFieldState();
}

class _DropDownTextFullFieldState extends State<DropDownTextFullField> {
  DropDownValueModel? _dropDownValueModel;

  @override
  void didUpdateWidget(covariant DropDownTextFullField oldWidget) {
    if (oldWidget != widget) {
      if (widget.config.dropDownList.isEmpty) {
        _dropDownValueModel = null;
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.config.title != null)
          Row(
            children: [
              Flexible(
                child: TextView(
                  config: TextViewConfig(
                    text: widget.config.title ?? '',
                    fontSize: 14,
                    textAlign: TextAlign.left,
                    color: AppColors.grey700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (widget.config.isRequired) const Gap(width: 3),
              if (widget.config.isRequired)
                TextView(
                  config: TextViewConfig(
                    text: '*',
                    fontSize: 12,
                    color: AppColors.primary,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (widget.config.hintRight != null) const Spacer(),
              if (widget.config.hintRight != null)
                TextView(
                  config: TextViewConfig(
                    text: widget.config.hintRight ?? '',
                    fontSize: 12,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        if (widget.config.title != null) const Gap(height: 8),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return DropdownButtonHideUnderline(
              child: DropdownButtonFormField<DropDownValueModel>(
                autovalidateMode: widget.config.autoValidateMode,
                enableFeedback: true,
                decoration:
                    widget.config.decoration ??
                    InputDecoration(
                      labelText: widget.config.label,
                      hintStyle: widget.config.hintStyle,
                      labelStyle: widget.config.labelStyle,
                      filled: widget.config.filled,
                      fillColor: widget.config.filledColor,
                      prefix: widget.config.prefixWidget,
                      prefixIcon: widget.config.prefixIconWidget,
                      hintText: widget.config.hint,
                      enabled: widget.config.enabled ?? true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(
                          color: AppColors.accent,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(color: AppColors.grey300),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(color: AppColors.grey300),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.config.radius.r,
                        ),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      floatingLabelBehavior:
                          widget.config.floatingLabelBehavior,
                      alignLabelWithHint: widget.config.alignLabelWithHint,
                      contentPadding: widget.config.edgeInsetsGeometry,
                    ),
                icon: widget.config.suffixIconWidget,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                hint: Text(
                  widget.config.label ?? '',
                  style: widget.config.hintStyle,
                ),
                items:
                    widget.config.dropDownList
                        .map<DropdownMenuItem<DropDownValueModel>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: TextView(
                              config: TextViewConfig(text: value.name),
                            ),
                          );
                        })
                        .toList(),
                isExpanded: true,
                isDense: true,
                validator: widget.config.validator,
                onChanged:
                    !(widget.config.enabled ?? false)
                        ? null
                        : (DropDownValueModel? newSelectedBank) {
                          _onDropDownItemSelected(newSelectedBank);
                        },
                value: _dropDownValueModel,
              ),
            );
          },
        ),
      ],
    );
  }

  void _onDropDownItemSelected(DropDownValueModel? newSelectedBank) {
    setState(() {
      _dropDownValueModel = newSelectedBank;
    });
    if (widget.config.onChanged != null) {
      widget.config.onChanged!(newSelectedBank);
    }
  }
}
