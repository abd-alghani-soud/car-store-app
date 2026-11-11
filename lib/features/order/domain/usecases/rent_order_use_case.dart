import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/order_response_entity.dart';

@injectable
class RentOrderUseCase {
  final OrderRepo orderRepo;

  RentOrderUseCase({required this.orderRepo});

  Future<Either<Failure, OrderResponseEntity>> call({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  }) async {
    return await orderRepo.rentOrder(
      carId: carId,
      startDate: startDate,
      endDate: endDate,
      userNotes: userNotes,
    );
  }
}
