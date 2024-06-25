import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';

class KioskResponseDm extends KioskResponseEntity {
  KioskResponseDm({
    super.id,
    super.pending,
    super.amountCents,
    super.success,
    super.isAuth,
    super.isCapture,
    super.isStandalonePayment,
    super.isVoided,
    super.isRefunded,
    super.is3dSecure,
    super.integrationId,
    super.profileId,
    super.hasParentTransaction,
    super.order,
    super.createdAt,
    super.transactionProcessedCallbackResponses,
    super.currency,
    super.sourceData,
    super.apiSource,
    super.terminalId,
    super.merchantCommission,
    super.installment,
    super.discountDetails,
    super.isVoid,
    super.isRefund,
    super.data,
    super.isHidden,
    super.paymentKeyClaims,
    super.errorOccured,
    super.isLive,
    super.otherEndpointReference,
    super.refundedAmountCents,
    super.sourceId,
    super.isCaptured,
    super.capturedAmount,
    super.merchantStaffTag,
    super.updatedAt,
    super.isSettled,
    super.billBalanced,
    super.isBill,
    super.owner,
    super.parentTransaction,
  });

  KioskResponseDm.fromJson(dynamic json) {
    id = json['id'];
    pending = json['pending'];
    amountCents = json['amount_cents'];
    success = json['success'];
    isAuth = json['is_auth'];
    isCapture = json['is_capture'];
    isStandalonePayment = json['is_standalone_payment'];
    isVoided = json['is_voided'];
    isRefunded = json['is_refunded'];
    is3dSecure = json['is_3d_secure'];
    integrationId = json['integration_id'];
    profileId = json['profile_id'];
    hasParentTransaction = json['has_parent_transaction'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    createdAt = json['created_at'];
    if (json['transaction_processed_callback_responses'] != null) {
      transactionProcessedCallbackResponses = [];
    }
    currency = json['currency'];
    sourceData = json['source_data'] != null
        ? SourceData.fromJson(json['source_data'])
        : null;
    apiSource = json['api_source'];
    terminalId = json['terminal_id'];
    merchantCommission = json['merchant_commission'];
    installment = json['installment'];
    if (json['discount_details'] != null) {
      discountDetails = [];
    }
    isVoid = json['is_void'];
    isRefund = json['is_refund'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isHidden = json['is_hidden'];
    paymentKeyClaims = json['payment_key_claims'] != null
        ? PaymentKeyClaims.fromJson(json['payment_key_claims'])
        : null;
    errorOccured = json['error_occured'];
    isLive = json['is_live'];
    otherEndpointReference = json['other_endpoint_reference'];
    refundedAmountCents = json['refunded_amount_cents'];
    sourceId = json['source_id'];
    isCaptured = json['is_captured'];
    capturedAmount = json['captured_amount'];
    merchantStaffTag = json['merchant_staff_tag'];
    updatedAt = json['updated_at'];
    isSettled = json['is_settled'];
    billBalanced = json['bill_balanced'];
    isBill = json['is_bill'];
    owner = json['owner'];
    parentTransaction = json['parent_transaction'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pending'] = pending;
    map['amount_cents'] = amountCents;
    map['success'] = success;
    map['is_auth'] = isAuth;
    map['is_capture'] = isCapture;
    map['is_standalone_payment'] = isStandalonePayment;
    map['is_voided'] = isVoided;
    map['is_refunded'] = isRefunded;
    map['is_3d_secure'] = is3dSecure;
    map['integration_id'] = integrationId;
    map['profile_id'] = profileId;
    map['has_parent_transaction'] = hasParentTransaction;

    map['created_at'] = createdAt;
    if (transactionProcessedCallbackResponses != null) {
      map['transaction_processed_callback_responses'] =
          transactionProcessedCallbackResponses
              ?.map((v) => v.toJson())
              .toList();
    }
    map['currency'] = currency;

    map['api_source'] = apiSource;
    map['terminal_id'] = terminalId;
    map['merchant_commission'] = merchantCommission;
    map['installment'] = installment;
    if (discountDetails != null) {
      map['discount_details'] =
          discountDetails?.map((v) => v.toJson()).toList();
    }
    map['is_void'] = isVoid;
    map['is_refund'] = isRefund;
    map['is_hidden'] = isHidden;
    map['error_occured'] = errorOccured;
    map['is_live'] = isLive;
    map['other_endpoint_reference'] = otherEndpointReference;
    map['refunded_amount_cents'] = refundedAmountCents;
    map['source_id'] = sourceId;
    map['is_captured'] = isCaptured;
    map['captured_amount'] = capturedAmount;
    map['merchant_staff_tag'] = merchantStaffTag;
    map['updated_at'] = updatedAt;
    map['is_settled'] = isSettled;
    map['bill_balanced'] = billBalanced;
    map['is_bill'] = isBill;
    map['owner'] = owner;
    map['parent_transaction'] = parentTransaction;
    return map;
  }
}

class PaymentKeyClaims extends PaymentKeyClaimsEntity {
  PaymentKeyClaims({
    super.userId,
    super.amountCents,
    super.currency,
    super.integrationId,
    super.orderId,
    super.billingData,
    super.lockOrderWhenPaid,
    super.extra,
    super.singlePaymentAttempt,
    super.exp,
    super.pmkIp,
  });

  PaymentKeyClaims.fromJson(dynamic json) {
    userId = json['user_id'];
    amountCents = json['amount_cents'];
    currency = json['currency'];
    integrationId = json['integration_id'];
    orderId = json['order_id'];
    billingData = json['billing_data'] != null
        ? BillingData.fromJson(json['billing_data'])
        : null;
    lockOrderWhenPaid = json['lock_order_when_paid'];
    extra = json['extra'];
    singlePaymentAttempt = json['single_payment_attempt'];
    exp = json['exp'];
    pmkIp = json['pmk_ip'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['amount_cents'] = amountCents;
    map['currency'] = currency;
    map['integration_id'] = integrationId;
    map['order_id'] = orderId;
    map['lock_order_when_paid'] = lockOrderWhenPaid;
    map['extra'] = extra;
    map['single_payment_attempt'] = singlePaymentAttempt;
    map['exp'] = exp;
    map['pmk_ip'] = pmkIp;
    return map;
  }
}

class BillingData extends BillingDataEntity {
  BillingData({
    super.firstName,
    super.lastName,
    super.street,
    super.building,
    super.floor,
    super.apartment,
    super.city,
    super.state,
    super.country,
    super.email,
    super.phoneNumber,
    super.postalCode,
    super.extraDescription,
  });

  BillingData.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    apartment = json['apartment'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['street'] = street;
    map['building'] = building;
    map['floor'] = floor;
    map['apartment'] = apartment;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['postal_code'] = postalCode;
    map['extra_description'] = extraDescription;
    return map;
  }
}

class Data extends KioskDataEntity {
  Data({
    super.klass,
    super.gatewayIntegrationPk,
    super.ref,
    super.rrn,
    super.amount,
    super.fromUser,
    super.message,
    super.biller,
    super.txnResponseCode,
    super.billReference,
    super.aggTerminal,
    super.dueAmount,
    super.cashoutAmount,
    super.paidThrough,
    super.otp,
  });

  Data.fromJson(dynamic json) {
    klass = json['klass'];
    gatewayIntegrationPk = json['gateway_integration_pk'];
    ref = json['ref'];
    rrn = json['rrn'];
    amount = json['amount'];
    fromUser = json['from_user'];
    message = json['message'];
    biller = json['biller'];
    txnResponseCode = json['txn_response_code'];
    billReference = json['bill_reference'];
    aggTerminal = json['agg_terminal'];
    dueAmount = json['due_amount'];
    cashoutAmount = json['cashout_amount'];
    paidThrough = json['paid_through'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['klass'] = klass;
    map['gateway_integration_pk'] = gatewayIntegrationPk;
    map['ref'] = ref;
    map['rrn'] = rrn;
    map['amount'] = amount;
    map['from_user'] = fromUser;
    map['message'] = message;
    map['biller'] = biller;
    map['txn_response_code'] = txnResponseCode;
    map['bill_reference'] = billReference;
    map['agg_terminal'] = aggTerminal;
    map['due_amount'] = dueAmount;
    map['cashout_amount'] = cashoutAmount;
    map['paid_through'] = paidThrough;
    map['otp'] = otp;
    return map;
  }
}

class SourceData extends SourceDataEntity {
  SourceData({
    super.type,
    super.subType,
    super.pan,
  });

  SourceData.fromJson(dynamic json) {
    type = json['type'];
    subType = json['sub_type'];
    pan = json['pan'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['sub_type'] = subType;
    map['pan'] = pan;
    return map;
  }
}

class Order extends OrderEntity {
  Order({
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
  });

  Order.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    deliveryNeeded = json['delivery_needed'];
    merchant =
        json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    collector = json['collector'];
    amountCents = json['amount_cents'];
    shippingData = json['shipping_data'] != null
        ? ShippingData.fromJson(json['shipping_data'])
        : null;
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
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['delivery_needed'] = deliveryNeeded;

    map['collector'] = collector;
    map['amount_cents'] = amountCents;

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
    return map;
  }
}

class ShippingData extends ShippingDataEntity {
  ShippingData({
    super.id,
    super.firstName,
    super.lastName,
    super.street,
    super.building,
    super.floor,
    super.apartment,
    super.city,
    super.state,
    super.country,
    super.email,
    super.phoneNumber,
    super.postalCode,
    super.extraDescription,
    super.shippingMethod,
    super.orderId,
    super.order,
  });

  ShippingData.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    apartment = json['apartment'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    postalCode = json['postal_code'];
    extraDescription = json['extra_description'];
    shippingMethod = json['shipping_method'];
    orderId = json['order_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['street'] = street;
    map['building'] = building;
    map['floor'] = floor;
    map['apartment'] = apartment;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['postal_code'] = postalCode;
    map['extra_description'] = extraDescription;
    map['shipping_method'] = shippingMethod;
    map['order_id'] = orderId;
    map['order'] = order;
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
