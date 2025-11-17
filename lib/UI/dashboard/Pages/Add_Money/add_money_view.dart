import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/viewmodel/home_page_view_model.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/AppUtils/app_helpers.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';

class AddMoneyView extends StatelessWidget {
  const AddMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => locator<HomePageViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            childPadding: EdgeInsets.zero,
            backgroundColor: Color(0xff0C1013),
            showAppBar: true,
            appBarTitle: "Add Money",
            fontSize: 15.sp,
            appbarBackgroundColor: AppColors.kTransparent,
            appbarTitleColor: AppColors.white,
            centerTitle: false,
            showLeadingWidget: true,
            leadingWidget: InkWell(
              onTap: () => PageRouter.pop(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
                color: AppColors.white,
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: k181C20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    config: TextViewConfig(
                                      text: "Bank Transfer",
                                      fontSize: 14,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Gap(height: 5),
                                  TextView(
                                    config: TextViewConfig(
                                      text:
                                          "Add money via mobile or internet banking",
                                      fontSize: 12,
                                      color: AppColors.white.withAlpha(
                                        (0.70 * 225).toInt(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20.sp,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Gap(height: 30),
                        TextView(
                          config: TextViewConfig(
                            text: "Wepay Account Number",
                            fontSize: 14,
                            color: AppColors.white.withAlpha(
                              (0.70 * 225).toInt(),
                            ),
                          ),
                        ),
                        Gap(height: 20),
                        TextView(
                          config: TextViewConfig(
                            text: model.accountNumber,
                            fontSize: 30,
                            color: AppColors.white,
                          ),
                        ),
                        Gap(height: 10),
                        TextView(
                          config: TextViewConfig(
                            text: model.bankName,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        Gap(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                config: ButtonConfig(
                                  text: "Copy Number",
                                  onPressed:
                                      () =>
                                          AppHelpers.copy(model.accountNumber),
                                  radius: 50.r,
                                  buttonColor: AppColors.borderColorone,
                                  buttonOutlinedColor: AppColors.kTransparent,
                                  textColor: AppColors.primary,
                                ),
                              ),
                            ),
                            Gap(width: 10),
                            Expanded(
                              child: ButtonWidget(
                                config: ButtonConfig(
                                  text: "Share Details",
                                  onPressed:
                                      () => AppHelpers.share(
                                        context: context,
                                        title:
                                            'Send Money Easily to your Account\nAccount Number${model.accountNumber}\nBank Name${model.bankName}',
                                      ),
                                  radius: 50.r,
                                  buttonColor: AppColors.kcDarkGreenColor,
                                  buttonOutlinedColor: AppColors.kTransparent,
                                  textColor: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
