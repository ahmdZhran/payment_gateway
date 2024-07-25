import 'dart:async';
import 'package:checkout_payment_ui/Features/checkout/data/models/payment_intent_input_model/payment_intent_input_mode.dart';
import 'package:checkout_payment_ui/Features/checkout/data/repos/check_out_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  bool _isClosed = false;

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    print('PaymentLoading state emitted');

    var data = await checkoutRepo.makePayment(
        paaymentIntentInputModel: paymentIntentInputModel);

    if (!_isClosed) {
      data.fold(
        (l) {
          print('PaymentFailure state emitted: ${l.errMessage}');
          emit(PaymentFailure(l.errMessage));
        },
        (r) {
          print('PaymentSuccess state emittedddddddddddddddddddddddddddddddddddddddddddddd');
          emit(PaymentSuccess());
        },
      );
    }
  }
}
