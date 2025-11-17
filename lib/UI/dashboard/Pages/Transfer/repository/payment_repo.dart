


import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_model.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/model/airtime_purchase_model/airtime_purchase_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/transfer_to_bank_model/transfer_to_bank_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin/verify_payment_pin.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/verify_payment_pin_res_model/verify_payment_pin_res_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_model/wepay_transfer_model.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/model/wepay_to_wepay_transfer_res_model/wepay_to_wepay_transfeer_res_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';

abstract class PaymentRepo  {
Future<SuccessResModel> paytoOtherBank(TransferToBankModel bankSend, String idkey);
Future<WepayTransferResModel> wepayTowepayBank(WepayTransferModel bankSend, String idkey);
Future<AirtimePurchaseResModel> airtimePay(AirtimePurchaseModel airtime,String idkey);
Future<VerifyPaymentPinResModel> verifyPin(VerifyPaymentPinModel vertPin, String userId);
}