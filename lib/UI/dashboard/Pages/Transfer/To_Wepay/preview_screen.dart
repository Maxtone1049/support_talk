import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
import 'package:wepay/UI/dashboard/Pages/Verify_Pin/verify_pin_sheets.dart';
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
import 'package:wepay/common/Sheets/BottomSheets.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({
    super.key,
    required this.accountnumber,
    this.accountName,
  });
  final String accountnumber;
  final String? accountName;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final amountController = TextEditingController();
  String idkey = const Uuid().v4();
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) {},
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            loading: model.isBusy,
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
                    text: "Records",
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
                children: [
                  Gap(height: 20),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: k181C20,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ImageView(
                            imageConfig: ImageConfig(
                              imageURL: AppImage.wepayload,
                              imageType: ImageType.asset,
                              height: 48,
                            ),
                          ),
                        ),
                        Gap(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              config: TextViewConfig(
                                text: widget.accountName ?? "WEPAY USER",
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(height: 4),
                            TextView(
                              config: TextViewConfig(
                                text: widget.accountnumber,
                                color: AppColors.white.withAlpha(
                                  (0.70 * 225).toInt(),
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: k181C20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextView(
                              config: TextViewConfig(
                                text: 'Amount',
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Gap(width: 16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.thickGreen,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: TextView(
                                config: TextViewConfig(
                                  text: 'No Charges',
                                  color: AppColors.primary.withAlpha(
                                    (0.51 * 225).toInt(),
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(height: 17),
                        Row(
                          children: [
                            TextView(
                              config: TextViewConfig(
                                text: '₦ |',
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: TextField(
                                style: TextStyle(color: kWhiteColor),
                                keyboardType: TextInputType.number,
                                controller: amountController,
                                decoration: InputDecoration(
                                  labelText: "10.00-5,000,000.00",
                                  labelStyle: GoogleFonts.inter(
                                    color: AppColors.white.withAlpha(
                                      (0.70 * 225).toInt(),
                                    ),
                                    fontSize: 18,
                                  ),
                                  // contentPadding: EdgeInsets.all(10),
                                  // contentPadding: edgeInsetsOnlyResponsive(
                                  //   bottom: (40) / 2,
                                  //   left: 12,
                                  //   right: 12,
                                  //   top: 20,
                                  // ),
                                  focusedBorder: OutlineInputBorder(
                                    // gapPadding: 10,
                                    borderRadius: k5pxBorderRadius,
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // gapPadding: 10,
                                    borderRadius: k5pxBorderRadius,
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    // gapPadding: 10,
                                    borderRadius: k5pxBorderRadius,
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        thinDivider(),
                        Gap(height: 19),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RippleCard(
                                borderRadius: BorderRadius.circular(20),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 12.w,
                                ),
                                color: k181C20,
                                border: Border.all(
                                  color: AppColors.borderColorone,
                                  width: 1.w,
                                ),
                                child: Center(
                                  child: TextView(
                                    config: TextViewConfig(
                                      text: "₦ 500.00",
                                      fontSize: 14,
                                      color: AppColors.white.withAlpha(
                                        (0.70 * 225).toInt(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(width: 8),
                              RippleCard(
                                borderRadius: BorderRadius.circular(20),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 12.w,
                                ),
                                color: k181C20,
                                border: Border.all(
                                  color: AppColors.borderColorone,
                                  width: 1.w,
                                ),
                                child: Center(
                                  child: TextView(
                                    config: TextViewConfig(
                                      text: "₦ 1000.00",
                                      fontSize: 14,
                                      color: AppColors.white.withAlpha(
                                        (0.70 * 225).toInt(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(width: 8),
                              RippleCard(
                                borderRadius: BorderRadius.circular(20),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 12.w,
                                ),
                                color: k181C20,
                                border: Border.all(
                                  color: AppColors.borderColorone,
                                  width: 1.w,
                                ),
                                child: Center(
                                  child: TextView(
                                    config: TextViewConfig(
                                      text: "₦ 2000.00",
                                      fontSize: 14,
                                      color: AppColors.white.withAlpha(
                                        (0.70 * 225).toInt(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(width: 8),
                              RippleCard(
                                borderRadius: BorderRadius.circular(20),
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 12.w,
                                ),
                                color: k181C20,
                                border: Border.all(
                                  color: AppColors.borderColorone,
                                  width: 1.w,
                                ),
                                child: Center(
                                  child: TextView(
                                    config: TextViewConfig(
                                      text: "₦ 3000.00",
                                      fontSize: 14,
                                      color: AppColors.white.withAlpha(
                                        (0.70 * 225).toInt(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: k181C20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "Remark",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        Gap(height: 16),
                        TextField(
                          style: TextStyle(color: kWhiteColor),
                          decoration: InputDecoration(
                            labelText: "What's this payment for? (Optional)",
                            labelStyle: GoogleFonts.inter(fontSize: 12),
                            // contentPadding: EdgeInsets.all(10),
                            // contentPadding: edgeInsetsOnlyResponsive(
                            //   bottom: (40) / 2,
                            //   left: 12,
                            //   right: 12,
                            //   top: 20,
                            // ),
                            focusedBorder: OutlineInputBorder(
                              // gapPadding: 10,
                              borderRadius: k5pxBorderRadius,
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // gapPadding: 10,
                              borderRadius: k5pxBorderRadius,
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.transparent,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              // gapPadding: 10,
                              borderRadius: k5pxBorderRadius,
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        thinDivider(),
                      ],
                    ),
                  ),
                  Gap(height: 67),
                  ButtonWidget(
                    config: ButtonConfig(
                      text: "Confirm",
                      onPressed: () {
                        if (amountController.text.isNotEmpty) {
                          if (int.tryParse(amountController.text)! <
                              model.availableBalance) {
                            BottomSheets.showSheet(
                              context,
                              child: VerifyPinSheets(
                                amount: amountController.text,
                                recieveNo: widget.accountnumber,
                                idkey: idkey,
                                transactionType: "wepayTransfer",
                              ),
                            );
                          } else {
                            AppUiComponents.triggerNotification(
                              "Insufficient Funds, Please Fund Your Account",
                              error: true,
                            );
                          }
                        } else {
                          AppUiComponents.triggerNotification(
                            "Input an Amount",
                            error: true,
                          );
                        }
                        // PageRouter.pushNamed(
                        //   Routes.thumbPrintScreen,
                        //   args: ThumbPrintScreenArguments(
                        //     amount: amountController.text,
                        //   ),
                        // );
                      },
                      fontSize: 16.sp,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w500,
                      radius: 50.r,
                      height: 54,
                    ),
                  ),
                  // RoundedButton(
                  //   text: "Confirm",
                  //   onPressed: () {

                  //   },
                  // ),
                  verticalSpaceCustom(40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
