import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/order_response_entity.dart';

@injectable
class InstallmentOrderUseCase {
  final OrderRepo orderRepo;

  InstallmentOrderUseCase({required this.orderRepo});

  Future<Either<Failure, OrderResponseEntity>> call({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  }) async {
    return await orderRepo.installmentOrder(
      carId: carId,
      installmentMonth: installmentMonth,
      userNotes: userNotes,
    );
  }
}
