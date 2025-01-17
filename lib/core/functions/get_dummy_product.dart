import 'dart:io';

import 'package:fruits_hup/core/entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    description: 'A red apple',
    code: '123',
    price: 10,
    discount: 5,
    isFeatured: true,
    imageUrl: 'https://example.com/apple.jpg',
    unitAmount: 1,
    expirationMonths: 3,
    numberOfCalories: 100,
    isOrganic: true,
    reviews: [],
    image: File('')
  );
}


List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}