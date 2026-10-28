import 'package:bloc/bloc.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/add_car_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/delete_car_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/get_car_by_id_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/get_car_images_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/get_my_cars_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/get_public_cars_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/search_cars_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/cars/update_car_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cars_event.dart';

part 'cars_state.dart';

@lazySingleton
class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetPublicCarsUseCase getPublicCarsUseCase;
  final GetCarByIdUsecase getCarByIdUsecase;
  final GetCarImagesUsecase getCarImagesUsecase;
  final SearchCarsUsecase searchCarsUsecase;
  final GetMyCarsUsecase getMyCarsUsecase;
  final AddCarUsecase addCarUsecase;
  final DeleteCarUsecase deleteCarUsecase;
  final UpdateCarUsecase updateCarUsecase;

  CarsBloc(
    this.getPublicCarsUseCase,
    this.getCarByIdUsecase,
    this.getCarImagesUsecase,
    this.searchCarsUsecase,
    this.getMyCarsUsecase,
    this.addCarUsecase,
    this.deleteCarUsecase,
    this.updateCarUsecase,
  ) : super(const CarsState()) {

    // =================== GetPublicCarsEvent ===================
    on<GetPublicCarsEvent>((event, emit) async {
      emit(state.copyWith(getPublicCarsStatus: StatusEnum.loading));
      final result = await getPublicCarsUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getPublicCarsStatus: StatusEnum.failure,
          ),
        ),
        (cars) => emit(
          state.copyWith(
            allCars: cars,
            getPublicCarsStatus: StatusEnum.success,
          ),
        ),
      );
    });

    // =================== GetCarByIdEvent ===================
    on<GetCarByIdEvent>((event, emit) async {
      emit(state.copyWith(getCarByIdStatus: StatusEnum.loading));
      final result = await getCarByIdUsecase(event.id);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getCarByIdStatus: StatusEnum.failure,
          ),
        ),
        (car) => emit(
          state.copyWith(car: car, getCarByIdStatus: StatusEnum.success),
        ),
      );
    });

    // =================== GetCarImagesEvent ===================
    on<GetCarImagesEvent>((event, emit) async {
      emit(state.copyWith(getCarImagesStatus: StatusEnum.loading));
      final result = await getCarImagesUsecase(event.id);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getCarImagesStatus: StatusEnum.failure,
          ),
        ),
        (images) => emit(
          state.copyWith(
            carImages: images,
            getCarImagesStatus: StatusEnum.success,
          ),
        ),
      );
    });

    // =================== SearchCarsEvent ===================
    on<SearchCarsEvent>((event, emit) async {
      emit(state.copyWith(searchCarsStatus: StatusEnum.loading));
      final result = await searchCarsUsecase(
        brandId: event.brandId,
        model: event.model,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        year: event.year,
        fuelType: event.fuelType,
        gearType: event.gearType,
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            searchCarsStatus: StatusEnum.failure,
          ),
        ),
        (cars) => emit(
          state.copyWith(allCars: cars, searchCarsStatus: StatusEnum.success),
        ),
      );
    });

    // =================== GetMyCarsEvent ===================
    on<GetMyCarsEvent>((event, emit) async {
      emit(state.copyWith(getMyCarsStatus: StatusEnum.loading));
      final result = await getMyCarsUsecase();
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getMyCarsStatus: StatusEnum.failure,
          ),
        ),
        (cars) => emit(
          state.copyWith(myCars: cars, getMyCarsStatus: StatusEnum.success),
        ),
      );
    });

    // =================== AddCarEvent ===================
    on<AddCarEvent>((event, emit) async {
      emit(state.copyWith(addCarStatus: StatusEnum.loading));
      final result = await addCarUsecase(event.car);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            addCarStatus: StatusEnum.failure,
          ),
        ),
        (carId) => emit(
          state.copyWith(addedCarId: carId, addCarStatus: StatusEnum.success),
        ),
      );
    });

    // =================== DeleteCarEvent ===================
    on<DeleteCarEvent>((event, emit) async {
      emit(state.copyWith(deleteCarStatus: StatusEnum.loading));
      final result = await deleteCarUsecase(event.id);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            deleteCarStatus: StatusEnum.failure,
          ),
        ),
        (_) => emit(state.copyWith(deleteCarStatus: StatusEnum.success)),
      );
    });

    // =================== UpdateCarEvent ===================
    on<UpdateCarEvent>((event, emit) async {
      emit(state.copyWith(updateCarStatus: StatusEnum.loading));
      final result = await updateCarUsecase(event.id, event.car);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            updateCarStatus: StatusEnum.failure,
          ),
        ),
        (_) => emit(state.copyWith(updateCarStatus: StatusEnum.success)),
      );
    });
  }
}
