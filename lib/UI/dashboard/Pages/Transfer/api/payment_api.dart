import 'package:dio/dio.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_model.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/transfer_to_bank_model/transfer_to_bank_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin/verify_payment_pin.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin_res_model/verify_payment_pin_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_model/wepay_transfer_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_res_model/wepay_to_wepay_transfeer_res_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/Network/Network_Service.dart';
import 'package:wepay/core/Network/UrlPath.dart';
import 'package:wepay/core/main_core/app.locator.dart';

class PaymentApi extends NetworkService {
  @override
  // ignore: overridden_fields
  final session = locator<SharedPreferencesService>();

  Future<SuccessResModel> paytoOtherBank(TransferToBankModel bankSend, String idkey) async {
    try {
      session.isFound401erorr = false;
      final res = await call(
        method: RequestMethod.post,
        path: UrlConfig.outtransfer,
         options: Options(
          headers: {
            "Authorization": "Bearer ${session.authToken}",
            'Idempotency-Key': idkey,
          },
        ),
        data: bankSend.toJson(),
      );
      return SuccessResModel.fromJson(res.data);
    } catch (e) {
      session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<WepayTransferResModel> internalTransfer(WepayTransferModel wepay, String idkey) async {
    try {
      session.isFound401erorr = false;
      final res = await call(
        method: RequestMethod.post,
        path: UrlConfig.intransfer,
         options: Options(
          headers: {
            "Authorization": "Bearer ${session.authToken}",
            'Idempotency-Key': idkey,
          },
        ),
        data: wepay.toJson(),
      );
      return WepayTransferResModel.fromJson(res.data);
    } catch (e) {
      session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<VerifyPaymentPinResModel> vertPin(
    VerifyPaymentPinModel vertPin,
    String userId,
  ) async {
    try {
      session.isFound401erorr = false;
      final res = await call(
        method: RequestMethod.post,
        path: "${UrlConfig.vertPin}/$userId/verify",
        data: vertPin.toJson(),
      );
      return VerifyPaymentPinResModel.fromJson(res.data);
    } catch (e) {
      session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<AirtimePurchaseResModel> airtimeBuy(
    AirtimePurchaseModel buy,
    String idkey,
  ) async {
    try {
      session.isFound401erorr = false;
      final res = await call(
        method: RequestMethod.post,
        path: UrlConfig.airtime_purchase,
        options: Options(
          headers: {
            "Authorization": "Bearer ${session.authToken}",
            'Idempotency-Key': idkey,
          },
        ),
        data: buy.toJson(),
      );
      return AirtimePurchaseResModel.fromJson(res.data);
    } catch (e) {
      session.isFound401erorr = true;
      rethrow;
    }
  }
}
