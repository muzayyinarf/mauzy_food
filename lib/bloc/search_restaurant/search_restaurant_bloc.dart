import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';

import '../../data/models/response/search_restaurant_response_model.dart';

part 'search_restaurant_event.dart';
part 'search_restaurant_state.dart';
part 'search_restaurant_bloc.freezed.dart';

class SearchRestaurantBloc
    extends Bloc<SearchRestaurantEvent, SearchRestaurantState> {
  final RestaurantRemoteDatasource datasource;
  SearchRestaurantBloc(this.datasource) : super(const _Initial()) {
    on<_DoSearch>((event, emit) async {
      emit(const _Loading());
      await Future.delayed(const Duration(milliseconds: 1000));
      try {
        final result = await datasource.searchRestaurant(event.keyword);
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
