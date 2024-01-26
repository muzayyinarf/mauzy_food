part of 'list_favorite_bloc.dart';

@freezed
class ListFavoriteEvent with _$ListFavoriteEvent {
  const factory ListFavoriteEvent.started() = _Started;
  const factory ListFavoriteEvent.get() = _Get;
  const factory ListFavoriteEvent.add(Restaurant data) = _Add;
  const factory ListFavoriteEvent.remove(String id) = _Remove;
  const factory ListFavoriteEvent.isFavorite(String id) = _IsFavorite;
}
