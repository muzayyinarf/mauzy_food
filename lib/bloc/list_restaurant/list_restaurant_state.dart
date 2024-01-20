part of 'list_restaurant_bloc.dart';

@freezed
class ListRestaurantState with _$ListRestaurantState {
  const factory ListRestaurantState.initial() = _Initial;
  const factory ListRestaurantState.loading() = _Loading;
  const factory ListRestaurantState.loaded(ListRestaurantResponseModel data) =
      _Loaded;
  const factory ListRestaurantState.error(String message) = _Error;
}
