import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model/payment_intent_input_mode.dart';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_models/payment_intent_models.dart';
import 'package:checkout_payment_ui/core/services/api/dio_service.dart';
import 'package:checkout_payment_ui/core/utils/api_key.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentintent(
      PaymentIntentInputModel paymentIntentInput) async {
    var response = await apiService.post(
      body: paymentIntentInput.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'Ahmed' // name of the buisness owner
          ),
    );
  }
}
