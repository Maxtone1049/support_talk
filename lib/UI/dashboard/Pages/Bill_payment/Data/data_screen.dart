import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_category.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_model.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Data/widgets/data_confirm_sheet.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Data/widgets/hot_deal_widget.dart';
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
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/Loader/custom_loader.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/services/Data_Providers/data_plan_provider.dart';
import 'package:wepay/services/Data_Providers/service_category_provider.dart';
import 'package:wepay/services/network/api.dart';

class DataScreen extends ConsumerStatefulWidget {
  final String id;
  const DataScreen({super.key, required this.id});

  @override
  ConsumerState<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends ConsumerState<DataScreen> {
  List<DataPlan> dataPlans = [];
  bool isLoading = false;
  final phoneController = TextEditingController();
  final amountController = TextEditingController();
  DataCategoryDatum? selectedProvider;

  @override
  void initState() {
    super.initState();
    if (selectedProvider?.id != null) {
      _fetchDataPlans(selectedProvider!.id);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(airtimeServiceProvider.notifier)
          .fetchServiceCategories(widget.id);
    });
  }

  Future<void> _fetchDataPlans(var providerId) async {
    setState(() => isLoading = true);

    try {
      // Replace this with your actual API call
      final response = await Api().getRequest2(
        "/getServiceCategoryProduct/$providerId",
      ); // http.get(Uri.parse('your_api_endpoint'));
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      final planResponse = DataPlanResponse.fromJson(data);

      setState(() {
        dataPlans = planResponse.data!;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      AppUiComponents.triggerNotification(
        "Error fetching data plans",
        error: true,
      );
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final networkState = ref.watch(airtimeServiceProvider);
    final dataPlanState = ref.watch(dataPlanProvider);

    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: Color(0xff0C1013),
        appBarTitle: "Mobile Data",
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Gap(height: 20),
              RippleCard(
                color: k181C20,
                borderRadius: BorderRadius.circular(10),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Row(
                  children: [
                    // ResponsiveSizedBox(
                    //   child: DropdownButton<DataCategoryDatum>(
                    //     value:
                    //         selectedProvider ??
                    //         networkState.networkProviders.first,
                    //     underline: const SizedBox(),
                    //     icon: const Icon(Icons.arrow_drop_down),
                    //     alignment: Alignment.centerLeft,
                    //     dropdownColor: AppColors.borderColor,
                    //     items:
                    //         networkState.networkProviders.map((provider) {
                    //           return DropdownMenuItem<DataCategoryDatum>(
                    //             value: provider,
                    //             child: Row(
                    //               children: [
                    //                 if (provider.logoUrl != null)
                    //                   Image.network(
                    //                     provider.logoUrl!,
                    //                     width: 40,
                    //                     height: 40,
                    //                     errorBuilder:
                    //                         (context, error, stackTrace) =>
                    //                             const Icon(
                    //                               Icons.signal_cellular_alt,
                    //                             ),
                    //                   )
                    //                 else
                    //                   const Icon(Icons.signal_cellular_alt),
                    //                 const SizedBox(width: 8),
                    //                 ResponsiveText(provider.name ?? ''),
                    //               ],
                    //             ),
                    //           );
                    //         }).toList(),
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         selectedProvider = newValue;
                    //       });
                    //       ref
                    //           .read(dataPlanProvider.notifier)
                    //           .fetchDataPlans(newValue!.id!);
                    //     },
                    //   ),
                    // ),
                    Row(
                      children: [
                        ImageView(
                          imageConfig: ImageConfig(
                            imageURL: AppImage.airtel,
                            imageType: ImageType.asset,
                            height: 40.h,
                          ),
                        ),
                        Gap(width: 8),
                        ImageView(
                          imageConfig: ImageConfig(
                            imageURL: AppImage.polygon,
                            imageType: ImageType.svg,
                          ),
                        ),
                      ],
                    ),
                    Gap(width: 8),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: '| 0XX XXXX XXXX',
                          hintStyle: GoogleFonts.inter(
                            color: kEBEBEB,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.inter(
                          color: kEBEBEB,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    const CircleAvatar(),
                  ],
                ),
              ),
              Gap(height: 20),
              // Data Plans Section
              // if (dataPlanState.isLoading)
              //   const Center(child: CircularProgressIndicator())
              // else if (dataPlanState.error != null)
              //   Center(child: Text(dataPlanState.error!))
              // else if (dataPlanState.dataPlans.isNotEmpty)
              //   HotDealsWidget(
              //     dataPlans: dataPlanState.dataPlans,
              //     onPlanSelected: (plan) {
              //       ref.read(dataPlanProvider.notifier).state = dataPlanState
              //           .copyWith(selectedPlan: plan);
              //     },
              //   )
              // else
              //   const Center(child: Text('No data plans available')),
              HotDealsWidget(
                dataPlans: dataPlanState.dataPlans,
                onPlanSelected: (plan) {
                  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                  ref.read(dataPlanProvider.notifier).state = dataPlanState
                      .copyWith(selectedPlan: plan);
                },
              ),
              Gap(height: 20),
              ButtonWidget(
                config: ButtonConfig(
                  text: "Confirm",
                  onPressed: () {
                    if (phoneController.text.isEmpty) {
                      AppUiComponents.triggerNotification(
                        "Please enter phone number",
                        error: true,
                      );
                      return;
                    }
                    BottomSheets.showSheet(
                      context,
                      child: DataConfirmSheet(
                        phoneController: phoneController,
                        amount: '100000',
                      ),
                    );
                  },
                  enabled: phoneController.text.isNotEmpty,
                  buttonOutlinedColor: AppColors.kTransparent,
                  buttonColor:
                      phoneController.text.isNotEmpty
                          ? AppColors.primary
                          : AppColors.primary.withAlpha((0.30 * 225).toInt()),
                  radius: 50.r,
                  height: 54,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  textColor:
                      phoneController.text.isNotEmpty
                          ? AppColors.white
                          : AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buyMobileData(DataPlan plan) async {
    LoaderManager.showLoader(context);
    try {
      var data = {
        "amount": plan.amount,
        "serviceCategoryId": selectedProvider?.id,
        "bundleCode": plan.bundleCode,
        "debitAccountNumber":
            "0110324148", // Replace with actual account number
        "phoneNumber": phoneController.text,
      };

      final response = await Api().postRequest2(data, "/BuyData");
      final responseBody = await response.stream.bytesToString();
      final body = jsonDecode(responseBody);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        LoaderManager.hideLoader();
        PageRouter.pushNamed(Routes.successTansactionScreen);
      } else {
        LoaderManager.hideLoader();
        AppUiComponents.triggerNotification(
          body['message'] ?? "Error occurred, please try again.",
          error: true,
        );
      }
    } catch (e) {
      LoaderManager.hideLoader();
      AppUiComponents.triggerNotification(
        "An error occurred: ${e.toString()}",
        error: true,
      );
    }
  }
}

/**
 * PaddedColumn(
                padding: kMainPadding,
                children: [
                  RippleCard(
                    height: 76,
                    color: k181C20,
                    borderRadius: BorderRadius.circular(10),
                    //padding: kMainPadding,
                    child: Row(
                      children: [
                        // Network provider dropdown
                        ResponsiveSizedBox(
                          // width: 60,
                          child: DropdownButton<dynamic>(
                            value:
                                selectedProvider ??
                                networkState.networkProviders.first,
                            underline:
                                const SizedBox(), // Remove default underline
                            icon: const Icon(Icons.arrow_drop_down),
                            //padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            items:
                                networkState.networkProviders.map((provider) {
                                  return DropdownMenuItem<DataCategoryDatum>(
                                    value: provider,
                                    child: Row(
                                      children: [
                                        if (provider.logoUrl != null)
                                          Image.network(
                                            provider.logoUrl!,
                                            width: 40,
                                            height: 40,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(
                                                      Icons.signal_cellular_alt,
                                                    ),
                                          )
                                        else
                                          const Icon(Icons.signal_cellular_alt),
                                        const SizedBox(width: 8),
                                        ResponsiveText(provider.name ?? ''),
                                      ],
                                    ),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedProvider = newValue;
                              });
                              _fetchDataPlans(selectedProvider!.id);
                            },
                          ),
                        ),
                        //const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: '0XX XXXX XXXX',
                              hintStyle: TextStyle(color: kEBEBEB),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: kEBEBEB),
                          ),
                        ),
                        CircleAvatar(),
                      ],
                    ),
                  ),
                  verticalSpaceCustom(20),

                  //TODO hot deals widget will be here
                  if (isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (dataPlans.isNotEmpty)
                    HotDealsWidget(dataPlans: dataPlans)
                  else
                    const Center(child: Text('No data plans available')),
                  verticalSpaceCustom(20),
                  RoundedButton(
                    text: "Confirm",
                    onPressed: () {
                      _showPreviewDataSheet();
                    },
                  ),
                ],
              ),

              // 
              void _showPreviewDataSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CustomCard(
            borderRadius: k20pxSheetRadius,
            padding: kMainPadding,
            color: kGreen.withOpacity(0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceCustom(10),
                Center(child: bottomSheetHeader),
                verticalSpaceCustom(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RippleCard(
                      size: 30,
                      border: k1pxBorder,
                      borderRadius: BorderRadius.circular(40),
                      onTap: () => Navigator.pop(context),
                      color: kGreen,
                      child: Center(
                        child: ResponsiveIcon(Icons.close, color: kWhiteColor),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                verticalSpaceCustom(16),
                Center(child: ResponsiveText.w500("N1,000.00", fontSize: 32)),
                verticalSpaceTiny,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveText('Product'),
                        ResponsiveText('Mobile Data'),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveText('Recipient Phone'),
                        ResponsiveText('306 130 6461'),
                      ],
                    ),

                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveText('Data Bundle'),
                        ResponsiveText('100MB Daily plan'),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveText('Amount'),
                        ResponsiveText('5000'),
                      ],
                    ),
                  ],
                ),
                verticalSpaceCustom(20),
                RoundedButton(
                  text: 'Confirm',
                  onPressed: () {
                    buyMobileData();
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ThumbPrintScreen(),
                    //   ),
                    // );
                  },
                ),
                verticalSpaceCustom(40),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> buyMobileData() async {
    LoaderManager.showLoader(context);
    try {
      var data = {
        "amount": 800,
        "serviceCategoryId": "61e989f20e69308aa37a7a9f",
        "bundleCode": "MTN-1GB",
        "debitAccountNumber": "0110324148",
        "phoneNumber": "07040981357",
      };
      final response = await Api().postRequest2(data, "/BuyData");
      final responseBody = await response.stream.bytesToString();
      final body = jsonDecode(responseBody);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SuccessTansactionScreen()),
        );
        LoaderManager.hideLoader();
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => BvnOtpScreen()));
      } else {
        LoaderManager.hideLoader();
        ToastService.showErrorToast(
          message: "Error occured, please try again.",
        );
      }
    } catch (e) {
      LoaderManager.hideLoader();
      throw Exception(e);
    }
  }
 */
