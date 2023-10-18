class CustomSelectModel {
  final int? id;
  final String? name;
  final String? value;
  final int? employeePledgeId;

  CustomSelectModel( {this.id, this.name, this.value,this.employeePledgeId,});

  factory CustomSelectModel.fromJson(Map<String, dynamic> json) =>
      CustomSelectModel(
        id: json["id"],
        value: json["value"],
        name: json["name"],
        employeePledgeId: json["employee_pledge_id"],
      );
}
