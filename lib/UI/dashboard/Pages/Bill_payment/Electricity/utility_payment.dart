import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/electricity_confirm_sheet.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/meter_input.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/payment_type_toggle.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Sheets/BottomSheets.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';
import 'package:wepay/services/Data_Providers/utility_provider.dart';

class UtilityPayment extends ConsumerStatefulWidget {
  final String id;
  const UtilityPayment({super.key, required this.id});

  @override
  ConsumerState<UtilityPayment> createState() => _UtilityPaymentState();
}

class _UtilityPaymentState extends ConsumerState<UtilityPayment> {
  String? selectedProviderId;
  bool isLoading = true;
  final TextEditingController meterController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String selectedPaymentType = 'Prepaid';

  String? _meterError;

  @override
  void initState() {
    super.initState();
    meterController.addListener(_validateMeterNumber);
    meterController.addListener(_validateMeterNumber);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(utilityProvider.notifier).fetchUtilityProviders(widget.id);
    });
    _loadSelectedProvider();
  }

  @override
  void dispose() {
    meterController.removeListener(_validateMeterNumber);
    meterController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _validateMeterNumber() {
    final text = meterController.text;
    setState(() {
      if (text.isEmpty) {
        _meterError = null;
      } else if (text.length < 8) {
        _meterError = 'Number must be at least 8 digits';
      } else if (text.length > 15) {
        _meterError = 'Number cannot exceed 15 digits';
      } else if (!RegExp(r'^\d+$').hasMatch(text)) {
        _meterError = 'Only numbers are allowed';
      } else {
        _meterError = null;
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

  /// Save selected provider to SharedPreferences
  // Future<void> _saveSelectedProvider(String providerId) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('selected_provider_id', providerId);

  //     // Also save provider details for easy access
  //     final provider = electricityProviders.firstWhere(
  //       (p) => p['id'] == providerId,
  //     );
  //     await prefs.setString(
  //       'selected_provider_name',
  //       provider['name'] as String,
  //     );
  //     await prefs.setString(
  //       'selected_provider_short_name',
  //       provider['shortName'] as String,
  //     );
  //     await prefs.setString(
  //       'selected_provider_logo',
  //       provider['logoUrl'] as String,
  //     );
  //   } catch (e) {
  //     // Handle error silently
  //   }
  // }

  /// Handle provider selection
  // void _onProviderSelected(String providerId) {
  //   setState(() {
  //     _selectedProviderId = providerId;
  //   });
  //   _saveSelectedProvider(providerId);
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(utilityProvider);

    if (state.selectedAmount != null && amountController.text.isEmpty) {
      amountController.text = state.selectedAmount!;
    }

    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Electricity",
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
                onTap: () => PageRouter.pushNamed(Routes.electricityHistory),
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
              // Provider Selection Card
              GestureDetector(
                onTap: () => _showProviderBottomSheet(),
                child: ListTile(
                  leading:
                      state.selectedProvider?.logoUrl != null
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(
                              state.selectedProvider!.logoUrl!,
                            ),
                          )
                          : const CircleAvatar(
                            child: Icon(Icons.electrical_services),
                          ),
                  title: TextView(
                    config: TextViewConfig(
                      text: state.selectedProvider?.name ?? 'Select Provider',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  trailing: const ResponsiveIcon(Icons.arrow_forward_ios),
                ),
              ),
              Gap(height: 10),

              // Payment Type Toggle
              PaymentTypeToggle(
                selectedType: state.paymentType,
                onTypeChanged: (type) {
                  ref.read(utilityProvider.notifier).setPaymentType(type);
                  meterController.clear();
                  _meterError = null;
                },
              ),
              Gap(height: 20),

              // Meter Input Field
              MeterInputField(
                controller: meterController,
                paymentType: state.paymentType,
                errorText: _meterError,
                onChanged: (_) => _validateMeterNumber(),
                onTap:
                    () => PageRouter.pushNamed(Routes.electricityBenefeciary),
              ),
              Gap(height: 16),

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
                    TextView(
                      config: TextViewConfig(
                        text: state.selectedProvider?.name ?? 'Select Amount',
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
                        _buildAmountCard("1,000", "1,000"),
                        _buildAmountCard("2,000", "2,000"),
                        _buildAmountCard("3,000", "3,000"),
                        _buildAmountCard("5,000", "5,000"),
                        _buildAmountCard("10,000", "10,000"),
                        _buildAmountCard("20,000", "20,000"),
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
                                ref
                                    .read(utilityProvider.notifier)
                                    .selectAmount('');
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
                                  if (meterController.text.isEmpty) {
                                    AppUiComponents.triggerNotification(
                                      "Please enter Meter number",
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
                                    child: ElectricityConfirmSheet(
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
                                      accountName: 'Nwokoro Cletus',
                                      meterNumber: meterController.text,
                                      transFee: '100',
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

  Widget _buildAmountCard(String displayAmount, String valueAmount) {
    final isSelected =
        ref.watch(utilityProvider).selectedAmount ==
        valueAmount.replaceAll(',', '');

    return GestureDetector(
      onTap: () {
        ref
            .read(utilityProvider.notifier)
            .selectAmount(valueAmount.replaceAll(',', ''));
        amountController.text = valueAmount.replaceAll(',', '');
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

  void _showProviderBottomSheet() {
    final state = ref.read(utilityProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          children: [
            Row(
              children: [
                GreyCloseButton(),
                const ResponsiveText("Select Provider"),
              ],
            ),
            verticalSpaceCustom(10),
            thinDivider(),
            verticalSpaceCustom(10),
            Expanded(
              child:
                  state.isLoading
                      ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                      : ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        itemCount: state.providers.length,
                        itemBuilder: (context, index) {
                          final provider = state.providers[index];
                          return ListTile(
                            leading:
                                provider.logoUrl != null
                                    ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        provider.logoUrl!,
                                      ),
                                    )
                                    : const CircleAvatar(
                                      child: Icon(Icons.electrical_services),
                                    ),
                            title: Text(provider.name ?? ''),
                            trailing:
                                state.selectedProvider?.id == provider.id
                                    ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                    : null,
                            onTap: () {
                              ref
                                  .read(utilityProvider.notifier)
                                  .selectProvider(provider);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
            ),
          ],
        );
      },
    );
  }
}
