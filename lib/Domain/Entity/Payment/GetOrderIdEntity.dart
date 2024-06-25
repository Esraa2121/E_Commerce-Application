class GetOrderIdEntity {
  GetOrderIdEntity({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.merchant,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.data,
    this.token,
    this.url,
  });

  num? id;
  String? createdAt;
  bool? deliveryNeeded;
  MerchantEntity? merchant;
  dynamic collector;
  num? amountCents;
  dynamic shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  dynamic merchantOrderId;
  dynamic walletNotification;
  num? paidAmountCents;
  bool? notifyUserWithEmail;
  List<dynamic>? items;
  String? orderUrl;
  num? commissionFees;
  num? deliveryFeesCents;
  num? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  dynamic data;
  String? token;
  String? url;
}

class MerchantEntity {
  MerchantEntity({
    this.id,
    this.createdAt,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
  });

  num? id;
  String? createdAt;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
}
