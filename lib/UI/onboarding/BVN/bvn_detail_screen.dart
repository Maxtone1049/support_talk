import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/UI/onboarding/BVN/widget/DetailHolder.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
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
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';

class BvnDetailScreen extends StatefulWidget {
  const BvnDetailScreen({super.key, required this.userId, this.model});
  final String userId;
  final SuccessResModel? model;

  @override
  State<BvnDetailScreen> createState() => _BvnDetailScreenState();
}

class _BvnDetailScreenState extends State<BvnDetailScreen> {
  final _fullName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _gender = TextEditingController();
  final _dob = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadBvnData();
  }

  Future<void> _loadBvnData() async {
    // final userData = await PreferencesService.getUserPersonalData();

    setState(() {
      _fullName.text = widget.model?.data?.name ?? '';
      // _phoneNumber.text = '9060718411';
      _phoneNumber.text = widget.model?.data?.phone ?? '';
      _gender.text = widget.model?.data?.gender ?? '';
      _dob.text = widget.model?.data?.dob.toString() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: BodyWidget(
        config: BodyConfig(
          childPadding: EdgeInsets.zero,
          backgroundColor: AppColors.kTransparent,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(height: 32),
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
                    text: "BVN Details",
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
                    text: "Your details have been ",
                    style: GoogleFonts.inter(
                      height: 1.5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                    ),
                    children: [
                      TextSpan(
                        text: "authomatically\nretrieved",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text:
                            " from your BVN. Please review\nthem carefully to ensure they are\ncorrect.",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(height: 30),
                DetailHolder(controller: _fullName, caption: 'FULL NAME'),
                DetailHolder(controller: _phoneNumber, caption: 'PHONE NUMBER'),
                DetailHolder(controller: _dob, caption: 'DATE OF BIRTH'),
                DetailHolder(controller: _gender, caption: 'GENDER'),
                Gap(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "If any of the details are ",
                    style: GoogleFonts.inter(
                      height: 1.5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                    ),
                    children: [
                      TextSpan(
                        text: "incorrect",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text:
                            " , please\nupdate them through the appropriate\nchannels before continuing.",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(height: 16),
                ButtonWidget(
                  config: ButtonConfig(
                    text: "Next",
                    onPressed: () {
                      PageRouter.pushNamed(
                        Routes.profileDetails,
                        args: ProfileDetailsArguments(userId: widget.userId),
                      );
                    },
                    height: 54,
                    textColor: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    radius: 50.r,
                    buttonColor: AppColors.primary,
                    buttonOutlinedColor: AppColors.primary,
                  ),
                ),
                Gap(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
