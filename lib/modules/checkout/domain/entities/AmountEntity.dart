import 'DetailsEntity.dart';
import 'order_entity.dart';
import '../../../../core/functions/get_currency.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  factory AmountEntity.fromEntity(OrderInputEntity order) {
    return AmountEntity(
      total: order.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(order),
    );
  }

  toJson() => {
        "total": total,
        "currency": currency,
        "details": details?.toJson(),
      };
}
