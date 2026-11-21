import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/order/domain/entities/order_response_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';

abstract class OrderRepo {
  // =================== buyOrderRepo ===================
  Future<Either<Failure, OrderResponseEntity>> buyOrderRepo({
    required int carId,
    String? userNotes,
  });

  // =================== rentOrderRepo ===================
  Future<Either<Failure, OrderResponseEntity>> rentOrderRepo({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  });

  // =================== installmentOrderRepo ===================
  Future<Either<Failure, OrderResponseEntity>> installmentOrderRepo({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  });

  // =================== cancelOrderRepo ===================
  Future<Either<Failure, void>> cancelOrderRepo({
    required int orderId,
  });

  // =================== getMyOrderRepo ===================
  Future<Either<Failure, List<OrderEntity>>> getMyOrderRepo();
}
