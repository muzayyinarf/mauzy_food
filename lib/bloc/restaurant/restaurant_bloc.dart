import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/restaurant.dart';
import '../../data/services/restaurant_services.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';
part 'restaurant_bloc.freezed.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(const _Initial()) {
    on<_GetAllRestaurant>((event, emit) async {
      RestaurantService restaurantService = RestaurantService();
      final localRestaurants = await restaurantService.getLocalRestaurants();

      emit(const _Loading());
      emit(_Loaded(localRestaurants));
    });
  }
}
