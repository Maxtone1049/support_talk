import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin/verify_payment_pin.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_model/wepay_transfer_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/router/page_router.dart';

class VerifyPinSheets extends StatefulWidget {
  const VerifyPinSheets({
    super.key,
    this.amount,
    this.number,
    this.idkey,
    this.accountNo,
    this.bankName,
    this.accountName,
    this.transactionType,
    this.recieveNo,
  });
  final String? amount,
      number,
      idkey,
      accountNo,
      bankName,
      accountName,
      transactionType,
      recieveNo;

  @override
  State<VerifyPinSheets> createState() => _VerifyPinSheetsState();
}

class _VerifyPinSheetsState extends State<VerifyPinSheets> {
  final otpPin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder: () => locator<PaymentViewModel>(),
      disposeViewModel: false,
      builder: (_, model, __) {
        return Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          color: AppColors.kcDarkGreenColor,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  config: TextViewConfig(
                    text: "Input Pin",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  controller: otpPin,
                  length: 4,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    borderWidth: 1.0,
                    fieldWidth: 56.0,
                    fieldHeight: 56.0,
                    activeFillColor: AppColors.secondaryButton,
                    inactiveColor: AppColors.grey200,
                    inactiveFillColor: AppColors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  appContext: context,
                  onChanged: (String value) {},
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  config: ButtonConfig(
                    text: "Continue",
                    height: 56,
                    radius: 50.r,
                    buttonColor: AppColors.primary.withAlpha(
                      (0.51 * 225).toInt(),
                    ),
                    buttonOutlinedColor: AppColors.kTransparent,
                    onPressed: () {
                      if (otpPin.text.isNotEmpty) {
                        if (widget.transactionType == 'bankTransfer') {
                          PageRouter.pop();
                          model.verifyPinPayment(
                            VerifyPaymentPinModel(pin: otpPin.text),
                            widget.transactionType,
                            model.userId,
                            null,
                            null,
                            widget.idkey ?? '',
                          );
                        } else if (widget.transactionType == "airtime") {
                          PageRouter.pop();
                          model.verifyPinPayment(
                            VerifyPaymentPinModel(pin: otpPin.text),
                            widget.transactionType,
                            model.userId,
                            AirtimePurchaseModel(
                              number: widget.number ?? "",
                              amount: widget.amount ?? "",
                              country: "NG",
                            ),
                            null,
                            widget.idkey ?? '',
                          );
                        } else if (widget.transactionType == "wepayTransfer") {
                          PageRouter.pop();
                          model.verifyPinPayment(
                            VerifyPaymentPinModel(pin: otpPin.text),
                            widget.transactionType,
                            model.userId,
                            null,
                            WepayTransferModel(
                              amount: widget.amount,
                              currency: "NGN",
                              reason: 'Wepay to Wepay Transfer',
                              receiver: widget.recieveNo.toString(),
                              sender: model.accountNumber.toString(),
                            ),
                            widget.idkey ?? '',
                          );
                        }
                      } else {
                        AppUiComponents.triggerNotification(
                          "Pin cannot be Empty",
                          error: true,
                        );
                      }
                    },
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    textColor: AppColors.black,
                  ),
                ),
                // const Gap(height: 20),
                // TextView(
                //   config: TextViewConfig(
                //     text: "Forgot Pin?",
                //     color: AppColors.primary,
                //     fontSize: 16,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
