import 'review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final num discount;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.discount,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
  });
}
