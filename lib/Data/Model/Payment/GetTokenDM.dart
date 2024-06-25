import 'package:e_commerce_application/Domain/Entity/Payment/GetTokenEntity.dart';

class GetTokenDm extends GetTokenEntity {
  GetTokenDm({
    super.profile,
    super.token,
  });

  GetTokenDm.fromJson(dynamic json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }
}

class Profile extends ProfileEntity {
  Profile({
    super.id,
    super.user,
    super.createdAt,
    super.active,
    super.profileType,
    super.phones,
    super.companyEmails,
    super.companyName,
    super.state,
    super.country,
    super.city,
    super.postalCode,
    super.street,
    super.emailNotification,
    super.orderRetrievalEndpoint,
    super.deliveryUpdateEndpoint,
    super.logoUrl,
    super.isMobadra,
    super.sector,
    super.is2faEnabled,
    super.otpSentTo,
    super.activationMethod,
    super.signedUpThrough,
    super.failedAttempts,
    super.customExportColumns,
    super.serverIP,
    super.username,
    super.primaryPhoneNumber,
    super.primaryPhoneVerified,
    super.isTempPassword,
    super.otp2faSentAt,
    super.otp2faAttempt,
    super.otpSentAt,
    super.otpValidatedAt,
    super.awbBanner,
    super.emailBanner,
    super.identificationNumber,
    super.deliveryStatusCallback,
    super.merchantExternalLink,
    super.merchantStatus,
    super.deactivatedByBank,
    super.bankDeactivationReason,
    super.bankMerchantStatus,
    super.nationalId,
    super.superAgent,
    super.walletLimitProfile,
    super.address,
    super.commercialRegistration,
    super.commercialRegistrationArea,
    super.distributorCode,
    super.distributorBranchCode,
    super.allowTerminalOrderId,
    super.allowEncryptionBypass,
    super.walletPhoneNumber,
    super.suspicious,
    super.latitude,
    super.longitude,
    super.bankStaffs,
    super.bankRejectionReason,
    super.bankReceivedDocuments,
    super.bankMerchantDigitalStatus,
    super.bankDigitalRejectionReason,
    super.filledBusinessData,
    super.dayStartTime,
    super.dayEndTime,
    super.withholdTransfers,
    super.smsSenderName,
    super.withholdTransfersReason,
    super.withholdTransfersNotes,
    super.canBillDepositWithCard,
    super.canTopupMerchants,
    super.topupTransferId,
    super.referralEligible,
    super.isEligibleToBeRanger,
    super.isRanger,
    super.isPoaching,
    super.paymobAppMerchant,
    super.settlementFrequency,
    super.dayOfTheWeek,
    super.dayOfTheMonth,
    super.allowTransactionNotifications,
    super.allowTransferNotifications,
    super.sallefnyAmountWhole,
    super.sallefnyFeesWhole,
    super.paymobAppFirstLogin,
    super.paymobAppLastActivity,
    super.payoutEnabled,
    super.payoutTerms,
    super.isBillsNew,
    super.canProcessMultipleRefunds,
    super.settlementClassification,
    super.instantSettlementEnabled,
    super.instantSettlementTransactionOtpVerified,
    super.preferredLanguage,
    super.ignoreFlashCallbacks,
    super.acqPartner,
    super.dom,
    super.bankRelated,
    super.permissions,
  });

