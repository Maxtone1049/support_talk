import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/elect_statistics_view.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/electricity_transaction_view.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/viewmodel/BillViewModel.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';

class ElectricityHistory extends StatefulWidget {
  const ElectricityHistory({super.key});

  @override
  State<ElectricityHistory> createState() => _ElectricityHistoryState();
}

class _ElectricityHistoryState extends State<ElectricityHistory> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BillViewModel>.reactive(
      viewModelBuilder: () => BillViewModel(),
      onViewModelReady: (model) {
        model.setIndex(0);
      },
      builder: (_, model, _) {
        Widget navbarItem(int index, String caption, String image) {
          return InkWell(
            onTap: () {
              if (!(index == model.currentIndex)) {
                model.setIndex(index);
              }
            },
            child: Column(
              children: [
                ImageView(
                  imageConfig: ImageConfig(
                    imageURL: image,
                    imageType: ImageType.svg,
                    color:
                        index == model.currentIndex
                            ? AppColors.primary
                            : AppColors.white.withAlpha((0.70 * 225).toInt()),
                  ),
                ),
                Gap(height: 8),
                TextView(
                  config: TextViewConfig(
                    text: caption,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color:
                        index == model.currentIndex
                            ? AppColors.primary
                            : AppColors.white.withAlpha((0.70 * 225).toInt()),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        }

        return BodyWidget(
          config: BodyConfig(
            showAppBar: true,
            appbarBackgroundColor: AppColors.kTransparent,
            backgroundColor: AppColors.kBackgroundColor,
            appBarTitle: "Transactions",
            appbarTitleColor: AppColors.white,
            centerTitle: false,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: TextView(
                  config: TextViewConfig(
                    text: "Download",
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  PageTransitionSwitcher(
                    transitionBuilder:
                        (child, primaryAnimation, secondaryAnimation) =>
                            FadeTransition(
                              opacity: primaryAnimation,
                              child: child,
                            ),
                    child: Container(
                      key: ValueKey<int>(model.currentIndex),
                      child: _getViewForIndex(model.currentIndex),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          navbarItem(0, "Transactions", AppImage.transactions),
                          navbarItem(1, "Statistics", AppImage.statistics),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const ElectricityTransactionView();
      case 1:
        return const ElectStatisticsView();
    }
    return const Scaffold();
  }
}
