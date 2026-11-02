import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/order_response_entity.dart';

class BuyOrderUseCase {
  final OrderRepo orderRepo;

  BuyOrderUseCase({required this.orderRepo});

  Future<Either<Failure, OrderResponseEntity>> call({
    required int carId,
    String? userNotes,
  }) async {
    return await orderRepo.buyOrder(carId: carId, userNotes: userNotes);
  }
}
