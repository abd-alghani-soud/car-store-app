part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

// =================== GetMyFavoritesEvent ===================
class GetMyFavoritesEvent extends FavoriteEvent {}

// =================== ToggleFavoriteEvent ===================
class ToggleFavoriteEvent extends FavoriteEvent {
  final int carId;

  const ToggleFavoriteEvent({required this.carId});

  @override
  List<Object?> get props => [carId];
}
