import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:vibration/vibration.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    required this.controller,
    this.enabled = true,
    this.maximum,
  });

  final TextEditingController controller;
  final int? maximum;
  final bool enabled;

  void _textInputHandler(String text) {
    if (!enabled) return;
    if (controller.text.length == maximum) return;
    controller.text += text;
  }

  void _backspaceHandler() =>
      controller.text =
          controller.text.isEmpty
              ? ''
              : controller.text.substring(0, controller.text.length - 1);

  void _cancelHandler() => controller.text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.07.h),
      decoration: BoxDecoration(
        color: AppColors.greybold.withAlpha((0.50 * 255).toInt()),
      ),
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(param1: '1', param2: '2', param3: '3'),
          _buildRow(param1: '4', param2: '5', param3: '6'),
          _buildRow(param1: '7', param2: '8', param3: '9'),
          buildRowFour(),
          Gap(height: 16),
        ],
      ),
    );
  }

  Expanded _buildRow({
    required String param1,
    required String param2,
    required String param3,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextKey(text: param1, onTextInput: _textInputHandler),
          TextKey(text: param2, onTextInput: _textInputHandler),
          TextKey(text: param3, onTextInput: _textInputHandler),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          ClearAllKey(onBackspace: _cancelHandler),
          TextKey(text: '0', onTextInput: _textInputHandler),
          BackspaceKey(onBackspace: _backspaceHandler),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    required this.text,
    required this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: CupertinoButton(
        onPressed: () async {
          await Vibration.vibrate(duration: 50);
          onTextInput.call(text);
        },
        padding: EdgeInsets.zero,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 6.62.w, vertical: 6.62.h),
          padding: EdgeInsets.symmetric(vertical: 4.135.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.06.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({Key? key, required this.onBackspace, this.flex = 1})
    : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          await Vibration.vibrate(duration: 50);
          onBackspace.call();
        },
        child: Icon(Icons.backspace_outlined, color: Colors.black, size: 32.sp),
      ),
    );
  }
}

class ClearAllKey extends StatelessWidget {
  const ClearAllKey({Key? key, required this.onBackspace, this.flex = 1})
    : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          await Vibration.vibrate(duration: 50);
          onBackspace.call();
        },
        child: Icon(CupertinoIcons.clear, color: Colors.black, size: 32.sp),
      ),
    );
  }
}
