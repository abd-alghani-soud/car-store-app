part of 'brands_bloc.dart';

abstract class BrandsEvent extends Equatable {
  const BrandsEvent();

  @override
  List<Object> get props => [];
}

// =================== GetAllBrandsEvent ===================
class GetAllBrandsEvent extends BrandsEvent {}

// =================== GetBrandByIdEvent ===================
class GetBrandByIdEvent extends BrandsEvent {
  final int id;

  const GetBrandByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

// =================== CreateBrandEvent ===================
class CreateBrandEvent extends BrandsEvent {
  final BrandEntity brand;

  const CreateBrandEvent({required this.brand});

  @override
  List<Object> get props => [brand];
}

// =================== DeleteBrandEvent ===================
class DeleteBrandEvent extends BrandsEvent {
  final int id;

  const DeleteBrandEvent({required this.id});

  @override
  List<Object> get props => [id];
}

// =================== UpdateBrandEvent ===================
class UpdateBrandEvent extends BrandsEvent {
  final int id;
  final BrandEntity brand;

  const UpdateBrandEvent({required this.id, required this.brand});

  @override
  List<Object> get props => [id, brand];
}
