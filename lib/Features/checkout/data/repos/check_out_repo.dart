import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model/payment_intent_input_mode.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paaymentIntentInputModel});
}

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}
