part of 'detail_restaurant_bloc.dart';

@freezed
class DetailRestaurantState with _$DetailRestaurantState {
  const factory DetailRestaurantState.initial() = _Initial;
  const factory DetailRestaurantState.loading() = _Loading;
  const factory DetailRestaurantState.loaded(
      DetailRestaurantResponseModel data) = _Loaded;
  const factory DetailRestaurantState.error(String message) = _Error;
}
