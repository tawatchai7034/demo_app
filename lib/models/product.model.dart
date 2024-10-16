// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int id;
  String code;
  String name;
  int price;
  String detail;
  String createBy;
  DateTime createDate;
  String updateBy;
  DateTime updateDate;
  String status;
  String image;

  ProductModel({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.detail,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.updateDate,
    required this.status,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        code: json["code"] == null ? "" : json["code"],
        name: json["name"],
        price: json["price"],
        detail: json["detail"],
        createBy: json["createBy"],
        createDate: DateTime.parse(json["createDate"]),
        updateBy: json["updateBy"],
        updateDate: DateTime.parse(json["updateDate"]),
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "price": price,
        "detail": detail,
        "createBy": createBy,
        "createDate": createDate.toIso8601String(),
        "updateBy": updateBy,
        "updateDate": updateDate.toIso8601String(),
        "status": status,
        "image": image,
      };
}
