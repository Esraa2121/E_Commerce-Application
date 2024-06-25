class KioskResponseEntity {
  KioskResponseEntity({
    this.id,
    this.pending,
    this.amountCents,
    this.success,
    this.isAuth,
    this.isCapture,
    this.isStandalonePayment,
    this.isVoided,
    this.isRefunded,
    this.is3dSecure,
    this.integrationId,
    this.profileId,
    this.hasParentTransaction,
    this.order,
    this.createdAt,
    this.transactionProcessedCallbackResponses,
    this.currency,
    this.sourceData,
    this.apiSource,
    this.terminalId,
    this.merchantCommission,
    this.installment,
    this.discountDetails,
    this.isVoid,
    this.isRefund,
    this.data,
    this.isHidden,
    this.paymentKeyClaims,
    this.errorOccured,
    this.isLive,
    this.otherEndpointReference,
    this.refundedAmountCents,
    this.sourceId,
    this.isCaptured,
    this.capturedAmount,
    this.merchantStaffTag,
    this.updatedAt,
    this.isSettled,
    this.billBalanced,
    this.isBill,
    this.owner,
    this.parentTransaction,
  });

  num? id;
  bool? pending;
  num? amountCents;
  bool? success;
  bool? isAuth;
  bool? isCapture;
  bool? isStandalonePayment;
  bool? isVoided;
  bool? isRefunded;
  bool? is3dSecure;
  num? integrationId;
  num? profileId;
  bool? hasParentTransaction;
  OrderEntity? order;
  String? createdAt;
  List<dynamic>? transactionProcessedCallbackResponses;
  String? currency;
  SourceDataEntity? sourceData;
  String? apiSource;
  dynamic terminalId;
  num? merchantCommission;
  dynamic installment;
  List<dynamic>? discountDetails;
  bool? isVoid;
  bool? isRefund;
  KioskDataEntity? data;
  bool? isHidden;
  PaymentKeyClaimsEntity? paymentKeyClaims;
  bool? errorOccured;
  bool? isLive;
  dynamic otherEndpointReference;
  num? refundedAmountCents;
  num? sourceId;
  bool? isCaptured;
  num? capturedAmount;
  dynamic merchantStaffTag;
  String? updatedAt;
  bool? isSettled;
  bool? billBalanced;
  bool? isBill;
  num? owner;
  dynamic parentTransaction;
}

class PaymentKeyClaimsEntity {
  PaymentKeyClaimsEntity({
    this.userId,
    this.amountCents,
    this.currency,
    this.integrationId,
    this.orderId,
    this.billingData,
    this.lockOrderWhenPaid,
    this.extra,
    this.singlePaymentAttempt,
    this.exp,
    this.pmkIp,
  });

  num? userId;
  num? amountCents;
  String? currency;
  num? integrationId;
  num? orderId;
  BillingDataEntity? billingData;
  bool? lockOrderWhenPaid;
  dynamic extra;
  bool? singlePaymentAttempt;
  num? exp;
  String? pmkIp;
}

class BillingDataEntity {
  BillingDataEntity({
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
  });

  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
}

class KioskDataEntity {
  KioskDataEntity({
    this.klass,
    this.gatewayIntegrationPk,
    this.ref,
    this.rrn,
    this.amount,
    this.fromUser,
    this.message,
    this.biller,
    this.txnResponseCode,
    this.billReference,
    this.aggTerminal,
    this.dueAmount,
    this.cashoutAmount,
    this.paidThrough,
    this.otp,
  });

  String? klass;
  num? gatewayIntegrationPk;
  dynamic ref;
  dynamic rrn;
  dynamic amount;
  dynamic fromUser;
  String? message;
  dynamic biller;
  String? txnResponseCode;
  num? billReference;
  dynamic aggTerminal;
  num? dueAmount;
  dynamic cashoutAmount;
  String? paidThrough;
  String? otp;
}

class SourceDataEntity {
  SourceDataEntity({
    this.type,
    this.subType,
    this.pan,
  });

  String? type;
  String? subType;
  String? pan;
}

class OrderEntity {
  OrderEntity({
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
  });

  num? id;
  String? createdAt;
  bool? deliveryNeeded;
  MerchantEntity? merchant;
  dynamic collector;
  num? amountCents;
  ShippingDataEntity? shippingData;
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
}

class ShippingDataEntity {
  ShippingDataEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.shippingMethod,
    this.orderId,
    this.order,
  });

  num? id;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? state;
  String? country;
  String? email;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? shippingMethod;
  num? orderId;
  num? order;
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
