class RequestDetailsModel {
  final int? id;
  final int? type;
  final String? requestType;
  final String? typeName;
  final String? loanAmount;
  final String? reason;
  final int? status;
  final String? numberOfMonths;
  final String? amountPerMonth;
  final String? comeTime, leaveTime, dayOfPermission;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? startAt;
  final DateTime? endAt;
  final List<String>? documents;

  RequestDetailsModel({
    this.id,
    this.type,
    this.status,
    this.loanAmount,
    this.requestType,
    this.numberOfMonths,
    this.amountPerMonth,
    this.reason,
    this.typeName,
    this.startAt,
    this.comeTime,
    this.leaveTime,
    this.dayOfPermission,
    this.endAt,
    this.startDate,
    this.createdAt,
    this.documents,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) => RequestDetailsModel(
        id: json["id"],
        type: json["type"],
        status: json["status"],
    typeName: json["type_name"],
        requestType: json["request_type"],
        loanAmount: json["amount"].toString(),
        numberOfMonths: json["number_of_months"].toString(),
        amountPerMonth: json["amount_per_month"].toString(),
        reason: json["reason"],
        comeTime: json["come_time"],
        leaveTime: json["leave_time"],
        dayOfPermission: json["day"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        startAt: json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        documents: json["document"] == null ? [] : List<String>.from(json["document"]!.map((x) => x["image"])),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "loan_type": requestType,
        "amount": loanAmount,
        "request_type": requestType,
        "reason": reason,
        "start_date": startDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "document": documents,
      };
}
