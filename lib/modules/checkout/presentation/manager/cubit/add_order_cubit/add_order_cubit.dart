import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/repos/orders_repos/order_repo.dart';
import '../../../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrders(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
