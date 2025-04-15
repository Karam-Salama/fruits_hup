import '../entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: '123',
    description: 'Fresh apple',
    price: 2.5,
    reviews: [],
    expirationsMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true, // Replace with a valid file path or mock it for tests.
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/25/25231.png',
    discount: 20,
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(5, (_) => getDummyProduct());
}
