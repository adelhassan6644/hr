class PledgeModel {
  final int? id;
  final int? employeePledgeId;
  final String? name;
  final String? value;
  final DateTime? date;

  PledgeModel({this.id, this.name, this.value, this.date,this.employeePledgeId});

  factory PledgeModel.fromJson(Map<String, dynamic> json) => PledgeModel(
        id: json["id"],
    employeePledgeId: json["employee_pledge_id"],
        value: json["value"],
        name: json["pledge_name"],
        date: json["update_at"] != null
            ? DateTime.tryParse(json["update_at"])
            : DateTime.now(),
      );
}
