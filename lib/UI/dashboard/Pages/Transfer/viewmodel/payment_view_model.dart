import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_model.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/transfer_to_bank_model/transfer_to_bank_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin/verify_payment_pin.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin_res_model/verify_payment_pin_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_model/wepay_transfer_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_res_model/wepay_to_wepay_transfeer_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/repository/payment_repo_impl.dart';
import 'package:wepay/UI/dashboard/viewmodel/home_page_view_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.logger.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';

class PaymentViewModel extends HomePageViewModel {
  PaymentViewModel();

  bool? _isLoading;
  @override
  bool? get isLoading => _isLoading;

  // ignore: overridden_fields, annotate_overrides
  final logger = getLogger('PaymentViewModel');
  final payRepo = locator<PaymentRepoImpl>();
  SuccessResModel? _otherBank;
  SuccessResModel? get otherBank => _otherBank;
  Future<void> sendToOtherBank(
    TransferToBankModel sendOtherBank,
    String idkey,
  ) async {
    try {
      _isLoading = true;
      _otherBank = await runBusyFuture(
        payRepo.paytoOtherBank(sendOtherBank, idkey),
        throwException: true,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      logger.e(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  WepayTransferResModel? _wepayBank;
  WepayTransferResModel? get wepayBank => _wepayBank;
  Future<void> wepayTransfe(WepayTransferModel wepay, String idkey) async {
    try {
      _isLoading = true;
      _wepayBank = await runBusyFuture(
        payRepo.wepayTowepayBank(wepay, idkey),
        throwException: true,
      );
      _isLoading = false;
      PageRouter.pushNamed(
        Routes.successTansactionScreen,
        args: SuccessTansactionScreenArguments(
          amount: '${wepay.amount}',
          id: userId,
        ),
      );
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      logger.e(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  AirtimePurchaseResModel? _aritimeBuy;
  AirtimePurchaseResModel? get airtimeBuy => _aritimeBuy;
  Future<void> airtimePurchase(
    AirtimePurchaseModel airtime,
    String idkey,
  ) async {
    try {
      _isLoading = true;
      _aritimeBuy = await runBusyFuture(
        payRepo.airtimePay(airtime, idkey.toString()),
        throwException: true,
      );
      _isLoading = false;
      PageRouter.pushNamed(
        Routes.successTansactionScreen,
        args: SuccessTansactionScreenArguments(
          amount: '${airtime.amount}',
          id: userId,
        ),
      );
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      logger.e(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  VerifyPaymentPinResModel? _verifyPinResModel;
  VerifyPaymentPinResModel? get verifyPinResModel => _verifyPinResModel;
  Future<void> verifyPinPayment(
    VerifyPaymentPinModel? pinVerify,
    String? paymentType,
    String? userId,
    AirtimePurchaseModel? airtime,
    WepayTransferModel? wepay,
    String? idkey,
  ) async {
    try {
      _isLoading = true;
      _verifyPinResModel = await runBusyFuture(
        payRepo.verifyPin(pinVerify!, userId!),
        throwException: true,
      );
      _isLoading = false;
      if (_verifyPinResModel!.data?.isVerified == true) {
        if (paymentType == "bankTransfer") {
          PageRouter.pop();
        } else if (paymentType == "wepayTransfer") {
          await wepayTransfe(
            WepayTransferModel(
              sender: wepay?.sender,
              receiver: wepay?.receiver,
              amount: wepay?.amount,
              currency: wepay?.currency,
              reason: wepay?.reason,
            ),
            idkey.toString(),
          );
        } else if (paymentType == "airtime") {
          await airtimePurchase(
            AirtimePurchaseModel(
              number: airtime?.number,
              amount: airtime?.amount,
              country: "NG",
            ),
            idkey.toString(),
          );
        }
        // AppUiComponents.triggerNotification(
        //   "Verified Successfully",
        //   error: false,
        // );
      } else {
        AppUiComponents.triggerNotification(
          "Invalid Pin, Please try again",
          error: true,
        );
      }
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      logger.e(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
