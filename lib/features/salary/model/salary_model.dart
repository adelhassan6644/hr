class SalaryModel {
  final BaseSalaryModel? salary;
  final List<SalaryDetailsModel>? salaryDetailsModel;

  SalaryModel({
    this.salary,
    this.salaryDetailsModel,
  });

  factory SalaryModel.fromJson(Map<String, dynamic> json) => SalaryModel(
        salary: json["salary"] == null
            ? null
            : BaseSalaryModel.fromJson(json["salary"]),
        salaryDetailsModel: json["employee_recompenses"] == null
            ? []
            : List<SalaryDetailsModel>.from(json["employee_recompenses"]!
                .map((x) => SalaryDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "salary": salary?.toJson(),
        "employee_recompenses": salaryDetailsModel == null
            ? []
            : List<dynamic>.from(salaryDetailsModel!.map((x) => x.toJson())),
      };
}

class SalaryDetailsModel {
  final String? amount;
  final String? name;

  SalaryDetailsModel({
    this.amount,
    this.name,
  });

  factory SalaryDetailsModel.fromJson(Map<String, dynamic> json) =>
      SalaryDetailsModel(
        amount: json["amount"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "name": name,
      };
}

class BaseSalaryModel {
  final int? id;
  final String? salary;
  final DateTime? startAt;
  final String? url;
  final dynamic status;

  BaseSalaryModel({
    this.id,
    this.salary,
    this.startAt,
    this.url,
    this.status,
  });

  factory BaseSalaryModel.fromJson(Map<String, dynamic> json) =>
      BaseSalaryModel(
        id: json["id"],
        salary: json["salary"].toString(),
        startAt:
            json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        status: json["status"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary": salary,
        "start_at":
            "${startAt!.year.toString().padLeft(4, '0')}-${startAt!.month.toString().padLeft(2, '0')}-${startAt!.day.toString().padLeft(2, '0')}",
        "status": status,
        "url": url,
      };
}
