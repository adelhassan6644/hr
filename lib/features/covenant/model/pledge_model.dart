class PledgeModel {
  final int? id;
  final String? name;
  final String? value;
  final DateTime? date;

  PledgeModel({this.id, this.name, this.value, this.date});

  factory PledgeModel.fromJson(Map<String, dynamic> json) => PledgeModel(
        id: json["id"],
        value: json["value"],
        name: json["name"],
        date: json["update_at"] != null
            ? DateTime.tryParse(json["update_at"])
            : DateTime.now(),
      );
}
