import 'package:dartz/dartz.dart';

import '../../../modules/checkout/domain/entities/order_entity.dart';
import '../../errors/failures.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrders({
    required OrderInputEntity order,
  });
}
