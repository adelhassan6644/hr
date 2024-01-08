import '../../requests/model/request_model.dart';

class RequestDetailsModel {
  final int? id;
  final int? type;
  final String? loan;
  final int? status;
  final DateTime? createdAt;
  final List<Image>? images;

  RequestDetailsModel({
    this.id,
    this.type,
    this.status,
    this.loan,
    this.createdAt,
    this.images,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) => RequestDetailsModel(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        loan: json["loan"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "loan": loan,
        "created_at": createdAt?.toIso8601String(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
