import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model/payment_intent_input_mode.dart';
import 'package:checkout_payment_ui/Features/checkout/data/repos/check_out_repo.dart';
import 'package:checkout_payment_ui/core/errors/failure.dart';
import 'package:checkout_payment_ui/core/errors/server_failure.dart';
import 'package:checkout_payment_ui/core/services/payment/stripe_service.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paaymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paaymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
