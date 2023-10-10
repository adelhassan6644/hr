class ContractModel {
  final String? contractDuration;
  final String? contractTitle;
  final int? isActive;
  final String? contractType;
  final DateTime? startDate;

  ContractModel({
    this.contractDuration,
    this.contractTitle,
    this.isActive,
    this.contractType,
    this.startDate,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
        contractDuration: json["contract_duration"],
        contractTitle: json["contract_title"],
        isActive: json["is_active"],
        contractType: json["contract_type"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
      );

  Map<String, dynamic> toJson() => {
        "contract_duration": contractDuration,
        "contract_title": contractTitle,
        "is_active": isActive,
        "contract_type": contractType,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
      };
}
