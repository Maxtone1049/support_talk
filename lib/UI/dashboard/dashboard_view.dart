import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/Pages/CardView/card_view.dart';
import 'package:wepay/UI/dashboard/Pages/ProfileView/profile_view.dart';
import 'package:wepay/UI/dashboard/Pages/RewardView/reward_view.dart';
import 'package:wepay/UI/dashboard/dashview_model.dart';
import 'package:wepay/UI/dashboard/home_page.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onViewModelReady: (model) {
        model.setIndex(0);
      },
      builder: (_, viewModel, __) {
        List<String> navbarPageTitles = [
          'Home',
          // 'Search',
          'Card',
          'Reward',
          'Profile',
        ];
        Widget navbarItem(int index) {
          String pages = navbarPageTitles[index].toLowerCase();
          return InkWell(
            onTap: () {
              if (!(index == viewModel.currentIndex)) {
                viewModel.setIndex(index);
              }
            },
            child:
                index == viewModel.currentIndex
                    ? ImageView(
                      imageConfig: ImageConfig(
                        imageURL: "assets/svg/${pages}filled.svg",
                        height: 40.h,
                        // imageType: ImageType.svg,
                      ),
                    )
                    : ImageView(
                      imageConfig: ImageConfig(
                        imageURL: 'assets/svg/$pages.svg',
                        height: 25.h,
                      ),
                    ),
          );
        }

        return Scaffold(
          key: UniqueKey(),
          body: GestureDetector(
            // onTap: _handleUserInteraction,
            // onPanDown: _handleUserInteraction,
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
                    key: ValueKey<int>(viewModel.currentIndex),
                    child: _getViewForIndex(viewModel.currentIndex),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kcDarkGreenColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        navbarItem(0),
                        navbarItem(1),
                        navbarItem(2),
                        navbarItem(3),
                        // navbarItem(4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomePageScreen();
      case 1:
        return const CardView();
      case 2:
        return const RewardView();
      case 3:
        return const ProfileView();
    }
    return const Scaffold();
  }
}
