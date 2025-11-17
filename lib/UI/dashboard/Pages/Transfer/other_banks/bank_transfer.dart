import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
// import 'package:wepay/custom/custom_card.dart';
// import 'package:wepay/custom/image_card.dart';
// import 'package:wepay/custom/responsive_sized_box.dart';
// import 'package:wepay/custom/responsive_text.dart';
// import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  // int _selectedTabIndex = 0;
  final TextEditingController accountNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;
    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Transfer to Bank Account",
        appbarTitleColor: AppColors.white,
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TextView(
              config: TextViewConfig(
                text: "History",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.51 * 225).toInt()),
              ),
            ),
          ),
        ],
        showLeadingWidget: true,
        childPadding: EdgeInsets.zero,
        leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
        fontSize: 14.sp,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height: 24),
              TextView(
                config: TextViewConfig(
                  text: "Recipient Account",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              Gap(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: k181C20,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: accountNumber,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                        LengthLimitingTextInputFormatter(10),
                      ],
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter 10 digits Account Number',
                        hintStyle: GoogleFonts.inter(
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    thinGreenDivider(),
                    Gap(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "Select Bank",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white.withAlpha(
                              (0.50 * 225).toInt(),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpaceCustom(30),
              Center(
                child: ButtonWidget(
                  config: ButtonConfig(
                    width: 222,
                    radius: 50.r,
                    height: 54,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    textColor:
                        accountNumber.text.isNotEmpty
                            ? AppColors.white
                            : AppColors.black,
                    text: 'Next',
                    enabled: accountNumber.text != '',
                    buttonColor:
                        accountNumber.text.isNotEmpty
                            ? AppColors.primary
                            : AppColors.primary.withAlpha((0.30 * 225).toInt()),
                    buttonOutlinedColor: AppColors.kTransparent,
                    onPressed: () {
                      PageRouter.pushNamed(
                        Routes.previewTransferScreen,
                        args: PreviewTransferScreenArguments(
                          accountNo: accountNumber.text,
                          accountName: "Primte Tech",
                          bankName: "Opay",
                        ),
                      );
                    },
                  ),
                ),
              ),
              verticalSpaceCustom(40),
              Container(
                decoration: BoxDecoration(
                  color: k181C20,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
                child: Row(
                  children: [
                    ImageView(
                      imageConfig: ImageConfig(
                        imageURL: AppImage.rate,
                        imageType: ImageType.svg,
                      ),
                    ),
                    Gap(width: 8),
                    Expanded(
                      child: TextView(
                        config: TextViewConfig(
                          text: "Bank transfer success rate tracker",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Gap(height:20),
              // Row(
              //   children: [
              //     Expanded(
              //       child: _buildTabButton(
              //         title: 'Recent',
              //         isSelected: _selectedTabIndex == 0,
              //         onTap: () => setState(() => _selectedTabIndex = 0),
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Expanded(
              //       child: _buildTabButton(
              //         title: 'Favorites',
              //         isSelected: _selectedTabIndex == 1,
              //         onTap: () => setState(() => _selectedTabIndex = 1),
              //       ),
              //     ),
              //   ],
              // ),
              // verticalSpaceCustom(15),
              // if (_selectedTabIndex == 0)
              //   Expanded(
              //     child: ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (context, index) {
              //         return _buildReferralItem(onTap: () {});
              //       },
              //     ),
              //   ),
              // if (_selectedTabIndex == 1)
              //   Expanded(
              //     child: ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (context, index) {
              //         return _buildReferralItem(onTap: () {});
              //       },
              //     ),
              //   ),
              // Center(
              //   child: ResponsiveSizedBox(
              //     width: width * 0.5,
              //     child: RoundedButton(
              //       text: 'View All',
              //       textColor: kWhiteColor,
              //       color: kGreen,
              //     ),
              //   ),
              // ),
              // verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTabButton({
  //   required String title,
  //   required bool isSelected,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: CustomCard(
  //       padding: const EdgeInsets.symmetric(vertical: 12),
  //       color: isSelected ? kPrimaryColor : Colors.transparent,
  //       borderRadius: BorderRadius.circular(6),
  //       child: Center(
  //         child: ResponsiveText(
  //           title,
  //           color: isSelected ? Colors.white : Colors.grey,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildReferralItem({
  //   //required String title,
  //   //required String image,
  //   required VoidCallback onTap,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     child: Column(
  //       children: [
  //         RippleCard(
  //           color: k181C20,
  //           borderRadius: BorderRadius.circular(10),

  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               const ResponsiveSizedBox(
  //                 height: 48,
  //                 width: 48,
  //                 child: Center(child: ImageCard.local("palmpay.png")),
  //               ),
  //               horizontalSpaceCustom(12),
  //               const Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ResponsiveText.w400('UKEME FRIDAY UROM', fontSize: 14),
  //                     Row(
  //                       children: [
  //                         ResponsiveText.w300('306 130 6461', fontSize: 12),
  //                         horizontalSpaceSmall,
  //                         ResponsiveText.w300('Palmpay', fontSize: 10),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         thinDivider(),
  //       ],
  //     ),
  //   );
  // }
}