  Profile.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    active = json['active'];
    profileType = json['profile_type'];
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
    emailNotification = json['email_notification'];
    orderRetrievalEndpoint = json['order_retrieval_endpoint'];
    deliveryUpdateEndpoint = json['delivery_update_endpoint'];
    logoUrl = json['logo_url'];
    isMobadra = json['is_mobadra'];
    sector = json['sector'];
    is2faEnabled = json['is_2fa_enabled'];
    otpSentTo = json['otp_sent_to'];
    activationMethod = json['activation_method'];
    signedUpThrough = json['signed_up_through'];
    failedAttempts = json['failed_attempts'];
    if (json['custom_export_columns'] != null) {
      customExportColumns = [];
    }
    if (json['server_IP'] != null) {
      serverIP = [];
    }
    username = json['username'];
    primaryPhoneNumber = json['primary_phone_number'];
    primaryPhoneVerified = json['primary_phone_verified'];
    isTempPassword = json['is_temp_password'];
    otp2faSentAt = json['otp_2fa_sent_at'];
    otp2faAttempt = json['otp_2fa_attempt'];
    otpSentAt = json['otp_sent_at'];
    otpValidatedAt = json['otp_validated_at'];
    awbBanner = json['awb_banner'];
    emailBanner = json['email_banner'];
    identificationNumber = json['identification_number'];
    deliveryStatusCallback = json['delivery_status_callback'];
    merchantExternalLink = json['merchant_external_link'];
    merchantStatus = json['merchant_status'];
    deactivatedByBank = json['deactivated_by_bank'];
    bankDeactivationReason = json['bank_deactivation_reason'];
    bankMerchantStatus = json['bank_merchant_status'];
    nationalId = json['national_id'];
    superAgent = json['super_agent'];
    walletLimitProfile = json['wallet_limit_profile'];
    address = json['address'];
    commercialRegistration = json['commercial_registration'];
    commercialRegistrationArea = json['commercial_registration_area'];
    distributorCode = json['distributor_code'];
    distributorBranchCode = json['distributor_branch_code'];
    allowTerminalOrderId = json['allow_terminal_order_id'];
    allowEncryptionBypass = json['allow_encryption_bypass'];
    walletPhoneNumber = json['wallet_phone_number'];
    suspicious = json['suspicious'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bankStaffs = json['bank_staffs'];
    bankRejectionReason = json['bank_rejection_reason'];
    bankReceivedDocuments = json['bank_received_documents'];
    bankMerchantDigitalStatus = json['bank_merchant_digital_status'];
    bankDigitalRejectionReason = json['bank_digital_rejection_reason'];
    filledBusinessData = json['filled_business_data'];
    dayStartTime = json['day_start_time'];
    dayEndTime = json['day_end_time'];
    withholdTransfers = json['withhold_transfers'];
    smsSenderName = json['sms_sender_name'];
    withholdTransfersReason = json['withhold_transfers_reason'];
    withholdTransfersNotes = json['withhold_transfers_notes'];
    canBillDepositWithCard = json['can_bill_deposit_with_card'];
    canTopupMerchants = json['can_topup_merchants'];
    topupTransferId = json['topup_transfer_id'];
    referralEligible = json['referral_eligible'];
    isEligibleToBeRanger = json['is_eligible_to_be_ranger'];
    isRanger = json['is_ranger'];
    isPoaching = json['is_poaching'];
    paymobAppMerchant = json['paymob_app_merchant'];
    settlementFrequency = json['settlement_frequency'];
    dayOfTheWeek = json['day_of_the_week'];
    dayOfTheMonth = json['day_of_the_month'];
    allowTransactionNotifications = json['allow_transaction_notifications'];
    allowTransferNotifications = json['allow_transfer_notifications'];
    sallefnyAmountWhole = json['sallefny_amount_whole'];
    sallefnyFeesWhole = json['sallefny_fees_whole'];
    paymobAppFirstLogin = json['paymob_app_first_login'];
    paymobAppLastActivity = json['paymob_app_last_activity'];
    payoutEnabled = json['payout_enabled'];
    payoutTerms = json['payout_terms'];
    isBillsNew = json['is_bills_new'];
    canProcessMultipleRefunds = json['can_process_multiple_refunds'];
    settlementClassification = json['settlement_classification'];
    instantSettlementEnabled = json['instant_settlement_enabled'];
    instantSettlementTransactionOtpVerified =
        json['instant_settlement_transaction_otp_verified'];
    preferredLanguage = json['preferred_language'];
    ignoreFlashCallbacks = json['ignore_flash_callbacks'];
    acqPartner = json['acq_partner'];
    dom = json['dom'];
    bankRelated = json['bank_related'];
    if (json['permissions'] != null) {
      permissions = [];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['active'] = active;
    map['profile_type'] = profileType;
    map['phones'] = phones;
    map['company_emails'] = companyEmails;
    map['company_name'] = companyName;
    map['state'] = state;
    map['country'] = country;
    map['city'] = city;
    map['postal_code'] = postalCode;
    map['street'] = street;
    map['email_notification'] = emailNotification;
    map['order_retrieval_endpoint'] = orderRetrievalEndpoint;
    map['delivery_update_endpoint'] = deliveryUpdateEndpoint;
    map['logo_url'] = logoUrl;
    map['is_mobadra'] = isMobadra;
    map['sector'] = sector;
    map['is_2fa_enabled'] = is2faEnabled;
    map['otp_sent_to'] = otpSentTo;
    map['activation_method'] = activationMethod;
    map['signed_up_through'] = signedUpThrough;
    map['failed_attempts'] = failedAttempts;
    if (customExportColumns != null) {
      map['custom_export_columns'] =
          customExportColumns?.map((v) => v.toJson()).toList();
    }
    if (serverIP != null) {
      map['server_IP'] = serverIP?.map((v) => v.toJson()).toList();
    }
    map['username'] = username;
    map['primary_phone_number'] = primaryPhoneNumber;
    map['primary_phone_verified'] = primaryPhoneVerified;
    map['is_temp_password'] = isTempPassword;
    map['otp_2fa_sent_at'] = otp2faSentAt;
    map['otp_2fa_attempt'] = otp2faAttempt;
    map['otp_sent_at'] = otpSentAt;
    map['otp_validated_at'] = otpValidatedAt;
    map['awb_banner'] = awbBanner;
    map['email_banner'] = emailBanner;
    map['identification_number'] = identificationNumber;
    map['delivery_status_callback'] = deliveryStatusCallback;
    map['merchant_external_link'] = merchantExternalLink;
    map['merchant_status'] = merchantStatus;
    map['deactivated_by_bank'] = deactivatedByBank;
    map['bank_deactivation_reason'] = bankDeactivationReason;
    map['bank_merchant_status'] = bankMerchantStatus;
    map['national_id'] = nationalId;
    map['super_agent'] = superAgent;
    map['wallet_limit_profile'] = walletLimitProfile;
    map['address'] = address;
    map['commercial_registration'] = commercialRegistration;
    map['commercial_registration_area'] = commercialRegistrationArea;
    map['distributor_code'] = distributorCode;
    map['distributor_branch_code'] = distributorBranchCode;
    map['allow_terminal_order_id'] = allowTerminalOrderId;
    map['allow_encryption_bypass'] = allowEncryptionBypass;
    map['wallet_phone_number'] = walletPhoneNumber;
    map['suspicious'] = suspicious;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['bank_staffs'] = bankStaffs;
    map['bank_rejection_reason'] = bankRejectionReason;
    map['bank_received_documents'] = bankReceivedDocuments;
    map['bank_merchant_digital_status'] = bankMerchantDigitalStatus;
    map['bank_digital_rejection_reason'] = bankDigitalRejectionReason;
    map['filled_business_data'] = filledBusinessData;
    map['day_start_time'] = dayStartTime;
    map['day_end_time'] = dayEndTime;
    map['withhold_transfers'] = withholdTransfers;
    map['sms_sender_name'] = smsSenderName;
    map['withhold_transfers_reason'] = withholdTransfersReason;
    map['withhold_transfers_notes'] = withholdTransfersNotes;
    map['can_bill_deposit_with_card'] = canBillDepositWithCard;
    map['can_topup_merchants'] = canTopupMerchants;
    map['topup_transfer_id'] = topupTransferId;
    map['referral_eligible'] = referralEligible;
    map['is_eligible_to_be_ranger'] = isEligibleToBeRanger;
    map['is_ranger'] = isRanger;
    map['is_poaching'] = isPoaching;
    map['paymob_app_merchant'] = paymobAppMerchant;
    map['settlement_frequency'] = settlementFrequency;
    map['day_of_the_week'] = dayOfTheWeek;
    map['day_of_the_month'] = dayOfTheMonth;
    map['allow_transaction_notifications'] = allowTransactionNotifications;
    map['allow_transfer_notifications'] = allowTransferNotifications;
    map['sallefny_amount_whole'] = sallefnyAmountWhole;
    map['sallefny_fees_whole'] = sallefnyFeesWhole;
    map['paymob_app_first_login'] = paymobAppFirstLogin;
    map['paymob_app_last_activity'] = paymobAppLastActivity;
    map['payout_enabled'] = payoutEnabled;
    map['payout_terms'] = payoutTerms;
    map['is_bills_new'] = isBillsNew;
    map['can_process_multiple_refunds'] = canProcessMultipleRefunds;
    map['settlement_classification'] = settlementClassification;
    map['instant_settlement_enabled'] = instantSettlementEnabled;
    map['instant_settlement_transaction_otp_verified'] =
        instantSettlementTransactionOtpVerified;
    map['preferred_language'] = preferredLanguage;
    map['ignore_flash_callbacks'] = ignoreFlashCallbacks;
    map['acq_partner'] = acqPartner;
    map['dom'] = dom;
    map['bank_related'] = bankRelated;
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class User extends UserEntity {
  User({
    super.id,
    super.username,
    super.firstName,
    super.lastName,
    super.dateJoined,
    super.email,
    super.isActive,
    super.isStaff,
    super.isSuperuser,
    super.lastLogin,
    super.groups,
    super.userPermissions,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    email = json['email'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    lastLogin = json['last_login'];
    if (json['groups'] != null) {
      groups = [];
    }
    userPermissions = json['user_permissions'] != null
        ? json['user_permissions'].cast<num>()
        : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['date_joined'] = dateJoined;
    map['email'] = email;
    map['is_active'] = isActive;
    map['is_staff'] = isStaff;
    map['is_superuser'] = isSuperuser;
    map['last_login'] = lastLogin;
    if (groups != null) {
      map['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    map['user_permissions'] = userPermissions;
    return map;
  }
}
