import 'package:dartz/dartz.dart';

import 'package:fruits_hup/core/errors/failures.dart';
import 'package:fruits_hup/core/service/database_service.dart';

import 'package:fruits_hup/modules/checkout/domain/entities/order_entity.dart';

import '../../../modules/checkout/data/models/order_model.dart';
import '../../utils/app_Backend_Endpoints.dart';
import 'order_repo.dart';

class OrdersReposImplementation implements OrderRepo {
  final DatabaseService firestoreService;

  OrdersReposImplementation({required this.firestoreService});

  @override
  Future<Either<Failure, void>> addOrders(
      {required OrderInputEntity order}) async {
    try {
      await firestoreService.addData(
        path: BackendEndpoints.addOrders,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
