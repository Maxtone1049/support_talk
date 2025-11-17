import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:wepay/UI/dashboard/Pages/Verify_Pin/verify_pin_sheets.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
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
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/custom%20widgets/naira_sign.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/responsive_sized_box.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class PreviewTransferScreen extends StatefulWidget {
  const PreviewTransferScreen({
    super.key,
    required this.accountNo,
    required this.accountName,
    required this.bankName,
  });
  final String accountNo, accountName, bankName;

  @override
  State<PreviewTransferScreen> createState() => _PreviewTransferScreenState();
}

class _PreviewTransferScreenState extends State<PreviewTransferScreen> {
  final TextEditingController amountController = TextEditingController();
  String idkey = const Uuid().v4();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
              verticalSpaceCustom(20),
              RippleCard(
                color: k181C20,
                borderRadius: BorderRadius.circular(10),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveSizedBox(
                      height: 48,
                      width: 48,
                      child: Center(
                        child: ImageView(
                          imageConfig: ImageConfig(
                            imageURL: AppImage.palmpay,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpaceCustom(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            config: TextViewConfig(
                              text: widget.accountName,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          Row(
                            children: [
                              TextView(
                                config: TextViewConfig(
                                  text: widget.accountNo,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                              horizontalSpaceSmall,
                              TextView(
                                config: TextViewConfig(
                                  text: widget.bankName,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceCustom(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: k181C20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Amount",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 16),
                    ResponsiveSizedBox(
                      width: width * 0.8,
                      child: Row(
                        children: [
                          TextView(
                            config: TextViewConfig(
                              text: "₦",
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: kWhiteColor),
                              keyboardType: TextInputType.number,
                              controller: amountController,
                              decoration: InputDecoration(
                                labelText: "10.00-5,000,000.00",
                                contentPadding: EdgeInsets.zero,
                                labelStyle: GoogleFonts.inter(fontSize: 24),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 10,
                                  borderRadius: k5pxBorderRadius,
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 10,
                                  borderRadius: k5pxBorderRadius,
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.transparent,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  gapPadding: 10,
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
                    ),
                    thinDivider(),
                    verticalSpaceSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦500.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦1000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦2000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦3000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Remark",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 16),
                    TextField(
                      style: TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        labelText: "What's this payment for? (Optional)",
                        labelStyle: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
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
              Gap(height: 120),
              ButtonWidget(
                config: ButtonConfig(
                  text:
                      amountController.text.isNotEmpty
                          ? "Confirm ₦${amountController.text}"
                          : "Confirm",
                  onPressed: () {
                    BottomSheets.showSheet(
                      context,
                      child: TransferBottomSheet(
                        amount: amountController.text,
                        bankName: widget.bankName,
                        accountName: widget.accountName,
                        accountNo: widget.accountNo,
                        fee: '100',
                        onTap: () {
                          BottomSheets.showSheet(
                            context,
                            child: VerifyPinSheets(
                              transactionType: "bankTransfer",
                              amount: amountController.text,
                              idkey: idkey,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  buttonColor: AppColors.primary,
                  height: 54,
                  radius: 50.r,
                  textColor:
                      amountController.text.isNotEmpty
                          ? AppColors.white
                          : AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpaceCustom(40),
            ],
          ),
        ),
      ),
    );
  }
}

class TransferBottomSheet extends StatelessWidget {
  const TransferBottomSheet({
    super.key,
    required this.amount,
    required this.bankName,
    required this.accountName,
    required this.accountNo,
    required this.fee,
    this.onTap,
  });
  final String amount, bankName, accountName, accountNo, fee;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: CustomCard(
        borderRadius: k20pxSheetRadius,
        padding: kMainPadding,
        color: AppColors.kcDarkGreenColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceCustom(10),
            Center(child: bottomSheetHeader),
            verticalSpaceCustom(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.offshadeprimary,
                    ),
                    child: ResponsiveIcon(Icons.close, color: kWhiteColor),
                  ),
                ),
              ],
            ),
            Gap(height: 16),
            Center(
              child: NairaSignWidget(
                price: int.tryParse(amount),
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            Gap(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Bank Name",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: bankName,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Account Number",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: accountNo,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Name",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: accountName,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextView(
                        config: TextViewConfig(
                          text: "Amount",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: NairaSignWidget(
                          price: int.tryParse(amount),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Transaction Fee",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    NairaSignWidget(
                      price: int.tryParse(fee),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(height: 20),
            ButtonWidget(
              config: ButtonConfig(
                text: 'Confirm',
                onPressed: onTap,
                radius: 50.r,
                height: 54,
                textColor: AppColors.white,
                fontSize: 18.sp,
              ),
            ),
            verticalSpaceCustom(40),
          ],
        ),
      ),
    );
  }
}
