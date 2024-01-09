class RequestDetailsModel {
  final int? id;
  final int? type;
  final String? typeName;
  final String? loanAmount;
  final String? comment;
  final int? status;
  final String? numberOfMonths;
  final String? amountPerMonth;
  final String? comeTime, leaveTime, dayOfPermission;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? startAt;
  final DateTime? endAt;
  final List<String>? images;

  RequestDetailsModel({
    this.id,
    this.type,
    this.status,
    this.loanAmount,
    this.numberOfMonths,
    this.amountPerMonth,
    this.comment,
    this.typeName,
    this.startAt,
    this.comeTime,
    this.leaveTime,
    this.dayOfPermission,
    this.endAt,
    this.startDate,
    this.createdAt,
    this.images,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) =>
      RequestDetailsModel(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        typeName: json["type_name"],
        loanAmount: json["amount"].toString(),
        numberOfMonths: json["number_of_months"].toString(),
        amountPerMonth: json["amount_per_month"].toString(),
        comment: json["reason"] ?? json["comment"],
        comeTime: json["come_time"],
        leaveTime: json["leave_time"],
        dayOfPermission: json["day"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        startAt:
            json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"]!.map((x) => x["image"])),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "type_name": typeName,
        "amount": loanAmount,
        "reason": comment,
        "start_date": startDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "document": images,
      };
}
