import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/core/services/shared_preferences_service.dart';
import 'package:car_store_app/features/order/data/model/order_model.dart';
import 'package:car_store_app/features/order/data/model/order_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

//===================OrderRemoteDataSource==================
abstract class OrderRemoteDataSource {
  Future<OrderResponseModel> buyOrderDataSource({
    required int carId,
    String? userNotes,
  });

  Future<OrderResponseModel> rentOrderDataSource({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  });

  Future<OrderResponseModel> installmentOrderDataSource({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  });

  Future<void> cancelOrderDataSource({required int orderId});

  Future<List<OrderModel>> getMyOrderDataSource();
}

@Injectable(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;
  final token = SharedPreferencesService.getToken();

  OrderRemoteDataSourceImpl({required this.apiService});

  //===================buyOrderDataSource==================
  @override
  Future<OrderResponseModel> buyOrderDataSource({
    required int carId,
    String? userNotes,
  }) async {
    final data = await apiService.post(
      endPoint: 'Orders/buy',
      data: {'CarId': carId, 'UserNotes': userNotes},
    );
    return OrderResponseModel.fromJson(data);
  }

  //===================cancelOrderDataSource==================
  @override
  Future<void> cancelOrderDataSource({required int orderId}) async {
    await apiService.put(endPoint: 'Orders/${orderId}/cancel');
  }

  //===================getMyOrderDataSource==================
  @override
  Future<List<OrderModel>> getMyOrderDataSource() async {
    final data = await apiService.get(
      endPoint: 'Orders/my-orders',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    List<OrderModel> myOrders = [];
    for (var item in data) {
      myOrders.add(OrderModel.fromJson(item));
    }
    return myOrders;
  }

  //===================installmentOrderDataSource==================
  @override
  Future<OrderResponseModel> installmentOrderDataSource({
    required int carId,
    required int installmentMonth,
    String? userNotes,
  }) async {
    final data = await apiService.post(
      endPoint: 'Orders/installment',
      data: {
        'CarId': carId,
        'InstallmentMonths': installmentMonth,
        'Notes': userNotes,
      },
    );
    return OrderResponseModel.fromJson(data);
  }

  //===================rentOrderDataSource==================
  @override
  Future<OrderResponseModel> rentOrderDataSource({
    required int carId,
    required DateTime startDate,
    required DateTime endDate,
    String? userNotes,
  }) async {
    final data = await apiService.post(
      endPoint: 'Orders/rent',
      data: {
        'CarId': carId,
        'StartDate': startDate,
        'EndDate': endDate,
        'UserNotes': userNotes,
      },
    );
    return OrderResponseModel.fromJson(data);
  }
}
