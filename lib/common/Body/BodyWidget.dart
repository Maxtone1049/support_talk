import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../assets/app_colors.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'Model/BodyConfig.dart';

class BodyWidget extends StatelessWidget {
  final BodyConfig? config;

  const BodyWidget({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: config?.backgroundColor,
            appBar:
                config!.showAppBar
                    ? AppBar(
                      centerTitle: config!.centerTitle,
                      automaticallyImplyLeading:
                          config!.automaticallyImplyLeading,
                      actions: config?.actions,
                      elevation: config?.elevation,
                      iconTheme: const IconThemeData(color: AppColors.grey900),
                      backgroundColor: config?.appbarBackgroundColor,
                      leading:
                          config!.showLeadingWidget
                              ? config?.leadingWidget ??
                                  CupertinoButton(
                                    onPressed: config?.onPressed,
                                    child: Icon(
                                      Icons.chevron_left_sharp,
                                      size: 30.sp,
                                      color: AppColors.black,
                                    ),
                                  )
                              : null,
                      title: TextView(
                        config: TextViewConfig(
                          text: config?.appBarTitle ?? '',
                          textStyle: Theme.of(
                            context,
                          ).textTheme.headlineLarge?.copyWith(
                            fontSize: config?.fontSize,
                            color: config?.appbarTitleColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      bottom:
                          config?.tabs != null
                              ? TabBar(tabs: config!.tabs!)
                              : null,
                    )
                    : null,
            body: SafeArea(
              minimum:
                  config?.childPadding ??
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: GestureDetector(onTap: () => {}, child: config?.child),
            ),
            bottomNavigationBar: config?.bottomNavigationBar,
            floatingActionButton: config!.floatingActionButton,
          ),
          Visibility(
            visible: config?.loading ?? false,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withAlpha((.2 * 225).toInt()),
              child: const Loader(),
            ),
          ),
        ],
      ),
      onWillPop: () async => config?.automaticallyImplyLeading ?? true,
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key, this.size = 50});

  final int? size;

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitThreeBounce(color: AppColors.primary));
  }
}
