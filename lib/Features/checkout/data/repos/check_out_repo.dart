import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model/payment_intent_input_mode.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paaymentIntentInputModel});
}
