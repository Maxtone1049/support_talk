import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:wepay/common/Utils/Custom_widgets/custom_dropdown.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key, required this.userId});
  final String userId;

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final email = TextEditingController();
  final occupation = TextEditingController();

  final List<String> religion = ["Christianity", "Muslim", "Others"];
  final List<String> maritalStatus = ["Single", "Married", "Divorced"];
  final List<String> educationLevel = [
    "No Formal Education",
    "Primary School",
    "High School",
    "Diploma Certificate",
    "Bsc Degree",
    "Msc Degree",
    "Doctorate (PhD)",
    "Vocational Training",
    "Others",
  ];
  Map data = <String, dynamic>{
    'religion': null,
    'maritalStatus': null,
    'educationLevel': null,
    'email': null,
    'occupation': null,
  };

  String? selectedReligion;
  String? selectedMaritalStatus;
  String? selectedEducationLevel; // ✅ new state variable

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
                Gap(height: 22),
                TextView(
                  config: TextViewConfig(
                    text: "Profile Details",
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
                    text: "Complete your ",
                    style: GoogleFonts.inter(
                      height: 1.5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                    ),
                    children: [
                      TextSpan(
                        text: "profile",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: " to start enjoying\nWePay's services.",
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
                ProfileFiller(
                  caption: "EMAIL ADDRESS",
                  widget: TextFormField(
                    controller: email,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text("Enter your email address"),
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
                  caption: "OCCUPATION",
                  widget: TextFormField(
                    controller: occupation,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Enter your occupation",
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

                // ✅ Education Level Dropdown
                CustomDropdownField<String>(
                  labelText: "EDUCATION LEVEL",
                  hintText: "Enter your education level",
                  value:
                      educationLevel.contains(selectedEducationLevel)
                          ? selectedEducationLevel
                          : null, // ✅ ensures value is always safe
                  items: educationLevel,
                  onChanged: (selected) {
                    setState(() {
                      selectedEducationLevel = selected;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select Education Level";
                    }
                    return null;
                  },
                ),

                // ✅ Religion + Marital Status Row
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownField<String>(
                        labelText: "RELIGION",
                        hintText: "religion",
                        value: selectedReligion,
                        items: religion,
                        onChanged: (selected) {
                          setState(() {
                            selectedReligion = selected;
                          });
                        },
                        validator: (value) {
                          if (value == null) return 'Select Religion';
                          return null;
                        },
                      ),
                    ),
                    Gap(width: 12),

                    Expanded(
                      child: CustomDropdownField<String>(
                        labelText: "MARITAL STATUS",
                        hintText: "Marital Status",
                        value: selectedMaritalStatus,
                        items: maritalStatus,
                        onChanged: (selected) {
                          setState(() {
                            selectedMaritalStatus = selected;
                          });
                        },
                        validator: (value) {
                          if (value == null) return 'Select Marital Status';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Gap(height: 60),

                ButtonWidget(
                  config: ButtonConfig(
                    text: "Next",
                    radius: 50.r,
                    height: 54,
                    textColor: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    onPressed: () async {
                      if (email.text.isEmpty ||
                          occupation.text.isEmpty ||
                          selectedEducationLevel == null ||
                          selectedReligion == null ||
                          selectedMaritalStatus == null) {
                        AppUiComponents.triggerNotification(
                          "Please fill all fields",
                          error: true,
                        );
                        return;
                      }
                      PageRouter.pushNamed(
                        Routes.locationDetails,
                        args: LocationDetailsArguments(
                          userId: widget.userId,
                          education: selectedEducationLevel!,
                          email: email.text,
                          occupation: occupation.text,
                          marital: selectedMaritalStatus!,
                          religion: selectedReligion!,
                        ),
                      );
                    },
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
