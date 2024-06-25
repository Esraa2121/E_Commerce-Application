import 'package:e_commerce_application/Domain/Entity/Payment/GetOrderIdEntity.dart';

class GetOrderIdDm extends GetOrderIdEntity {
  GetOrderIdDm({
    super.id,
    super.createdAt,
    super.deliveryNeeded,
    super.merchant,
    super.collector,
    super.amountCents,
    super.shippingData,
    super.currency,
    super.isPaymentLocked,
    super.isReturn,
    super.isCancel,
    super.isReturned,
    super.isCanceled,
    super.merchantOrderId,
    super.walletNotification,
    super.paidAmountCents,
    super.notifyUserWithEmail,
    super.items,
    super.orderUrl,
    super.commissionFees,
    super.deliveryFeesCents,
    super.deliveryVatCents,
    super.paymentMethod,
    super.merchantStaffTag,
    super.apiSource,
    super.data,
    super.token,
    super.url,
  });

  GetOrderIdDm.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    deliveryNeeded = json['delivery_needed'];
    merchant =
        json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    collector = json['collector'];
    amountCents = json['amount_cents'];
    shippingData = json['shipping_data'];
    currency = json['currency'];
    isPaymentLocked = json['is_payment_locked'];
    isReturn = json['is_return'];
    isCancel = json['is_cancel'];
    isReturned = json['is_returned'];
    isCanceled = json['is_canceled'];
    merchantOrderId = json['merchant_order_id'];
    walletNotification = json['wallet_notification'];
    paidAmountCents = json['paid_amount_cents'];
    notifyUserWithEmail = json['notify_user_with_email'];
    if (json['items'] != null) {
      items = [];
    }
    orderUrl = json['order_url'];
    commissionFees = json['commission_fees'];
    deliveryFeesCents = json['delivery_fees_cents'];
    deliveryVatCents = json['delivery_vat_cents'];
    paymentMethod = json['payment_method'];
    merchantStaffTag = json['merchant_staff_tag'];
    apiSource = json['api_source'];
    data = json['data'];
    token = json['token'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['delivery_needed'] = deliveryNeeded;
    map['collector'] = collector;
    map['amount_cents'] = amountCents;
    map['shipping_data'] = shippingData;
    map['currency'] = currency;
    map['is_payment_locked'] = isPaymentLocked;
    map['is_return'] = isReturn;
    map['is_cancel'] = isCancel;
    map['is_returned'] = isReturned;
    map['is_canceled'] = isCanceled;
    map['merchant_order_id'] = merchantOrderId;
    map['wallet_notification'] = walletNotification;
    map['paid_amount_cents'] = paidAmountCents;
    map['notify_user_with_email'] = notifyUserWithEmail;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['order_url'] = orderUrl;
    map['commission_fees'] = commissionFees;
    map['delivery_fees_cents'] = deliveryFeesCents;
    map['delivery_vat_cents'] = deliveryVatCents;
    map['payment_method'] = paymentMethod;
    map['merchant_staff_tag'] = merchantStaffTag;
    map['api_source'] = apiSource;
    map['data'] = data;
    map['token'] = token;
    map['url'] = url;
    return map;
  }
}

class Merchant extends MerchantEntity {
  Merchant({
    super.id,
    super.createdAt,
    super.phones,
    super.companyEmails,
    super.companyName,
    super.state,
    super.country,
    super.city,
    super.postalCode,
    super.street,
  });

  Merchant.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
    companyEmails = json['company_emails'] != null
        ? json['company_emails'].cast<String>()
        : [];
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['phones'] = phones;
    map['company_emails'] = companyEmails;
    map['company_name'] = companyName;
    map['state'] = state;
    map['country'] = country;
    map['city'] = city;
    map['postal_code'] = postalCode;
    map['street'] = street;
    return map;
  }
}
