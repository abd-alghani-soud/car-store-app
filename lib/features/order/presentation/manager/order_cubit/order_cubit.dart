import 'package:bloc/bloc.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/get_car_by_id_usecase.dart';
import 'package:car_store_app/features/order/domain/entities/order_entity.dart';
import 'package:car_store_app/features/order/domain/entities/order_response_entity.dart';
import 'package:car_store_app/features/order/domain/usecases/cancel_order_use_case.dart';
import 'package:car_store_app/features/order/domain/usecases/get_my_order_use_case.dart';
import 'package:car_store_app/features/order/domain/usecases/installment_order_use_case.dart';
import 'package:car_store_app/features/order/domain/usecases/rent_order_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/dependecies.dart';
import '../../../domain/usecases/buy_order_use_case.dart';

part 'order_state.dart';

@lazySingleton
class OrderCubit extends Cubit<OrderState> {
  OrderCubit({
    required this.buyOrderUseCase,
    required this.rentOrderUseCase,
    required this.installmentOrderUseCase,
    required this.getMyOrderUseCase,
    required this.cancelOrderUseCase,
  }) : super(OrderState());
  final BuyOrderUseCase buyOrderUseCase;
  final RentOrderUseCase rentOrderUseCase;
  final InstallmentOrderUseCase installmentOrderUseCase;
  final GetMyOrderUseCase getMyOrderUseCase;
  final CancelOrderUseCase cancelOrderUseCase;

  //========================buyOrderCubit========================
  Future<void> buyOrder(int carId, String? userNotes) async {
    emit(state.copyWith(buyOrderStatus: StatusEnum.loading));
    final result = await buyOrderUseCase.call(
      carId: carId,
      userNotes: userNotes ?? '',
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            buyOrderStatus: StatusEnum.failure,
            errMessage: failure.message,
          ),
        );
      },
      (orderResponse) {
        emit(
          state.copyWith(
            buyOrderStatus: StatusEnum.success,
            responseEntity: orderResponse,
          ),
        );
      },
    );
  }

  //========================rentOrderCubit========================
  Future<void> rentOrder(
    int carId,
    String? userNotes,
    DateTime startDate,
    DateTime endDate,
  ) async {
    emit(state.copyWith(rentOrderStatus: StatusEnum.loading));
    final result = await rentOrderUseCase.call(
      carId: carId,
      startDate: startDate,
      endDate: endDate,
      userNotes: userNotes,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            rentOrderStatus: StatusEnum.failure,
            errMessage: failure.message,
          ),
        );
      },
      (orderResponse) {
        emit(
          state.copyWith(
            rentOrderStatus: StatusEnum.success,
            responseEntity: orderResponse,
          ),
        );
      },
    );
  }

  //========================installmentOrderCubit========================
  Future<void> installmentOrder(
    int carId,
    String? userNotes,
    int installmentMonth,
  ) async {
    emit(state.copyWith(installmentOrderStatus: StatusEnum.loading));
    final result = await installmentOrderUseCase.call(
      carId: carId,
      installmentMonth: installmentMonth,
      userNotes: userNotes,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            installmentOrderStatus: StatusEnum.failure,
            errMessage: failure.message,
          ),
        );
      },
      (orderResponse) {
        emit(
          state.copyWith(
            installmentOrderStatus: StatusEnum.success,
            responseEntity: orderResponse,
          ),
        );
      },
    );
  }

  //========================getMyOrderCubit========================
  Future<void> getMyOrder() async {
    emit(state.copyWith(getMyOrderStatus: StatusEnum.loading));
    final result = await getMyOrderUseCase.call();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getMyOrderStatus: StatusEnum.failure,
            errMessage: failure.message,
          ),
        );
      },
      (orders) async {
        for (var order in orders) {
          final carResult = await getIt<GetCarByIdUsecase>()(order.carId);
          carResult.fold(
            (l) {
              order.carName = 'unKnown car';
            },
            (r) {
              order.carName = r.name;
            },
          );
        }
        emit(
          state.copyWith(
            getMyOrderStatus: StatusEnum.success,
            myOrders: orders,
          ),
        );
      },
    );
  }

  //========================cancelOrderCubit========================
  Future<void> cancelOrder(int orderId) async {
    emit(state.copyWith(cancelOrderStatus: StatusEnum.loading));
    final result = await cancelOrderUseCase.call(orderId: orderId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            cancelOrderStatus: StatusEnum.failure,
            errMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(cancelOrderStatus: StatusEnum.success));
      },
    );
  }

  void resetState() {
    emit(state.copyWith(buyOrderStatus: StatusEnum.initial));
  }
}
