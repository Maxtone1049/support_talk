import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Betting/widgets/betting_confirm_sheet/betting_confirm_sheet.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/EditField/EditFieldView.dart';
import 'package:wepay/common/EditField/Model/EditFieldConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/Sheets/BottomSheets.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/ui_helper.dart';
// import 'package:wepay/services/Data_Providers/utility_provider.dart';

class BettingView extends ConsumerStatefulWidget {
  final String id;
  const BettingView({super.key, required this.id});

  @override
  ConsumerState<BettingView> createState() => _BettingViewState();
}

class _BettingViewState extends ConsumerState<BettingView> {
  String? selectedProviderId;
  bool isLoading = true;
  final TextEditingController betProvider = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String? _userIdError;
  String? get userIdError => _userIdError;

  @override
  void initState() {
    super.initState();
    userIdController.addListener(_validateUserId);
    userIdController.addListener(_validateUserId);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(utilityProvider.notifier).fetchUtilityProviders(widget.id);
    // });
    _loadSelectedProvider();
  }

  @override
  void dispose() {
    userIdController.removeListener(_validateUserId);
    userIdController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _validateUserId() {
    final text = userIdController.text;
    setState(() {
      if (text.isEmpty) {
        _userIdError = null;
      } else if (text.length < 8) {
        _userIdError = 'Number must be at least 8 digits';
      } else if (text.length > 15) {
        _userIdError = 'Number cannot exceed 15 digits';
      } else if (!RegExp(r'^\d+$').hasMatch(text)) {
        _userIdError = 'Only numbers are allowed';
      } else {
        _userIdError = null;
      }
    });
  }

  // bool get _isFormValid {
  //   return meterController.text.isNotEmpty &&
  //       _meterError == null &&
  //       meterController.text.length >= 8 &&
  //       (amountController.text.isNotEmpty ||
  //           ref.read(utilityProvider).selectedAmount != null);
  // }

  // void _handlePaymentTypeChange(String type) {
  //   setState(() {
  //     _selectedPaymentType = type;
  //     meterController.clear();
  //     _meterError = null;
  //   });
  // }

  /// Load previously selected provider from SharedPreferences
  Future<void> _loadSelectedProvider() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedProviderId = prefs.getString('selected_provider_id');

      if (mounted) {
        setState(() {
          selectedProviderId = savedProviderId;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  final bettingProviders = [
    {"name": "Sporty", "logo": AppImage.sporty},
    {"name": "Bet9ja", "logo": AppImage.bet9ja},
    {"name": "BangBet", "logo": AppImage.bangbet},
    {"name": "Africa365", "logo": AppImage.africa365},
    {"name": "iLotbet", "logo": AppImage.ilotbet},
  ];
  String? imageSet;

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Betting",
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount Selection
              Container(
                decoration: BoxDecoration(
                  color: k181C20,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                  Row(
                                    children: [
                                      GreenBackButton(
                                        onTap: () => PageRouter.pop(),
                                      ),
                                      Gap(width: 12),
                                      Expanded(
                                        child: EditFormField(
                                          config: EditFieldConfig(
                                            radius: 50.r,
                                            filledColor:
                                                AppColors.offshadeprimary,
                                            height: 30,
                                            prefixIconWidget: Icon(
                                              CupertinoIcons.search,
                                              size: 20.sp,
                                              color: AppColors.white.withAlpha(
                                                (0.70 * 225).toInt(),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            label: "Search Provider",
                                            labelStyle: GoogleFonts.inter(
                                              color: AppColors.white.withAlpha(
                                                (0.70 * 225).toInt(),
                                              ),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            onChange: (val) {},
                                          ),
                                        ),
                                      ),
                                    ],
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
                                    itemCount: bettingProviders.length,
                                    itemBuilder: (context, index) {
                                      final provider = bettingProviders[index];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            betProvider.text =
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
                                                  text: provider['name'] ?? '',
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
                      child: Row(
                        children: [
                          ImageView(
                            imageConfig: ImageConfig(
                              imageURL:
                                  imageSet != null && imageSet!.isNotEmpty
                                      ? imageSet.toString()
                                      : AppImage.sporty,
                              imageType: ImageType.asset,
                            ),
                          ),
                          Gap(width: 5),
                          Expanded(
                            child: TextView(
                              config: TextViewConfig(
                                text:
                                    betProvider.text.isNotEmpty
                                        ? betProvider.text
                                        : 'Select Your bookie',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    Gap(height: 20),
                    thinGreenDivider(),
                    Gap(height: 16),
                    TextView(
                      config: TextViewConfig(
                        text: 'User ID',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 4),
                    EditFormField(
                      config: EditFieldConfig(
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                        controller: userIdController,
                        label: "",
                        labelStyle: GoogleFonts.inter(
                          color: AppColors.white.withAlpha(
                            (0.70 * 225).toInt(),
                          ),
                        ),
                        filledColor: AppColors.boxFix,
                        keyboardType: TextInputType.number,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: AppColors.boxFix),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: AppColors.boxFix),
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
                    Gap(height: 16),
                    TextView(
                      config: TextViewConfig(
                        text: 'Select Amount',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 10),
                    GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.6,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        buildAmountTouch("1,000", "1,000"),
                        buildAmountTouch("2,000", "2,000"),
                        buildAmountTouch("3,000", "3,000"),
                        buildAmountTouch("5,000", "5,000"),
                        buildAmountTouch("10,000", "10,000"),
                        buildAmountTouch("20,000", "20,000"),
                      ],
                    ),

                    Gap(height: 16),

                    // Manual Amount Input
                    Row(
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "₦",
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: amountController,
                            style: TextStyle(color: kWhiteColor),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Enter Amount",
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
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                // ref
                                //     .read(utilityProvider.notifier)
                                //     .selectAmount('');
                              }
                            },
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 6.h,
                              horizontal: 32.w,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  amountController.text.isNotEmpty
                                      ? k009721
                                      : kDeactivatedColor,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextView(
                              config: TextViewConfig(
                                text: "Pay ₦ ${amountController.text}",
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                onTap: () {
                                  if (betProvider.text.isEmpty) {
                                    AppUiComponents.triggerNotification(
                                      "Please Select Your Bookie",
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
                                  BottomSheets.showSheet(
                                    context,
                                    child: BettingConfirmSheet(
                                      amount: amountController.text,
                                      tap: () {
                                        PageRouter.pop();
                                        PageRouter.pushNamed(
                                          Routes.thumbPrintScreen,
                                          args: ThumbPrintScreenArguments(
                                            amount: amountController.text,
                                          ),
                                        );
                                      },
                                      accountName: userIdController.text,
                                      meterNumber: betProvider.text,
                                      betImage: imageSet.toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAmountTouch(String displayAmount, String valueAmount) {
    final isSelected = amountController.text == valueAmount.replaceAll(',', '');

    return GestureDetector(
      onTap: () {
        // ref
        //     .read(utilityProvider.notifier)
        //     .selectAmount(valueAmount.replaceAll(',', ''));
        setState(() {
          amountController.text = valueAmount.replaceAll(',', '');
        });
      },
      child: CustomCard(
        // height: MediaQuery.sizeOf(context).height * 0.07,
        width: 114,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        color: isSelected ? kGreen.withOpacity(0.8) : kGreen,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              config: TextViewConfig(
                text: "₦$displayAmount",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            TextView(
              config: TextViewConfig(
                text: "Pay ₦$displayAmount",
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: AppColors.white.withAlpha((0.70 * 225).toInt()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
