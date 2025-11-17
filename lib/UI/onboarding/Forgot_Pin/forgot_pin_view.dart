import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_model/forget_pin_model.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/UI/widgets/ProfileFiller.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.locator.dart';

class ForgotPinView extends StatefulWidget {
  const ForgotPinView({super.key});

  @override
  State<ForgotPinView> createState() => _ForgotPinViewState();
}

class _ForgotPinViewState extends State<ForgotPinView> {
  final phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<AuthViewModel>(),
      builder: (_, model, _) {
        return BackgroundView(
          child: BodyWidget(
            config: BodyConfig(
              loading: model.isBusy,
              backgroundColor: AppColors.kTransparent,
              childPadding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(height: 42),
                    Center(
                      child: ImageView(
                        imageConfig: ImageConfig(
                          imageURL: AppImage.logo,
                          imageType: ImageType.asset,
                        ),
                      ),
                    ),
                    Gap(height: 32),
                    TextView(
                      config: TextViewConfig(
                        text: "We Need To Verify You",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: 8),
                    TextView(
                      config: TextViewConfig(
                        text:
                            "To confirm that this operation is being\nperformed by the account holder.please\nverify your identity.",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: 30),
                    ProfileFiller(
                      caption: "PHONE NUMBER",
                      widget: TextFormField(
                        controller: phoneNumber,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              children: [
                                ImageView(
                                  imageConfig: ImageConfig(
                                    imageURL: AppImage.flag,
                                    imageType: ImageType.svg,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20.sp,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                          border: InputBorder.none,
                          label: Text(
                            "| Enter your phone number",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: AppColors.textColor.withAlpha(
                                (0.40 * 225).toInt(),
                              ),
                            ),
                          ),
                          labelStyle: GoogleFonts.inter(
                            fontSize: 18,
                            color: AppColors.textColor.withAlpha(
                              (0.40 * 225).toInt(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(height: 30),
                    ButtonWidget(
                      config: ButtonConfig(
                        text: "Continue",
                        onPressed: () {
                          if (phoneNumber.text.isNotEmpty) {
                            model.forgotPin(
                              ForgetPinModel(phone: phoneNumber.text),
                            );
                          } else {
                            AppUiComponents.triggerNotification(
                              "Phone Number is required",
                              error: true,
                            );
                          }
                        },
                        height: 54,
                        radius: 50.r,
                        textColor: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
