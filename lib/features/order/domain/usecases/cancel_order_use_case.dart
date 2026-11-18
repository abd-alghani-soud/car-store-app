import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';

@injectable
class CancelOrderUseCase {
  final OrderRepo orderRepo;

  CancelOrderUseCase({required this.orderRepo});

  Future<Either<Failure, void>> call({required int orderId}) async {
    return await orderRepo.cancelOrder(orderId: orderId);
  }
}
