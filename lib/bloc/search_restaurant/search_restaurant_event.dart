part of 'search_restaurant_bloc.dart';

@freezed
class SearchRestaurantEvent with _$SearchRestaurantEvent {
  const factory SearchRestaurantEvent.started() = _Started;
  const factory SearchRestaurantEvent.doSearch(String keyword) = _DoSearch;
}
