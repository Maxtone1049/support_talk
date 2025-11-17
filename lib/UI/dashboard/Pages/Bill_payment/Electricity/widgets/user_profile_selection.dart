import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/common/Utils/App_Theme/app_theme.dart';
import 'package:wepay/common/Utils/Custom_Icons/custom_icons.dart';
import 'package:wepay/common/Utils/Custom_widgets/custom_image.dart';

class UserProfileSection extends StatelessWidget {
  final String providerName;
  final String providerLogo;
  final VoidCallback onTap;

  const UserProfileSection({
    super.key,
    required this.providerName,
    required this.providerLogo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
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
                  imageUrl: providerLogo,
                  width: 12.w,
                  height: 12.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Provider',
                    style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    providerName,
                    style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            CustomIconWidget(
              iconName: 'keyboard_arrow_right',
              color: Colors.white.withValues(alpha: 0.8),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
