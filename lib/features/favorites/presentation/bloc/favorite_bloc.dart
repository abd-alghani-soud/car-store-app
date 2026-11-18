import 'package:bloc/bloc.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/favorites/domain/usecase/get_my_favorites_usecase.dart';
import 'package:car_store_app/features/favorites/domain/usecase/toggle_favorite_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

@lazySingleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetMyFavoritesUseCase getMyFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoriteBloc(this.getMyFavoritesUseCase, this.toggleFavoriteUseCase)
    : super(const FavoriteState()) {
    // =================== GetMyFavoritesEvent ===================
    on<GetMyFavoritesEvent>((event, emit) async {
      emit(state.copyWith(
        getMyFavoritesStatus: StatusEnum.loading,
        toggleFavoriteStatus: StatusEnum.initial,
      ));
      final result = await getMyFavoritesUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            getMyFavoritesStatus: StatusEnum.failure,
            toggleFavoriteStatus: StatusEnum.initial,
          ),
        ),
        (favorites) => emit(
          state.copyWith(
            favorites: favorites,
            getMyFavoritesStatus: StatusEnum.success,
            toggleFavoriteStatus: StatusEnum.initial,
          ),
        ),
      );
    });

    // =================== ToggleFavoriteEvent ===================
    on<ToggleFavoriteEvent>((event, emit) async {
      emit(state.copyWith(toggleFavoriteStatus: StatusEnum.loading));
      final result = await toggleFavoriteUseCase(event.carId);
      result.fold(
        (l) => emit(
          state.copyWith(
            messageError: l.message,
            toggleFavoriteStatus: StatusEnum.failure,
          ),
        ),
        (message) {
          emit(state.copyWith(toggleFavoriteStatus: StatusEnum.success));
          add(GetMyFavoritesEvent());
        },
      );
    });
  }
}
