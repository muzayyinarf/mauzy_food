part of 'search_restaurant_bloc.dart';

@freezed
class SearchRestaurantState with _$SearchRestaurantState {
  const factory SearchRestaurantState.initial() = _Initial;
  const factory SearchRestaurantState.loading() = _Loading;
  const factory SearchRestaurantState.loaded(
      SearchRestaurantResponseModel data) = _Loaded;
  const factory SearchRestaurantState.error(String message) = _Error;
}
