import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/data/models/response/list_restaurant_response_model.dart';

part 'list_restaurant_event.dart';
part 'list_restaurant_state.dart';
part 'list_restaurant_bloc.freezed.dart';

class ListRestaurantBloc
    extends Bloc<ListRestaurantEvent, ListRestaurantState> {
  final RestaurantRemoteDatasource datasource;
  ListRestaurantBloc(this.datasource) : super(const _Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      await Future.delayed(const Duration(milliseconds: 1000));
      try {
        final result = await datasource.getListRestaurant();

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
