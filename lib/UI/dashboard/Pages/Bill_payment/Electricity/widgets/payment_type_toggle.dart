import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/common/Utils/App_Theme/app_theme.dart';
import 'package:wepay/common/Utils/Custom_Icons/custom_icons.dart';

class PaymentTypeToggle extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;

  const PaymentTypeToggle({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleButton(
              context,
              'Prepaid',
              selectedType == 'Prepaid',
              () => _handleToggle('Prepaid'),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: _buildToggleButton(
              context,
              'Postpaid',
              selectedType == 'Postpaid',
              () => _handleToggle('Postpaid'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(
    BuildContext context,
    String type,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        // height: responsiveScreenHeight * 0.055,
        width: 180.w,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppTheme.lightTheme.colorScheme.secondary
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppTheme.lightTheme.colorScheme.secondary
                          .withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected) ...[
              CustomIconWidget(
                iconName: 'check_circle',
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 2.w),
            ],
            TextView(
              config: TextViewConfig(
                text: type,
                fontSize: 14,
                color:
                    isSelected
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.7),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleToggle(String type) {
    if (selectedType != type) {
      HapticFeedback.lightImpact();
      onTypeChanged(type);
    }
  }
}
