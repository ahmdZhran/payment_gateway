class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;
  PaymentIntentInputModel(this.customerId, {required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
