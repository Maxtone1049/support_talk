import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';
import 'package:wepay/custom/unfocus_widget.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingAppBarWidget;
  final Widget? bottomNavigationBar;
  final bool showDivider;
  final String? title;
  final double? titleSize;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? showBackIcon;
  final bool showAppBar;
  final AppBar? appBar;
  final bool? centerTitle;
  final Widget? drawer;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final double? trailingPadding;
  final VoidCallback? onTap;

  const CustomScaffold({
    super.key,
    this.body,
    this.trailingAppBarWidget,
    this.bottomNavigationBar,
    this.showDivider = true,
    this.title,
    this.bottom,
    this.titleSize,
    this.leadingWidget,
    this.titleWidget,
    this.leadingWidth,
    this.titleColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.showBackIcon,
    this.showAppBar = true,
    this.appBar,
    this.centerTitle,
    this.drawer,
    this.scaffoldKey,
    this.backgroundColor,
    this.trailingPadding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // var isfirst = locator<NavigationService>().currentRoute ==
    //     routeObserver.routeIds.first;

    return UnfocusWidget(
      child: Scaffold(
        key: scaffoldKey,
        drawer: drawer,
        backgroundColor: backgroundColor ?? kBackgroundColor,
        appBar:
            showAppBar == false
                ? null
                : appBar ??
                    AppBar(
                      backgroundColor: kBackgroundColor,
                      foregroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      centerTitle: centerTitle ?? true,
                      elevation: 0,
                      leadingWidth: leadingWidth,
                      leading:
                          (showBackIcon == false)
                              ? const SizedBox.shrink()
                              : leadingWidget ?? GreenBackButton(onTap: onTap),
                      title:
                          title == null
                              ? titleWidget ?? const SizedBox.shrink()
                              : ResponsiveText.w600(
                                title!,
                                fontSize: titleSize ?? 20,
                                color: titleColor,
                              ),
                      bottom:
                          showDivider
                              ? PreferredSize(
                                preferredSize: const Size.fromHeight(0),
                                child: thinDivider(),
                              )
                              : bottom,
                      actions:
                          trailingAppBarWidget != null
                              ? [
                                horizontalSpaceCustom(16),
                                Center(child: trailingAppBarWidget),
                                horizontalSpaceCustom(trailingPadding ?? 16),
                              ]
                              : null,
                    ),
        body: body,
        resizeToAvoidBottomInset: true,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
