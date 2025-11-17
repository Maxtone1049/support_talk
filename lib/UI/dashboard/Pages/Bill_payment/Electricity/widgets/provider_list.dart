import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/common/Utils/App_Theme/app_theme.dart';
import 'package:wepay/common/Utils/Custom_widgets/custom_image.dart';

class ProviderListItem extends StatelessWidget {
  final Map<String, dynamic> provider;
  final String? selectedProviderId;
  final ValueChanged<String> onProviderSelected;

  const ProviderListItem({
    super.key,
    required this.provider,
    required this.selectedProviderId,
    required this.onProviderSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedProviderId == provider['id'];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppTheme.lightTheme.colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border:
            isSelected
                ? Border.all(
                  color: AppTheme.lightTheme.colorScheme.primary.withValues(
                    alpha: 0.3,
                  ),
                  width: 1.5,
                )
                : null,
      ),
      child: RadioListTile<String>(
        value: provider['id'] as String,
        groupValue: selectedProviderId,
        onChanged: (value) {
          if (value != null) {
            HapticFeedback.selectionClick();
            onProviderSelected(value);
          }
        },
        title: Row(
          children: [
            // Provider logo with circular background
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: CustomImageWidget(
                  imageUrl: provider['logoUrl'] as String,
                  width: 12.w,
                  height: 12.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            // Provider name
            Expanded(
              child: Text(
                provider['name'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        activeColor: AppTheme.lightTheme.colorScheme.primary,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.lightTheme.colorScheme.primary;
          }
          return Colors.white.withValues(alpha: 0.6);
        }),
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        controlAffinity: ListTileControlAffinity.trailing,
        dense: false,
        visualDensity: VisualDensity.comfortable,
      ),
    );
  }
}
