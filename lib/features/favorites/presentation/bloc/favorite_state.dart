part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<CarEntity> favorites;
  final String? messageError;
  final StatusEnum getMyFavoritesStatus;
  final StatusEnum toggleFavoriteStatus;

  const FavoriteState({
    this.favorites = const [],
    this.messageError,
    this.getMyFavoritesStatus = StatusEnum.initial,
    this.toggleFavoriteStatus = StatusEnum.initial,
  });

  @override
  List<Object?> get props => [
    favorites,
    messageError,
    getMyFavoritesStatus,
    toggleFavoriteStatus,
  ];

  FavoriteState copyWith({
    List<CarEntity>? favorites,
    String? messageError,
    StatusEnum? getMyFavoritesStatus,
    StatusEnum? toggleFavoriteStatus,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
      messageError: messageError ?? this.messageError,
      getMyFavoritesStatus: getMyFavoritesStatus ?? this.getMyFavoritesStatus,
      toggleFavoriteStatus: toggleFavoriteStatus ?? this.toggleFavoriteStatus,
    );
  }
}
