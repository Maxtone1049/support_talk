import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/Authentication/token%20provider/auth_token_provider.dart';
import 'package:wepay/UI/onboarding/models/login_model/login_model.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
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
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/Loader/custom_loader.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/ui_helper.dart';
import 'package:wepay/services/network/api.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneNumber = TextEditingController();
  final _pin = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeToken(ref.read(tokenProvider.notifier));
    });
  }

  bool _obscureText = false;

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            loading: model.isBusy,
            childPadding: EdgeInsets.zero,
            backgroundColor: Colors.black,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                      text: "Log in",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(height: 8),
                  verticalSpaceCustom(10),
                  CustomRichText.split(
                    text: "Log in to access your account",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                    color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                  ),
                  verticalSpaceCustom(40),
                  ProfileFiller(
                    caption: "PHONE NUMBER",
                    widget: TextFormField(
                      controller: _phoneNumber,
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

                  ProfileFiller(
                    caption: "PIN",
                    widget: TextFormField(
                      controller: _pin,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
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
                        ),
                        border: InputBorder.none,
                        label: Text(
                          "PIN",
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
                  verticalSpaceTiny,
                  GestureDetector(
                    onTap: () => PageRouter.pushNamed(Routes.forgotPinView),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "Forgot PIN?",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(height: 60),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          config: ButtonConfig(
                            text: "Log In",
                            onPressed: () {
                              model.loginUser(
                                LoginModel(
                                  phone: _phoneNumber.text,
                                  pin: _pin.text,
                                ),
                              );
                            },
                            height: 54,
                            radius: 50.r,
                            textColor: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Gap(width: 20),
                      ImageView(
                        imageConfig: ImageConfig(
                          imageURL: AppImage.printlog,
                          imageType: ImageType.asset,
                        ),
                      ),
                    ],
                  ),
                  Gap(height: 20),
                  verticalSpaceSmall,
                  GestureDetector(
                    onTap: () {
                      PageRouter.pushNamed(Routes.bvnScreen);
                    },
                    child: CustomRichText.split(
                      text: "Don't have an account? Sign Up",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,

                      customString: [
                        CustomString(
                          string: 'Sign Up',
                          textStyle: kInter300Responsive(
                            16,
                          ).copyWith(color: kLightGreen),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceCustom(40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> loginUser({required String phone, required String pin}) async {
    LoaderManager.showLoader(context);
    try {
      var data = {"phone_number": phone, "pin": pin};
      log("data; $data");
      final response = await Api().postRequest2(data, "/LoginDetails");
      final responseBody = await response.stream.bytesToString();
      final body = jsonDecode(responseBody);
      log("login body; $body");
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        await saveToken(body['token'], ref.read(tokenProvider.notifier));
        // setState(() {
        //   token = body['token'];
        // });
        log("token = ${body['token']}");
        LoaderManager.hideLoader();
        //  await getProfile();
        PageRouter.pushReplacement(Routes.dashboardView);
      } else {
        LoaderManager.hideLoader();
        AppUiComponents.triggerNotification("${body['error']}");
        // ToastService.showErrorToast(message: "Error ${body['error']}");
      }
    } catch (e) {
      LoaderManager.hideLoader();
      AppUiComponents.triggerNotification(e.toString(), error: true);
      throw Exception(e);
    }
  }
}
