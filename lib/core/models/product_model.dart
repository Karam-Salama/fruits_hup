import 'dart:io';

import '../entites/product_entity.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final num price;
  final num discount;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.description,
    required this.code,
    required this.unitAmount,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.price,
    required this.reviews,
    required this.discount,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.sellingCount,
    this.imageUrl,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      code: code,
      price: price,
      discount: discount,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      unitAmount: unitAmount,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      image: image,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      code: json['code'],
      price: json['price'],
      discount: json['discount'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      unitAmount: json['unitAmount'],
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      isOrganic: json['isOrganic'],
      reviews: json['reviews'] != null ? List<ReviewModel>.from(json['reviews'].map((e) => ReviewModel.fromJson(e))) : [],
      sellingCount: json['sellingCount'],
      image: json['imageUrl'],
    );
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'discount': discount,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'unitAmount': unitAmount,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellingCount': sellingCount
    };
  }
}
