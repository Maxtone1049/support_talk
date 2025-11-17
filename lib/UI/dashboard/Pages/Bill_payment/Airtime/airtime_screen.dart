import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_category.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Airtime/widgets/airtime_confirm_sheets.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
import 'package:wepay/UI/dashboard/Pages/Verify_Pin/verify_pin_sheets.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
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
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class AirtimeScreen extends ConsumerStatefulWidget {
  final String id;
  const AirtimeScreen({super.key, required this.id});

  @override
  ConsumerState<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends ConsumerState<AirtimeScreen> {
  final phoneController = TextEditingController();
  final amountController = TextEditingController();
  final networkController = TextEditingController();

  DataCategoryDatum? selectedProvider;
  String? selectedAmount;

  // Top up amounts
  final List<String> topUpAmounts = [
    "50",
    "100",
    "200",
    "500",
    "1,000",
    "2,000",
    "5,000",
    "10,000",
    "20,000",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  final networkProviders = [
    {"name": "9mobile", "logo": AppImage.ninemobile},
    {"name": "MTN", "logo": AppImage.mtn},
    {"name": "Airtel", "logo": AppImage.airtel},
    {"name": "Glo", "logo": AppImage.glo},
  ];
  String? imageSet;
  String idkey = const Uuid().v4();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            showAppBar: true,
            loading: model.isBusy,
            appbarBackgroundColor: AppColors.kTransparent,
            backgroundColor: Color(0xff0C1013),
            appBarTitle: "Airtime",
            appbarTitleColor: AppColors.white,
            centerTitle: false,
            childPadding: EdgeInsets.zero,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: TextView(
                  config: TextViewConfig(
                    text: "History",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary.withAlpha((0.51 * 225).toInt()),
                  ),
                ),
              ),
            ],
            showLeadingWidget: true,
            leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
            fontSize: 18.sp,
            child: PaddedColumn(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                RippleCard(
                  height: 76,
                  color: k181C20,
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      // Network provider dropdown
                      GestureDetector(
                        onTap:
                            () => BottomSheets.showSheet(
                              context,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h,
                                  left: 10.w,
                                  right: 10.w,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                      16.0,
                                ),
                                child: Column(
                                  children: [
                                    GreenBackButton(
                                      onTap: () => PageRouter.pop(),
                                    ),
                                    Gap(height: 10),
                                    thinDivider(),
                                    Gap(height: 10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.h,
                                      ),
                                      itemCount: networkProviders.length,
                                      itemBuilder: (context, index) {
                                        final provider =
                                            networkProviders[index];
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              networkController.text =
                                                  provider['name'] ?? '';
                                              imageSet = provider["logo"] ?? '';
                                            });
                                            PageRouter.pop(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.h,
                                            ),
                                            child: Row(
                                              children: [
                                                ImageView(
                                                  imageConfig: ImageConfig(
                                                    imageURL:
                                                        provider["logo"] ?? '',
                                                    imageType: ImageType.asset,
                                                  ),
                                                ),
                                                Gap(width: 20),
                                                TextView(
                                                  config: TextViewConfig(
                                                    text:
                                                        provider['name'] ?? '',
                                                    fontSize: 14,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        child:
                            imageSet != null && imageSet!.isNotEmpty
                                ? ImageView(
                                  imageConfig: ImageConfig(
                                    imageURL:
                                        imageSet != null && imageSet!.isNotEmpty
                                            ? imageSet.toString()
                                            : AppImage.sporty,
                                    imageType: ImageType.asset,
                                  ),
                                )
                                : Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.white,
                                  size: 20.sp,
                                ),
                      ),
                      Gap(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: '| 0XX XXXX XXXX',
                            hintStyle: GoogleFonts.inter(color: kEBEBEB),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: kEBEBEB),
                        ),
                      ),
                      const CircleAvatar(),
                    ],
                  ),
                ),
                Gap(height: 20),
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
                          text: "Top up",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      Gap(height: 31),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 2.3,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children:
                            topUpAmounts.map((amount) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAmount = amount.replaceAll(',', '');
                                    amountController.text = selectedAmount!;
                                  });
                                },
                                child: CustomCard(
                                  height: height * 0.05,
                                  width: 114,
                                  color:
                                      selectedAmount ==
                                              amount.replaceAll(',', '')
                                          ? kGreen.withAlpha(
                                            (0.8 * 225).toInt(),
                                          )
                                          : kGreen,
                                  borderRadius: BorderRadius.circular(6.r),
                                  child: Center(
                                    child: ResponsiveText.w500("₦$amount"),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
                Gap(height: 10),

                Row(
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "₦",
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: amountController,
                        style: TextStyle(color: kWhiteColor),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          amountController.text = val;
                        },
                        decoration: InputDecoration(
                          labelText: "10.00-5,000,000.00",
                          labelStyle: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.white.withAlpha(
                              (0.70 * 225).toInt(),
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
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
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: GestureDetector(
                        onTap: () {
                          if (phoneController.text.isEmpty) {
                            AppUiComponents.triggerNotification(
                              "Please enter phone number",
                              error: true,
                            );

                            return;
                          }
                          if (amountController.text.isEmpty) {
                            AppUiComponents.triggerNotification(
                              "Please enter amount",
                              error: true,
                            );
                            return;
                          }
                          if (networkController.text.isEmpty) {
                            AppUiComponents.triggerNotification(
                              "Please Select Network Provider",
                              error: true,
                            );
                            return;
                          }
                          BottomSheets.showSheet(
                            context,
                            child: AirtimeConfirmSheet(
                              amount: amountController.text,
                              productName: networkController.text,
                              phoneNo: phoneController.text,
                              tap: () {
                                PageRouter.pop();
                                BottomSheets.showSheet(
                                  context,
                                  child: VerifyPinSheets(
                                    amount: amountController.text,
                                    number: phoneController.text,
                                    idkey: idkey,
                                    transactionType: "airtime",
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 32.w,
                          ),
                          decoration: BoxDecoration(
                            color:
                                phoneController.text.isNotEmpty &&
                                        amountController.text.isNotEmpty
                                    ? AppColors.primary
                                    : AppColors.primary.withAlpha(
                                      (0.30 * 225).toInt(),
                                    ),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextView(
                            config: TextViewConfig(
                              text: "Pay ₦ ${amountController.text}",
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
