part of 'list_restaurant_bloc.dart';

@freezed
class ListRestaurantEvent with _$ListRestaurantEvent {
  const factory ListRestaurantEvent.started() = _Started;
  const factory ListRestaurantEvent.get() = _Get;
}
