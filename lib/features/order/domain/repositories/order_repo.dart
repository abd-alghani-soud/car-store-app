import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/order/domain/entities/order_response_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';

abstract class OrderRepo {
  // =================== buyOrder ===================
  Future<Either<Failure, OrderResponseEntity>> buyOrder({
    required int carId,
    String? userNotes,
  });

  // =================== rentOrder ===================
  Future<Either<Failure, OrderResponseEntity>> rentOrder({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  });

  // =================== installmentOrder ===================
  Future<Either<Failure, OrderResponseEntity>> installmentOrder({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  });

  // =================== cancelOrder ===================
  Future<Either<Failure, OrderResponseEntity>> cancelOrder({
    required int orderId,
  });

  // =================== getMyOrder ===================
  Future<Either<Failure, List<OrderEntity>>> getMyOrder();
}
