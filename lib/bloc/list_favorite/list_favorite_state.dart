part of 'list_favorite_bloc.dart';

@freezed
class ListFavoriteState with _$ListFavoriteState {
  const factory ListFavoriteState.initial() = _Initial;
  const factory ListFavoriteState.loading() = _Loading;
  const factory ListFavoriteState.loaded(List<Restaurant> data) = _Loaded;
  const factory ListFavoriteState.error(String message) = _Error;
}
