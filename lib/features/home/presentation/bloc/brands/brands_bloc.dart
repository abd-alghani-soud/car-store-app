import 'package:bloc/bloc.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/usecase/brands/create_brand_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/brands/delete_brand_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/brands/get_all_brands_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/brands/get_brand_by_id_usecase.dart';
import 'package:car_store_app/features/home/domain/usecase/brands/update_brand_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'brands_event.dart';

part 'brands_state.dart';

@lazySingleton
class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetAllBrandsUsecase getAllBrandsUsecase;
  final GetBrandByIdUsecase getBrandByIdUsecase;
  final CreateBrandUsecase createBrandUsecase;
  final DeleteBrandUsecase deleteBrandUsecase;
  final UpdateBrandUsecase updateBrandUsecase;

  BrandsBloc(
    this.getAllBrandsUsecase,
    this.getBrandByIdUsecase,
    this.createBrandUsecase,
    this.deleteBrandUsecase,
    this.updateBrandUsecase,
  ) : super(const BrandsState()) {
    // =================== GetAllBrandsEvent ===================
    on<GetAllBrandsEvent>((event, emit) async {
      emit(state.copyWith(getAllBrandsStatus: StatusEnum.loading));
      final result = await getAllBrandsUsecase();
      result.fold(
        (l) {
          debugPrint('=== GetAllBrandsEvent ERROR: ${l.message} ===');
          emit(
            state.copyWith(
              messageError: l.message,
              getAllBrandsStatus: StatusEnum.failure,
            ),
          );
        },
        (brands) {
          debugPrint('=== GetAllBrandsEvent SUCCESS: ${brands.length} brands loaded ===');
          emit(
            state.copyWith(
              allBrands: brands,
              getAllBrandsStatus: StatusEnum.success,
            ),
          );
        },
      );
    });

    // =================== GetBrandByIdEvent ===================
    on<GetBrandByIdEvent>((event, emit) async {
      emit(state.copyWith(getBrandByIdStatus: StatusEnum.loading));
      final result = await getBrandByIdUsecase(event.id);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getBrandByIdStatus: StatusEnum.failure,
          ),
        ),
        (brand) => emit(
          state.copyWith(brand: brand, getBrandByIdStatus: StatusEnum.success),
        ),
      );
    });

    // =================== CreateBrandEvent ===================
    on<CreateBrandEvent>((event, emit) async {
      emit(state.copyWith(createBrandStatus: StatusEnum.loading));
      final result = await createBrandUsecase(event.brand);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            createBrandStatus: StatusEnum.failure,
          ),
        ),
        (brand) => emit(
          state.copyWith(brand: brand, createBrandStatus: StatusEnum.success),
        ),
      );
    });

    // =================== DeleteBrandEvent ===================
    on<DeleteBrandEvent>((event, emit) async {
      emit(state.copyWith(deleteBrandStatus: StatusEnum.loading));
      final result = await deleteBrandUsecase(event.id);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            deleteBrandStatus: StatusEnum.failure,
          ),
        ),
        (_) => emit(state.copyWith(deleteBrandStatus: StatusEnum.success)),
      );
    });

    // =================== UpdateBrandEvent ===================
    on<UpdateBrandEvent>((event, emit) async {
      emit(state.copyWith(updateBrandStatus: StatusEnum.loading));
      final result = await updateBrandUsecase(event.id, event.brand);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            updateBrandStatus: StatusEnum.failure,
          ),
        ),
        (_) => emit(state.copyWith(updateBrandStatus: StatusEnum.success)),
      );
    });
  }
}
