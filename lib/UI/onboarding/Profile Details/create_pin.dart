import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/models/create_pin_model/create_pin_model.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
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
import 'package:wepay/custom/otp_widget.dart';
import 'package:wepay/custom/ui_helper.dart';


class CreatePin extends ConsumerStatefulWidget {
  const CreatePin(this.userId, {super.key});
  final String userId;

  @override
  ConsumerState<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends ConsumerState<CreatePin> {
  final pinController = TextEditingController();
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BackgroundView(
          child: BodyWidget(
            config: BodyConfig(
              loading: model.isBusy,
              childPadding: EdgeInsets.zero,
              backgroundColor: AppColors.kTransparent,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(height: 72),
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
                        text: "Create Your 4-digit PIN",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Create a ",
                        style: GoogleFonts.inter(
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "4-digit pin ",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text:
                                " for your security. You'll\nlog into your account with this pin.",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white.withAlpha(
                                (0.70 * 225).toInt(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(height: 27),
                    OTPWidget(
                      length: 4,
                      onChanged: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                      onTap: () {},
                      onCompleted: (value) async {
                        await model.createPin(
                          CreatePinModel(pin: otpCode),
                          widget.userId,
                        );
                      },
                    ),
                    verticalSpaceCustom(80),

                    ButtonWidget(
                      config: ButtonConfig(
                        text: "Set PIN",
                        radius: 50.r,
                        height: 54,
                        textColor: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () async {
                          await model.createPin(
                            CreatePinModel(pin: otpCode),
                            widget.userId,
                          );
                        },
                      ),
                    ),
                    verticalSpaceCustom(40),
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
