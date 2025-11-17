import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_model.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/api/payment_api.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/transfer_to_bank_model/transfer_to_bank_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin/verify_payment_pin.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin_res_model/verify_payment_pin_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_model/wepay_transfer_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_res_model/wepay_to_wepay_transfeer_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/repository/payment_repo.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/core/main_core/app.locator.dart';

class PaymentRepoImpl implements PaymentRepo {
  final payApi = locator<PaymentApi>();
  @override
  Future<SuccessResModel> paytoOtherBank(TransferToBankModel bankSend, String idkey) async =>
      await payApi.paytoOtherBank(bankSend,idkey);

  @override
  Future<WepayTransferResModel> wepayTowepayBank(WepayTransferModel wepay, String idkey) async =>
      await payApi.internalTransfer(wepay,idkey);

  @override
  Future<VerifyPaymentPinResModel> verifyPin(
    VerifyPaymentPinModel vertPin,
    String userId,
  ) async => await payApi.vertPin(vertPin, userId);

  @override
  Future<AirtimePurchaseResModel> airtimePay(AirtimePurchaseModel airtime,String idkey) async =>
      await payApi.airtimeBuy(airtime,idkey);
}
