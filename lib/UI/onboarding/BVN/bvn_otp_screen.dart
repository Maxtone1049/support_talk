import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/models/verify_otp_model/verify_otp_model.dart';
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
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/custom/otp_widget.dart';
import 'package:wepay/custom/ui_helper.dart';
import 'package:wepay/services/others/preference_service.dart';

class BvnOtpScreen extends StatefulWidget {
  const BvnOtpScreen({super.key, required this.userId});
  final String userId;

  @override
  State<BvnOtpScreen> createState() => _BvnOtpScreenState();
}

class _BvnOtpScreenState extends State<BvnOtpScreen> {
  String? otpCode;
  String? id;

  @override
  void initState() {
    super.initState();
    _loadBvnData();
    // _updateToken();
  }

  Future<void> _loadBvnData() async {
    final bvnData = await PreferencesService.getBvnVerificationData();
    setState(() {
      id = bvnData['bvn_id'];
    });
  }

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
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Enter the ",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "OTP",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text:
                                " sent to verify your\naccount and complete the process.",
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
                    verticalSpaceCustom(100),
                    // Row(
                    //   children: [
                    //     TextView(
                    //       config: TextViewConfig(text: "Didn't receive OTP? "),
                    //     ),
                    //     TextView(
                    //       config: TextViewConfig(
                    //         text: "Resend",
                    //         color: AppColors.primary,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    verticalSpaceSmall,
                    OTPWidget(
                      length: 6,
                      onChanged: (value) {
                        otpCode = value;
                        print(otpCode);
                      },
                      onTap: () {
                        model.resendOTP(widget.userId);
                      },
                      onCompleted: (value) {
                        // verifyBVN(id: id, otp: otpCode);
                        model.vertUser(
                          VerifyOtpModel(code: otpCode),
                          widget.userId,
                        );
                      },
                    ),
                    verticalSpaceCustom(80),
                    ButtonWidget(
                      config: ButtonConfig(
                        text: "Next",
                        onPressed: () {
                          model.vertUser(
                            VerifyOtpModel(code: otpCode),
                            widget.userId,
                          );
                        },
                        height: 54,
                        textColor:
                            otpCode?.length == 6
                                ? AppColors.black
                                : AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        radius: 50.r,
                        enabled: otpCode?.length == 6 ? true : false,
                        buttonColor:
                            otpCode?.length == 6
                                ? AppColors.primary
                                : AppColors.grey600,
                        buttonOutlinedColor:
                            otpCode?.length == 6
                                ? AppColors.primary
                                : AppColors.grey600,
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
