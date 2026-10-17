part of 'brands_bloc.dart';

class BrandsState extends Equatable {
  final List<BrandEntity> allBrands;
  final String? messageError;
  final StatusEnum getAllBrandsStatus;
  final StatusEnum updateBrandStatus;
  final StatusEnum deleteBrandStatus;
  final StatusEnum createBrandStatus;
  final StatusEnum getBrandByIdStatus;
  final BrandEntity? brand;

  const BrandsState({
    this.allBrands = const [],
    this.messageError,
    this.getAllBrandsStatus = StatusEnum.initial,
    this.updateBrandStatus = StatusEnum.initial,
    this.deleteBrandStatus = StatusEnum.initial,
    this.createBrandStatus = StatusEnum.initial,
    this.getBrandByIdStatus = StatusEnum.initial,
    this.brand,
  });

  @override
  List<Object?> get props => [
        allBrands,
        messageError,
        getAllBrandsStatus,
        updateBrandStatus,
        deleteBrandStatus,
        createBrandStatus,
        getBrandByIdStatus,
        brand,
      ];

  BrandsState copyWith({
    List<BrandEntity>? allBrands,
    String? messageError,
    StatusEnum? getAllBrandsStatus,
    StatusEnum? updateBrandStatus,
    StatusEnum? deleteBrandStatus,
    StatusEnum? createBrandStatus,
    StatusEnum? getBrandByIdStatus,
    BrandEntity? brand,
  }) {
    return BrandsState(
      allBrands: allBrands ?? this.allBrands,
      messageError: messageError ?? this.messageError,
      getAllBrandsStatus: getAllBrandsStatus ?? this.getAllBrandsStatus,
      updateBrandStatus: updateBrandStatus ?? this.updateBrandStatus,
      deleteBrandStatus: deleteBrandStatus ?? this.deleteBrandStatus,
      createBrandStatus: createBrandStatus ?? this.createBrandStatus,
      getBrandByIdStatus: getBrandByIdStatus ?? this.getBrandByIdStatus,
      brand: brand ?? this.brand,
    );
  }
}
