import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/responsive_sized_box.dart';
import 'package:wepay/custom/ui_helper.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Color? textColor;
  final String? hintText;
  final bool autoFocus;
  final bool isPasswordTextField;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? prefixText;
  final bool? enabled;
  final String? initialValue;
  final Color? fillColor;
  final bool? autocorrect;
  final TextCapitalization? textCapitalization;
  final bool readOnly;
  final bool obscureText;
  final int? maxLength;

  final TextStyle? prefixStyle;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final Widget? counter;
  final Widget? suffixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? helperText;
  final VoidCallback? onEditingComplete;
  final BorderRadius? borderRadius;
  final bool filled;
  final int? hintMaxLines;
  final num? height;
  final num? width;
  final TextAlign? textAlign;
  final Color? borderColor;
  final int? maxLines;
  final InputCounterWidgetBuilder? buildCounter;

  final bool _bordered;

  const CustomTextField.bordered({
    super.key,
    this.controller,
    this.readOnly = false,
    this.autofillHints,
    this.onTap,
    this.onChanged,
    this.autovalidateMode,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.onSaved,
    this.onFieldSubmitted,
    this.isPasswordTextField = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.labelText,
    this.floatingLabelBehavior,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = true,
    this.textCapitalization,
    this.obscureText = false,
    this.maxLength,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = false,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.textAlign,
    this.borderColor,
    this.width,
    this.maxLines,
    this.buildCounter,
  }) : _bordered = false;

  const CustomTextField.underlined({
    super.key,
    this.controller,
    this.readOnly = false,
    this.autofillHints,
    this.onTap,
    this.onChanged,
    this.autovalidateMode,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.onSaved,
    this.onFieldSubmitted,
    this.isPasswordTextField = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.labelText,
    this.floatingLabelBehavior,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = true,
    this.textCapitalization,
    this.obscureText = false,
    this.maxLength,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = false,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.textAlign,
    this.borderColor,
    this.width,
    this.maxLines,
    this.buildCounter,
  }) : _bordered = false;

  const CustomTextField.password({
    super.key,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.onTap,
    this.readOnly = false,
    this.autovalidateMode,
    this.prefixIcon,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.floatingLabelBehavior,
    this.isPasswordTextField = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.onSaved,
    this.onFieldSubmitted,
    this.labelText,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = false,
    this.textCapitalization,
    this.obscureText = true,
    this.maxLength,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = false,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.textAlign,
    this.borderColor,
    this.width,
    this.maxLines,
    this.buildCounter,
  }) : _bordered = true;

  const CustomTextField.filled({
    super.key,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.onTap,
    this.readOnly = false,
    this.autovalidateMode,
    this.prefixIcon,
    this.textColor,
    this.hintText,
    this.autoFocus = false,
    this.floatingLabelBehavior,
    this.isPasswordTextField = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.onSaved,
    this.onFieldSubmitted,
    this.labelText,
    this.prefixText,
    this.validator,
    this.enabled,
    this.initialValue,
    this.fillColor,
    this.autocorrect = false,
    this.textCapitalization,
    this.obscureText = false,
    this.maxLength,
    this.prefixStyle,
    this.decoration,
    this.focusNode,
    this.counter,
    this.suffixIcon,
    this.style,
    this.helperText,
    this.onEditingComplete,
    this.borderRadius,
    this.filled = true,
    this.hintMaxLines,
    this.hintStyle,
    this.labelStyle,
    this.height,
    this.textAlign,
    this.borderColor,
    this.width,
    this.maxLines,
    this.buildCounter,
  }) : _bordered = true;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  InputDecoration get _filledDecoration => InputDecoration(
    filled: true,
    fillColor: widget.fillColor ?? kF6F7F9,
    contentPadding: edgeInsetsOnlyResponsive(
      bottom: (widget.height ?? 56) / 2,
      left: 12,
      right: 12,
    ),
    focusedBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 2,
        color: widget.borderColor ?? Colors.transparent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 0,
        color: widget.borderColor ?? Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 0,
        color: widget.borderColor ?? Colors.transparent,
      ),
    ),
  );

  InputDecoration get _borderedDecoration => InputDecoration(
    contentPadding: edgeInsetsOnlyResponsive(
      bottom: (widget.height ?? 40) / 2,
      left: 12,
      right: 12,
    ),
    focusedBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 1,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 0.5,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(
        width: 0.5,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
  );

  InputDecoration get _underlineDecoration => InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
  );

  InputDecoration get _errorDecoration => InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: widget.borderColor ?? kTextFieldColor,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: widget.borderColor ?? Colors.red),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: widget.borderColor ?? Colors.red),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
      borderSide: BorderSide(color: widget.borderColor ?? Colors.red),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bool hasError =
        (widget.validator?.call(widget.controller?.text ?? '') ?? "")
            .isNotEmpty;

    return CustomCard(
      padding: kMainPadding,
      border: Border.all(color: kTextFieldColor),
      color: kTextFieldColor,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText ?? '',
              style:
                  widget.labelStyle ??
                  kInter300Responsive(14).copyWith(color: kEBEBEB),
            ),
            //verticalSpaceCustom(4),
          ],
          ResponsiveSizedBox(
            height:
                widget.isPasswordTextField
                    ? null
                    : widget.maxLines == null
                    ? (widget.height ?? 50)
                    : null,
            width: widget.width,
            child: TextFormField(
              buildCounter: widget.buildCounter,
              inputFormatters: widget.inputFormatters,
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: widget.validator,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              expands: !widget.isPasswordTextField && widget.maxLines == null,
              minLines: null,
              maxLines: _obscureText ? 1 : widget.maxLines,
              autocorrect: widget.autocorrect ?? false,
              autofocus: widget.autoFocus,
              textInputAction: widget.textInputAction,
              enabled: widget.enabled,
              textAlign: widget.textAlign ?? TextAlign.start,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              onEditingComplete: widget.onEditingComplete,
              onSaved: widget.onSaved,
              autofillHints: widget.autofillHints,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.sentences,
              cursorColor: Colors.black,
              controller: widget.controller,
              obscureText: _obscureText,
              style: kInter500Responsive(16),
              decoration: (widget.filled
                      ? _filledDecoration
                      : widget._bordered
                      ? _borderedDecoration
                      : _underlineDecoration)
                  .copyWith(
                    prefixText: widget.prefixText,
                    prefixStyle: widget.prefixStyle ?? kInter500Responsive(16),
                    prefixIcon:
                        widget.prefixIcon == null
                            ? null
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [widget.prefixIcon!],
                            ),
                    hintText: widget.hintText,
                    hintStyle:
                        widget.hintStyle ??
                        kInter500Responsive(16).copyWith(color: kB0B0B0),
                    hintMaxLines: widget.hintMaxLines,
                    errorBorder: UnderlineInputBorder(
                      borderRadius: widget.borderRadius ?? k5pxBorderRadius,
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.red,
                      ),
                    ),
                    // errorText:
                    //     hasError ? widget.validator?.call(widget.controller?.text ?? '') : null,
                    // helperText: ' ', // Reserves space to prevent UI jumps
                    suffixIcon:
                        widget.isPasswordTextField
                            ? GestureDetector(
                              onTap: _toggleObscure,
                              child:
                                  _obscureText
                                      ? const ResponsiveIcon(
                                        Icons.visibility_outlined,
                                        color: kE1E1E1,
                                        size: 16,
                                      )
                                      : const ResponsiveIcon(
                                        Icons.visibility_off_outlined,
                                        color: kE1E1E1,
                                        size: 16,
                                      ),
                            )
                            : widget.suffixIcon,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final StringBuffer newText = StringBuffer();

    for (int i = 0; i < newValue.text.length; i++) {
      if (i == 4 || i == 7) {
        newText.write('');
      }
      newText.write(newValue.text[i]);
    }

    return newValue.copyWith(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
