class Lead {
  final String leadIdentifier;
  final String organisationName;
  final String email;
  final String orgContactNo;
  final dynamic noOfEmployees;
  final String sector;
  final String leadStatus;
  final String salesManager;
  final DateTime updatedOn;

  Lead({
    required this.leadIdentifier,
    required this.organisationName,
    required this.email,
    required this.orgContactNo,
    required this.noOfEmployees,
    required this.sector,
    required this.leadStatus,
    required this.salesManager,
    required this.updatedOn,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      leadIdentifier: json["leadIdentifier"],
      organisationName: json["organisationName"],
      email: json["email"],
      orgContactNo: json["orgContactNo"],
      noOfEmployees: json["noOfEmployees"],
      sector: json["sector"],
      leadStatus: json["leadStatus"],
      salesManager: json["salesManager"],
      updatedOn: DateTime.parse(json["updatedOn"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "leadIdentifier": leadIdentifier,
      "organisationName": organisationName,
      "email": email,
      "orgContactNo": orgContactNo,
      "noOfEmployees": noOfEmployees,
      "sector": sector,
      "leadStatus": leadStatus,
      "salesManager": salesManager,
      "updatedOn": updatedOn.toIso8601String(),
    };
  }
}
