import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/order/data/datasource/order_remote_data_source.dart';
import 'package:car_store_app/features/order/domain/entities/order_entity.dart';
import 'package:car_store_app/features/order/domain/entities/order_response_entity.dart';
import 'package:car_store_app/features/order/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoImpl({required this.orderRemoteDataSource});
//==================buyOrder==========================
  @override
  Future<Either<Failure, OrderResponseEntity>> buyOrder({
    required int carId,
    String? userNotes,
  }) async {
    try {
      final response = await orderRemoteDataSource.buyOrderDataSource(
        carId: carId,
        userNotes: userNotes,
      );
      return right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
//========================cancelOrder=======================
  @override
  Future<Either<Failure, void>> cancelOrder({required int orderId}) async {
    try {
      await orderRemoteDataSource.cancelOrderDataSource(orderId: orderId);
      return right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
//========================getMyOrder=========================
  @override
  Future<Either<Failure, List<OrderEntity>>> getMyOrder() async {
    try {
      final response = await orderRemoteDataSource.getMyOrderDataSource();
      return right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
//=========================installmentOrder=====================
  @override
  Future<Either<Failure, OrderResponseEntity>> installmentOrder({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  }) async {
    try {
      final response = await orderRemoteDataSource.installmentOrderDataSource(
        carId: carId,
        userNotes: userNotes,
        installmentMonth: installmentMonth,
      );
      return right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
//==============================rentOrder===========================
  @override
  Future<Either<Failure, OrderResponseEntity>> rentOrder({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  }) async {
    try {
      final response = await orderRemoteDataSource.rentOrderDataSource(
        carId: carId,
        userNotes: userNotes,
        startDate: startDate,
        endDate: endDate,
      );
      return right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
}
