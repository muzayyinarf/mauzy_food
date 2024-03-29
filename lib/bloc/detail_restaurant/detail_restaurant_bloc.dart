import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';

part 'detail_restaurant_event.dart';
part 'detail_restaurant_state.dart';
part 'detail_restaurant_bloc.freezed.dart';

class DetailRestaurantBloc
    extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  final RestaurantRemoteDatasource datasource;
  DetailRestaurantBloc(this.datasource) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getDetailRestaurant(event.id);
        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      } catch (e) {
        emit(_Error('Error: $e'));
      }
    });
  }
}
