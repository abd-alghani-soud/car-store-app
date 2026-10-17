part of 'cars_bloc.dart';

abstract class CarsEvent extends Equatable {
  const CarsEvent();

  @override
  List<Object?> get props => [];
}

// =================== GetPublicCarsEvent ===================
class GetPublicCarsEvent extends CarsEvent {}

// =================== GetCarByIdEvent ===================
class GetCarByIdEvent extends CarsEvent {
  final int id;

  const GetCarByIdEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

// =================== GetCarImagesEvent ===================
class GetCarImagesEvent extends CarsEvent {
  final int id;

  const GetCarImagesEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

// =================== SearchCarsEvent ===================
class SearchCarsEvent extends CarsEvent {
  final int? brandId;
  final String? model;
  final double? minPrice;
  final double? maxPrice;
  final int? year;
  final String? fuelType;
  final String? gearType;

  const SearchCarsEvent({
    this.brandId,
    this.model,
    this.minPrice,
    this.maxPrice,
    this.year,
    this.fuelType,
    this.gearType,
  });

  @override
  List<Object?> get props => [
    brandId,
    model,
    minPrice,
    maxPrice,
    year,
    fuelType,
    gearType,
  ];
}

// =================== GetMyCarsEvent ===================
class GetMyCarsEvent extends CarsEvent {}

// =================== AddCarEvent ===================
class AddCarEvent extends CarsEvent {
  final CarEntity car;

  const AddCarEvent({required this.car});

  @override
  List<Object?> get props => [car];
}

// =================== DeleteCarEvent ===================
class DeleteCarEvent extends CarsEvent {
  final int id;

  const DeleteCarEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

// =================== UpdateCarEvent ===================
class UpdateCarEvent extends CarsEvent {
  final int id;
  final CarEntity car;

  const UpdateCarEvent({required this.id, required this.car});

  @override
  List<Object?> get props => [id, car];
}
