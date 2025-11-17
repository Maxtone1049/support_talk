import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/Models/BVN/bvn_response_model.dart';
import 'package:wepay/UI/onboarding/models/register_user_model/register_user_model.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/EditField/EditFieldView.dart';
import 'package:wepay/common/EditField/Model/EditFieldConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/Loader/custom_loader.dart';
import 'package:wepay/services/network/api.dart';
import 'package:wepay/services/others/preference_service.dart';

class BvnScreen extends StatefulWidget {
  const BvnScreen({super.key});

  @override
  State<BvnScreen> createState() => _BvnScreenState();
}

class _BvnScreenState extends State<BvnScreen> {
  final _bvnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        SharedPreferencesService.instance.clearCredentials();
      },
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
                        text: "Enter Your BVN",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Verify your ",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "identity",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text:
                                " to secure your account\nand ensure safe access to all features",
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
                    Gap(height: 57),
                    EditFormField(
                      config: EditFieldConfig(
                        title: "Bank Verification Number",
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                        controller: _bvnController,
                        label: "Enter your BVN",
                        labelStyle: GoogleFonts.inter(
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        suffixIconWidget: Container(
                          // padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: 24.w,
                          height: 24.h,
                          margin: EdgeInsets.only(
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightprimary,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: TextView(
                            config: TextViewConfig(
                              text: _bvnController.text.length.toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey200,
                            ),
                          ),
                        ),
                        filledColor: AppColors.kTransparent,
                        keyboardType: TextInputType.number,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        radius: 12.r,
                        // maxLength: 11,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Allow only digits
                          LengthLimitingTextInputFormatter(
                            11,
                          ), // Max length of 11
                        ],
                        showMaxLengthCounter: true,
                        onChange: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Gap(height: 79),
                    ButtonWidget(
                      config: ButtonConfig(
                        text: "Next",
                        loading: model.isLoading ?? false,
                        onPressed: () {
                          if (_bvnController.text.isNotEmpty) {
                            model.signUpUser(
                              RegisterUserModel(
                                bvn: _bvnController.text,
                                role: "USER",
                              ),
                            );
                          } else {
                            AppUiComponents.triggerNotification(
                              "Enter Bvn Number",
                              error: true,
                            );
                          }
                        },
                        radius: 50.r,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 54,
                        textColor: AppColors.black,
                        buttonColor: AppColors.primary,
                        buttonOutlinedColor: AppColors.primary,
                      ),
                    ),

                    Gap(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have a BVN? Dial",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: "*565#",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text: " from the\nnumber linked to your BVN.",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white.withAlpha(
                                (0.70 * 225).toInt(),
                              ),
                            ),
                          ),
                        ],
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

  Future<void> enterBVN({required dynamic bvn}) async {
    LoaderManager.showLoader(context);
    try {
      final response = await Api().postRequest4(
        "/InitiateVerification?bvn_number=$bvn&debitAccountNumber=0110324148",
      );
      final responseBody = await response.stream.bytesToString();
      final body = jsonDecode(responseBody);
      log("Response == $body");
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        BvnData data = BvnData.fromJson(body['data']);
        await PreferencesService.saveBvnVerificationData(data);
        LoaderManager.hideLoader();
        PageRouter.pushNamed(Routes.bvnOtpScreen);
      } else {
        LoaderManager.hideLoader();
        AppUiComponents.triggerNotification("${body['error']}", error: true);
        // ToastService.showErrorToast(message: "Error ${body['error']}");
      }
    } catch (e) {
      LoaderManager.hideLoader();
      AppUiComponents.triggerNotification(e.toString(), error: true);
      // throw Exception(e);
    }
  }
}
