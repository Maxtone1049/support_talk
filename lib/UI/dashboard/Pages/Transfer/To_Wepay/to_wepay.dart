import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
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
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
// import 'package:wepay/custom/custom_textfield.dart';
import 'package:wepay/custom/responsive_sized_box.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class ToWepayScreen extends StatefulWidget {
  const ToWepayScreen({super.key});

  @override
  State<ToWepayScreen> createState() => _ToWepayScreenState();
}

class _ToWepayScreenState extends State<ToWepayScreen> {
  int _selectedTabIndex = 0;
  final wepayAccountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            showAppBar: true,
            appbarBackgroundColor: AppColors.kTransparent,
            backgroundColor: AppColors.kBackgroundColor,
            appBarTitle: "Transfer to WePay Account",
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
            leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
            fontSize: 14.sp,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: kDeactivatedColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 12.w,
                    ),
                    child: Row(
                      children: [
                        ImageView(
                          imageConfig: ImageConfig(
                            imageURL: AppImage.nairaicon,
                            imageType: ImageType.svg,
                          ),
                        ),
                        Gap(width: 8),
                        TextView(
                          config: TextViewConfig(
                            text: "Free Transfers",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: k181C20,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "Recipient Account",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        verticalSpaceSmall,
                        // CustomTextField.bordered(
                        //   keyboardType: TextInputType.number,
                        //   controller: wepayAccountController,
                        //   hintText: 'Wepay Account no.',
                        // ),
                        EditFormField(
                          config: EditFieldConfig(
                            controller: wepayAccountController,
                            keyboardType: TextInputType.number,
                            onChange: (value) {
                              wepayAccountController.text = value;
                              print(wepayAccountController.text);
                            },
                            label: "Wepay Account No.",
                            labelStyle: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                            filledColor: AppColors.kcDarkGreenColor,
                          ),
                        ),
                        Gap(height: 16),
                        // Visibility(
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           ImageView(
                        //             imageConfig: ImageConfig(
                        //               imageURL: AppImage.wepayload,
                        //               imageType: ImageType.asset,
                        //               height: 24.h,
                        //             ),
                        //           ),
                        //           Gap(width: 8),
                        //           TextView(
                        //             config: TextViewConfig(
                        //               text: "WePay",
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w400,
                        //               color: AppColors.primary,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Gap(height: 16),
                        //       Container(
                        //         decoration: BoxDecoration(
                        //           color: kDeactivatedColor,
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         padding: EdgeInsets.all(12.r),
                        //         child: Row(
                        //           children: [
                        //             ImageView(
                        //               imageConfig: ImageConfig(
                        //                 imageURL: AppImage.doneicon,
                        //                 imageType: ImageType.asset,
                        //               ),
                        //             ),
                        //             Gap(width: 8),
                        //             Expanded(
                        //               child: TextView(
                        //                 config: TextViewConfig(
                        //                   text: "ANTHONY ANTHONY MAXWELL",
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.w400,
                        //                   color: AppColors.primary,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Gap(height: 16),
                        ButtonWidget(
                          config: ButtonConfig(
                            text: "Next",
                            onPressed: () {
                              if (wepayAccountController.text.length == 10) {
                                PageRouter.pushNamed(
                                  Routes.previewScreen,
                                  args: PreviewScreenArguments(
                                    accountnumber: wepayAccountController.text,
                                  ),
                                );
                              } else {
                                AppUiComponents.triggerNotification(
                                  "Please enter a valid WePay account number",
                                  error: true,
                                );
                              }
                            },
                            buttonColor: AppColors.primary,
                            buttonOutlinedColor: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.white,
                            height: 54,
                            radius: 50.r,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          title: 'Recent',
                          isSelected: _selectedTabIndex == 0,
                          onTap: () => setState(() => _selectedTabIndex = 0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTabButton(
                          title: 'Favorites',
                          isSelected: _selectedTabIndex == 1,
                          onTap: () => setState(() => _selectedTabIndex = 1),
                        ),
                      ),
                    ],
                  ),
                  Gap(height: 15),
                  if (_selectedTabIndex == 0)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return _buildReferralItem();
                      },
                    ),
                  if (_selectedTabIndex == 1)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _buildReferralItem();
                      },
                    ),
                  Gap(height: 16),
                  Center(
                    child: Container(
                      width: width * 0.5,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: AppColors.offshadeprimary,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            config: TextViewConfig(
                              text: "View All",
                              color: AppColors.white.withAlpha(
                                (0.70 * 225).toInt(),
                              ),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: AppColors.white.withAlpha(
                              (0.70 * 225).toInt(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? kPrimaryColor : Colors.transparent,
              width: 2.w,
            ),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: TextView(
            config: TextViewConfig(
              text: title,
              color:
                  isSelected
                      ? AppColors.white
                      : AppColors.white.withAlpha((0.70 * 225).toInt()),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReferralItem() {
    return Column(
      children: [
        RippleCard(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          color: k181C20,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveSizedBox(
                height: 48,
                width: 48,
                child: Center(
                  child: ImageView(
                    imageConfig: ImageConfig(
                      imageURL: AppImage.userProfile,
                      imageType: ImageType.svg,
                    ),
                  ),
                ),
              ),
              Gap(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: 'UKEME FRIDAY UROM',
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(height: 4),
                  TextView(
                    config: TextViewConfig(
                      text: '306 130 6461',
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
