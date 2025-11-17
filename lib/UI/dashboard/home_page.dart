import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/viewmodel/home_page_view_model.dart';
import 'package:wepay/UI/dashboard/widget/refresh_indicator.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/AppUtils/app_helpers.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/see_all_header.dart';
import 'package:wepay/custom/custom%20widgets/bill_payment_card.dart';
import 'package:wepay/custom/custom%20widgets/financial_services.dart';
import 'package:wepay/custom/custom%20widgets/transfer_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(serviceListProvider.future);
      // ref.read(profileProvider.future);
    });
  }

  final RefreshController refresher = RefreshController();
  Future<void> _refresh(HomePageViewModel viewmodel) async {
    try {
      await viewmodel.currentUser();
      refresher.refreshCompleted();
    } catch (e) {
      refresher.refreshFailed();
      AppUiComponents.triggerNotification(
        "Refreshing Failed!, Please check your internet Connection",
        error: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    // final servicesAsync = ref.watch(serviceListProvider);

    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => locator<HomePageViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // await model.currentUser();
        });
      },
      disposeViewModel: false,
      builder: (_, model, __) {
        return BodyWidget(
          config: BodyConfig(
            childPadding: EdgeInsets.zero,
            backgroundColor: Color(0xff0C1013),
            showAppBar: false,
            child: SmartRefresher(
              header: const WaterDropHeader(
                refresh: RefreshIndicatorWidget(message: 'Refreshing...'),
                complete: RefreshIndicatorWidget(
                  message: 'Refreshing Completed',
                ),
                failed: RefreshIndicatorWidget(message: 'Refreshing failed'),
              ),
              controller: refresher,
              onRefresh: () async => _refresh(model),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header with profile
                    Row(
                      children: [
                        ImageView(
                          imageConfig: ImageConfig(
                            imageURL: AppImage.user,
                            imageType: ImageType.asset,
                            height: 48.h,
                          ),
                        ),
                        Gap(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                config: TextViewConfig(
                                  text:
                                      'Hi, ${model.name.split(" ").last[0].toUpperCase() + model.name.split(" ").last.substring(1).toLowerCase()}',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              TextView(
                                config: TextViewConfig(
                                  text: "How are you today?",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                  inactiveThumbColor: kLightGreen,
                                  inactiveTrackColor: kcDarkGreenColor,
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() => _rememberMe = value);
                                  },
                                ),
                              ),
                              ImageView(
                                imageConfig: ImageConfig(
                                  imageURL: AppImage.notify,
                                  imageType: ImageType.svg,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Gap(height: 10),

                    /// Balance card
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 18.5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: kPrimaryColor,
                      ),
                      // height: height * 0.11,
                      // width: width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ImageView(
                                imageConfig: ImageConfig(
                                  imageURL: AppImage.security,
                                  imageType: ImageType.svg,
                                ),
                              ),
                              horizontalSpaceTiny,
                              TextView(
                                config: TextViewConfig(
                                  text: "Available Balance",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                              horizontalSpaceTiny,
                              InkWell(
                                onTap: () => model.showBal(),
                                child: Icon(
                                  !model.showBalance
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.white,
                                  size: 20.sp,
                                ),
                              ),
                              // ImageView(
                              //   imageConfig: ImageConfig(
                              //     imageURL: AppImage.view,
                              //     imageType: ImageType.svg,
                              //     onTap: () => model.showBal(),
                              //   ),
                              // ),
                              horizontalSpaceTiny,
                              const Spacer(),
                              TextView(
                                config: TextViewConfig(
                                  text: model.accountNumber,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                              horizontalSpaceTiny,
                              ImageView(
                                imageConfig: ImageConfig(
                                  imageURL: AppImage.copy,
                                  onTap:
                                      () =>
                                          model.accountNumber != 'N/A'
                                              ? AppHelpers.copy(
                                                model.accountNumber,
                                              ) // Dynamic copy
                                              : AppUiComponents.triggerNotification(
                                                "No account available",
                                                error: true,
                                              ),
                                ),
                              ),
                            ],
                          ),
                          Gap(height: 22.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              model.isBusy
                                  ? CircularProgressIndicator(
                                    color: AppColors.white,
                                  )
                                  : Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '₦',
                                            style: GoogleFonts.inter(
                                              color: AppColors.white,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                          TextSpan(
                                            // text:
                                            //     ' ${profile.subAccount != null && profile.subAccount!.isNotEmpty ? profile.subAccount![0].accountBalance ?? 0 : 0}',
                                            text:
                                                !model.showBalance
                                                    ? "***"
                                                    : model.formattedBalance,
                                            style: GoogleFonts.inter(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              Expanded(
                                flex: 0,
                                child: GestureDetector(
                                  onTap:
                                      () => PageRouter.pushNamed(
                                        Routes.addMoneyView,
                                      ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: kLightGreen,
                                    ),
                                    child: Center(
                                      child: TextView(
                                        config: TextViewConfig(
                                          text: "+ Add Money",
                                          fontSize: 14,
                                          color: kTextColor,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                    Gap(height: 16),

                    /// Transfer section
                    const SeeAllHeader(
                      title: "Transfer",
                      title2: "Transaction History",
                    ),
                    Gap(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        color: k181C20,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransferCardWidget(
                            height: height,
                            width: width,
                            text: "To Wepay",
                            image: AppImage.finger,
                            onTap:
                                () =>
                                    PageRouter.pushNamed(Routes.toWepayScreen),
                          ),
                          TransferCardWidget(
                            height: height,
                            width: width,
                            text: "Other Banks",
                            image: AppImage.bank,
                            onTap:
                                () => PageRouter.pushNamed(
                                  Routes.bankTransferScreen,
                                ),
                          ),
                          ImageView(
                            imageConfig: ImageConfig(
                              imageURL: AppImage.line,
                              imageType: ImageType.svg,
                            ),
                          ),
                          TransferCardWidget(
                            height: height,
                            width: width,
                            text: "Protocol X AI",
                            image: AppImage.xicon,
                            onTap:
                                () => AppUiComponents.triggerNotification(
                                  "COMING SOON!!!",
                                  error: false,
                                ),
                            // PageRouter.pushNamed(Routes.protocolXScreen),
                          ),
                        ],
                      ),
                    ),

                    Gap(height: 14),

                    /// Bill payment section
                    TextView(
                      config: TextViewConfig(
                        text: "Bill Payment",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 10),
                    // servicesAsync.when(
                    //   loading: () => const CircularProgressIndicator(),
                    //   error:
                    //       (error, stack) => Column(
                    //         children: [
                    //           ResponsiveText('Error: $error'),
                    //           RoundedButton(
                    //             text: "Retry",
                    //             onPressed:
                    //                 () => ref.invalidate(serviceListProvider),
                    //           ),
                    //         ],
                    //       ),
                    //   data: (services) {
                    //     final airtimeService = _findService(
                    //       services.data,
                    //       'airtime',
                    //     );
                    //     final dataService = _findService(services.data, 'data');
                    //     final electricityService = _findService(
                    //       services.data,
                    //       'utility',
                    //     );

                    //     return;
                    //   },
                    // ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BillPaymentCard(
                            height: 90.h,
                            width: 80.w,
                            margin: EdgeInsets.only(right: 12),
                            text: "Airtime",
                            image: AppImage.airtime,
                            onTap:
                                () => PageRouter.pushNamed(
                                  Routes.airtimeScreen,
                                  args: AirtimeScreenArguments(id: '1'),
                                ),
                          ),
                          BillPaymentCard(
                            height: 90.h,
                            width: 80.w,
                            text: "Data",
                            margin: EdgeInsets.only(right: 12),
                            image: AppImage.data,
                            onTap:
                                () => PageRouter.pushNamed(
                                  Routes.dataScreen,
                                  args: DataScreenArguments(id: '2'),
                                ),
                          ),
                          BillPaymentCard(
                            height: 90.h,
                            width: 80.w,
                            text: "Betting",
                            margin: EdgeInsets.only(right: 12),
                            image: AppImage.betting,
                            onTap:
                                () => PageRouter.pushNamed(
                                  Routes.bettingView,
                                  args: BettingViewArguments(id: '4'),
                                ),
                          ),
                          BillPaymentCard(
                            height: 90.h,
                            width: 80.w,
                            text: "Electricity",
                            margin: EdgeInsets.only(right: 12),
                            image: AppImage.electricity,
                            onTap:
                                () => PageRouter.pushNamed(
                                  Routes.utilityPayment,
                                  args: UtilityPaymentArguments(id: '3'),
                                ),
                          ),
                          BillPaymentCard(
                            height: 90.h,
                            width: 80.w,
                            text: "TV",
                            image: AppImage.tv,
                            margin: EdgeInsets.only(right: 12),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    Gap(height: 15),

                    /// Financial services
                    TextView(
                      config: TextViewConfig(
                        text: "Financial Services",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FinancialServicesCard(
                            height: 100.h,
                            width: 100.w,
                            text: "Investment",
                            image: AppImage.investment,
                            onTap: () {
                              AppUiComponents.triggerNotification(
                                "COMING SOON!",
                                error: false,
                              );
                            },
                          ),
                          FinancialServicesCard(
                            height: 100.h,
                            width: 100.w,
                            text: "Savings",
                            image: AppImage.savings,
                            onTap: () {
                              AppUiComponents.triggerNotification(
                                "COMING SOON!",
                                error: false,
                              );
                            },
                          ),
                          FinancialServicesCard(
                            height: 100.h,
                            width: 100.w,
                            text: "Loan",
                            image: AppImage.loans,
                            onTap: () {
                              AppUiComponents.triggerNotification(
                                "COMING SOON!",
                                error: false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Gap(height: 140),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class HomePageScreen extends ConsumerStatefulWidget {
//   const HomePageScreen({super.key});

//   @override
//   ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends ConsumerState<HomePageScreen> {
//   bool _rememberMe = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(serviceListProvider.future);
//       ref.read(profileProvider.future);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     final width = MediaQuery.sizeOf(context).width;
//     final profileAsync = ref.watch(profileProvider);
//     final servicesAsync = ref.watch(serviceListProvider);

//     return CustomScaffold(
//       showAppBar: false,
//       body: profileAsync.when(
//         loading:
//             () => Center(child: const SpinKitThreeBounce(color: kLightGreen)),
//         error:
//             (error, stack) => Center(
//               child: PaddedColumn(
//                 padding: kMainPadding,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ResponsiveText('Error: $error'),
//                   RoundedButton(
//                     text: "Retry",
//                     onPressed: () {
//                       ref.invalidate(profileProvider); // refresh provider
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         data: (profile) {
//           return PaddedColumn(
//             padding: EdgeInsets.only(left: 16, right: 16, top: 20),
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   verticalSpaceMassive,
//                   CircleAvatar(),
//                   horizontalSpaceSmall,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ResponsiveText.w600(
//                         'Hi, ${profile.userDetails?.fullName ?? 'User'}',
//                         fontSize: 14,
//                       ),
//                       const ResponsiveText('How are you today?', fontSize: 14),
//                     ],
//                   ),
//                   Spacer(),
//                   Transform.scale(
//                     scale: 0.7,
//                     child: Switch(
//                       inactiveThumbColor: kLightGreen,
//                       inactiveTrackColor: kcDarkGreenColor,

//                       value: _rememberMe,
//                       onChanged: (value) {
//                         setState(() {
//                           _rememberMe = value ?? false;
//                         });
//                       },
//                     ),
//                   ),
//                   CircularButton(
//                     onTap: () {},
//                     color: kGreen,
//                     size: 40,
//                     child: const ImageCard.local(
//                       'notification.svg',
//                       size: 20,
//                       color: kWhiteColor,
//                     ),
//                   ),
//                 ],
//               ),
//               verticalSpaceCustom(10),
//               CustomCard(
//                 padding: EdgeInsets.all(10),
//                 borderRadius: BorderRadius.circular(20),
//                 color: kGreen,
//                 height: height * 0.11,
//                 width: width,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         ImageCard.local("security.svg"),
//                         horizontalSpaceTiny,
//                         ResponsiveText("Available Balance", fontSize: 14),
//                         horizontalSpaceTiny,
//                         ImageCard.local("view.svg"),
//                         Spacer(),
//                         ResponsiveText(
//                           "${profile.subAccount![0].accountNumber}",
//                         ),
//                         horizontalSpaceTiny,
//                         ImageCard.local("copy.svg"),
//                       ],
//                     ),
//                     verticalSpaceCustom(10),
//                     Row(
//                       children: [
//                         CustomRichText.split(
//                           text: '₦ ${profile.subAccount![0].accountBalance}',
//                           color: kWhiteColor,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           customString: [
//                             CustomString(
//                               string: '₦',
//                               textStyle: kInter700Responsive(
//                                 12,
//                               ).copyWith(color: kWhiteColor),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         CustomCard(
//                           borderRadius: BorderRadius.circular(20),
//                           color: kLightGreen,
//                           height: height * 0.04,
//                           width: width * 0.35,
//                           child: Center(
//                             child: ResponsiveText.w600(
//                               "+ Add Money",
//                               color: kTextColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               verticalSpaceCustom(10),
//               SeeAllHeader(title: "Transfer", title2: "Transaction History"),
//               verticalSpaceCustom(20),
//               PaddedRow(
//                 padding: kMainPadding,
//                 children: [
//                   horizontalSpaceCustom(20),
//                   TransferCardWidget(
//                     height: height,
//                     width: width,
//                     text: "To Wepay",
//                     image: "finger_icon.svg",
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ToWepayScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   horizontalSpaceCustom(20),
//                   TransferCardWidget(
//                     height: height,
//                     width: width,
//                     text: "Other Bank",
//                     image: "bank.svg",
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => BankTransferScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   horizontalSpaceCustom(20),
//                   TransferCardWidget(
//                     height: height,
//                     width: width,
//                     text: "Protocol X",
//                     image: "x_icon.svg",
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProtocolXScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               verticalSpaceCustom(20),
//               // service list here with id when navigating
//               ResponsiveText.w600("Bill Payment", fontSize: 16),
//               verticalSpaceCustom(20),
//               servicesAsync.when(
//                 loading: () => const CircularProgressIndicator(),
//                 error:
//                     (error, stack) => Column(
//                       children: [
//                         ResponsiveText('Error: $error'),
//                         RoundedButton(
//                           text: "Retry",
//                           onPressed: () {
//                             ref.invalidate(
//                               serviceListProvider,
//                             ); // refresh provider
//                           },
//                         ),
//                       ],
//                     ),
//                 data: (services) {
//                   final airtimeService = services.data?.firstWhere(
//                     (s) => s.identifier?.toLowerCase() == 'airtime',
//                     orElse:
//                         () =>
//                             ServicesDatum(), // 👈 create an empty object instead of null
//                   );

//                   final dataService = services.data?.firstWhere(
//                     (s) => s.identifier?.toLowerCase() == 'data',
//                     orElse: () => ServicesDatum(),
//                   );

//                   final electricityService = services.data?.firstWhere(
//                     (s) => s.identifier?.toLowerCase() == 'electricity',
//                     orElse: () => ServicesDatum(),
//                   );

//                   return PaddedRow(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BillPaymentCard(
//                         height: height,
//                         width: width,
//                         text: "Airtime",
//                         image: "airtime.svg",
//                         onTap: () {
//                           if (airtimeService?.id != null) {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) =>
//                                         AirtimeScreen(id: airtimeService!.id!),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       BillPaymentCard(
//                         height: height,
//                         width: width,
//                         text: "Data",
//                         image: "data.svg",
//                         onTap: () {
//                           if (dataService?.id != null) {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) =>
//                                         DataScreen(id: dataService!.id!),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       BillPaymentCard(
//                         height: height,
//                         width: width,
//                         text: "Betting",
//                         image: "betting.svg",
//                         onTap: () {},
//                       ),
//                       BillPaymentCard(
//                         height: height,
//                         width: width,
//                         text: "Electricity",
//                         image: "electricity.svg",
//                         onTap: () {
//                           if (electricityService?.id != null) {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => UtilityPayment(
//                                       id: electricityService!.id!,
//                                     ),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       BillPaymentCard(
//                         height: height,
//                         width: width,
//                         text: "TV",
//                         image: "tv.svg",
//                         onTap: () {},
//                       ),
//                     ],
//                   );
//                 },
//               ),

//               verticalSpaceCustom(20),
//               ResponsiveText.w600("Financial Services", fontSize: 16),
//               verticalSpaceCustom(20),
//               PaddedRow(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   FinancialServicesCard(
//                     height: height,
//                     width: width,
//                     text: "Investment",
//                     image: "investment.svg",
//                     onTap: () {},
//                   ),
//                   FinancialServicesCard(
//                     height: height,
//                     width: width,
//                     text: "Savings",
//                     image: "savings.svg",
//                     onTap: () {},
//                   ),
//                   FinancialServicesCard(
//                     height: height,
//                     width: width,
//                     text: "Loan",
//                     image: "loans.svg",
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   //
// }
