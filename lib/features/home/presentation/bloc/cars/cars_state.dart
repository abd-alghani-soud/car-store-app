part of 'cars_bloc.dart';

class CarsState extends Equatable {
  final List<CarEntity> allCars;
  final List<CarEntity> myCars;
  final List<String> carImages;
  final CarEntity? car;
  final String? messageError;
  final StatusEnum getPublicCarsStatus;
  final StatusEnum getCarByIdStatus;
  final StatusEnum getCarImagesStatus;
  final StatusEnum searchCarsStatus;
  final StatusEnum getMyCarsStatus;
  final StatusEnum addCarStatus;
  final StatusEnum deleteCarStatus;
  final StatusEnum updateCarStatus;
  final int? addedCarId;

  const CarsState({
    this.allCars = const [],
    this.myCars = const [],
    this.carImages = const [],
    this.car,
    this.messageError,
    this.getPublicCarsStatus = StatusEnum.initial,
    this.getCarByIdStatus = StatusEnum.initial,
    this.getCarImagesStatus = StatusEnum.initial,
    this.searchCarsStatus = StatusEnum.initial,
    this.getMyCarsStatus = StatusEnum.initial,
    this.addCarStatus = StatusEnum.initial,
    this.deleteCarStatus = StatusEnum.initial,
    this.updateCarStatus = StatusEnum.initial,
    this.addedCarId,
  });

  @override
  List<Object?> get props => [
        allCars,
        myCars,
        carImages,
        car,
        messageError,
        getPublicCarsStatus,
        getCarByIdStatus,
        getCarImagesStatus,
        searchCarsStatus,
        getMyCarsStatus,
        addCarStatus,
        deleteCarStatus,
        updateCarStatus,
        addedCarId,
      ];

  CarsState copyWith({
    List<CarEntity>? allCars,
    List<CarEntity>? myCars,
    List<String>? carImages,
    CarEntity? car,
    String? messageError,
    StatusEnum? getPublicCarsStatus,
    StatusEnum? getCarByIdStatus,
    StatusEnum? getCarImagesStatus,
    StatusEnum? searchCarsStatus,
    StatusEnum? getMyCarsStatus,
    StatusEnum? addCarStatus,
    StatusEnum? deleteCarStatus,
    StatusEnum? updateCarStatus,
    int? addedCarId,
  }) {
    return CarsState(
      allCars: allCars ?? this.allCars,
      myCars: myCars ?? this.myCars,
      carImages: carImages ?? this.carImages,
      car: car ?? this.car,
      messageError: messageError ?? this.messageError,
      getPublicCarsStatus: getPublicCarsStatus ?? this.getPublicCarsStatus,
      getCarByIdStatus: getCarByIdStatus ?? this.getCarByIdStatus,
      getCarImagesStatus: getCarImagesStatus ?? this.getCarImagesStatus,
      searchCarsStatus: searchCarsStatus ?? this.searchCarsStatus,
      getMyCarsStatus: getMyCarsStatus ?? this.getMyCarsStatus,
      addCarStatus: addCarStatus ?? this.addCarStatus,
      deleteCarStatus: deleteCarStatus ?? this.deleteCarStatus,
      updateCarStatus: updateCarStatus ?? this.updateCarStatus,
      addedCarId: addedCarId ?? this.addedCarId,
    );
  }
}
