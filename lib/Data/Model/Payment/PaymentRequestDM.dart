import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';

class PaymentRequestDm extends PaymentRequestEntity {
  PaymentRequestDm({
    super.token,
  });

  PaymentRequestDm.fromJson(dynamic json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }
}
