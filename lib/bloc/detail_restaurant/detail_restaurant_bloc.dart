import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/models/restaurant.dart';

import '../../data/services/restaurant_services.dart';

part 'detail_restaurant_event.dart';
part 'detail_restaurant_state.dart';
part 'detail_restaurant_bloc.freezed.dart';

class DetailRestaurantBloc
    extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  DetailRestaurantBloc() : super(const _Initial()) {
    on<_GetDetail>((event, emit) async {
      RestaurantService restaurantService = RestaurantService();
      final localRestaurants =
          await restaurantService.getRestaurantById(event.id);

      emit(const _Loading());
      emit(_Loaded(localRestaurants!));
    });
  }
}
