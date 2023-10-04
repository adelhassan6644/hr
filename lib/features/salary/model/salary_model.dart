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
        amount: json["amount"] != null ? json["amount"].toString() : null,
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
  final String? netSalary;
  final DateTime? date;
  final String? url;

  BaseSalaryModel({
    this.id,
    this.salary,
    this.netSalary,
    this.date,
    this.url,
  });

  factory BaseSalaryModel.fromJson(Map<String, dynamic> json) =>
      BaseSalaryModel(
        id: json["id"],
        salary: json["salary"] != null ? json["salary"].toString() : null,
        netSalary:
            json["net_salary"] != null ? json["net_salary"].toString() : null,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary": salary,
        "net_salary": netSalary,
        "date": date,
        "url": url,
      };
}
