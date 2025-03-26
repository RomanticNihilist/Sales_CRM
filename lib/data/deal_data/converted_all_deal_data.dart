class Deal {
  final String dealNo;
  final String dealName;
  final String currency;
  final String expectedRevenue;
  final String dealStartDate;
  final AccountDetails accountDetails;
  final Map<String, ProductDetail> productDetails;
  final bool isDebtRevenue;
  final bool copyDealCheck;
  final String dealIdentifier;
  final String olddealIdentifier;
  final Map<String, dynamic> contactDetails;
  final String dealStatus;
  final DateTime updatedOn;
  final String createdBy;
  final String parentDealId;
  final String approvedBy;
  final List<String> voType;
  final List<String> selectedNotificationIds;
  final String accountName;
  final String clientName;
  final String activeStatus;
  final List<String> dealProductTypeArray;

  Deal({
    required this.dealNo,
    required this.dealName,
    required this.currency,
    required this.expectedRevenue,
    required this.dealStartDate,
    required this.accountDetails,
    required this.productDetails,
    required this.isDebtRevenue,
    required this.copyDealCheck,
    required this.dealIdentifier,
    required this.olddealIdentifier,
    required this.contactDetails,
    required this.dealStatus,
    required this.updatedOn,
    required this.createdBy,
    required this.parentDealId,
    required this.approvedBy,
    required this.voType,
    required this.selectedNotificationIds,
    required this.accountName,
    required this.clientName,
    required this.activeStatus,
    required this.dealProductTypeArray,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      dealNo: json['dealNo'] ?? "",
      dealName: json['dealName'],
      currency: json['currency'],
      expectedRevenue: json['expectedRevenue'].toString(),
      dealStartDate: json['dealStartDate'] ?? "",
      accountDetails: AccountDetails.fromJson(json['accountDetails'] ?? {}),
      productDetails:
          (json['productDetails'] as Map).cast<String, dynamic>().map(
                (key, value) => MapEntry(key, ProductDetail.fromJson(value)),
              ),
      isDebtRevenue: json['isDebtRevenue'] ?? false,
      copyDealCheck: json['copyDealCheck'] ?? false,
      dealIdentifier: json['dealIdentifier'],
      olddealIdentifier: json['olddealIdentifier'] ?? "", // Added default value
      contactDetails: (json['contactDetails'] is Map)
          ? (json['contactDetails'] as Map).cast<String, dynamic>()
          : {},
      dealStatus: json['dealStatus'],
      updatedOn: DateTime.parse(json['updatedOn']),
      createdBy: json['createdBy'] ?? "",
      parentDealId: json['parentDealId'] ?? "", // Added default value
      approvedBy: json['approvedBy'] ?? "",
      voType: List<String>.from(json['voType'] ?? []),
      selectedNotificationIds:
          List<String>.from(json['selectedNotificationIds'] ?? []),
      accountName: json['accountName'] ?? "",
      clientName: json['clientName'] ?? "",
      activeStatus: json['activeStatus'],
      dealProductTypeArray: List<String>.from(json['dealProductTypeArray']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dealNo': dealNo,
      'dealName': dealName,
      'currency': currency,
      'expectedRevenue': expectedRevenue,
      'dealStartDate': dealStartDate,
      'accountDetails': accountDetails.toJson(),
      'productDetails':
          productDetails.map((key, value) => MapEntry(key, value.toJson())),
      'isDebtRevenue': isDebtRevenue,
      'copyDealCheck': copyDealCheck,
      'dealIdentifier': dealIdentifier,
      'olddealIdentifier': olddealIdentifier,
      'contactDetails': contactDetails,
      'dealStatus': dealStatus,
      'updatedOn': updatedOn.toIso8601String(),
      'createdBy': createdBy,
      'parentDealId': parentDealId,
      'approvedBy': approvedBy,
      'voType': voType,
      'selectedNotificationIds': selectedNotificationIds,
      'accountName': accountName,
      'clientName': clientName,
      'activeStatus': activeStatus,
      'dealProductTypeArray': dealProductTypeArray,
    };
  }
}

class AccountDetails {
  final String accountName;

  AccountDetails({required this.accountName});

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(accountName: json['accountName'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {'accountName': accountName};
  }
}

class ProductDetail {
  final String productIdentifier;
  final String productType;
  final String projectManager;
  final String productDescription;

  ProductDetail({
    required this.productIdentifier,
    required this.productType,
    required this.projectManager,
    required this.productDescription,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      productIdentifier: json['productIdentifier'],
      productType: json['productType'],
      projectManager: json['projectManager'] ?? "",
      productDescription: json['productDescription'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productIdentifier': productIdentifier,
      'productType': productType,
      'projectManager': projectManager,
      'productDescription': productDescription,
    };
  }
}
