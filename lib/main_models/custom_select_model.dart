class CustomSelectModel {
  final int? id;
  final String? name;
  final String? value;

  CustomSelectModel({this.id, this.name, this.value});

  factory CustomSelectModel.fromJson(Map<String, dynamic> json) =>
      CustomSelectModel(
        id: json["id"],
        value: json["value"],
        name: json["name"],
      );
}
