import 'package:car_store_app/features/order/domain/entities/order_entity.dart';
import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetMyOrderUseCase {
  final OrderRepo orderRepo;

  GetMyOrderUseCase({required this.orderRepo});

  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await orderRepo.getMyOrder();
  }
}
