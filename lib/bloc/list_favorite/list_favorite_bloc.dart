import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/datasources/favorite_local_datasource.dart';

import '../../data/models/restaurant.dart';

part 'list_favorite_event.dart';
part 'list_favorite_state.dart';
part 'list_favorite_bloc.freezed.dart';

class ListFavoriteBloc extends Bloc<ListFavoriteEvent, ListFavoriteState> {
  final FavoriteLocalDatasource datasource;
  ListFavoriteBloc(this.datasource) : super(const _Loaded([])) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      try {
        final List<Restaurant> result = await datasource.getAllFavorites();
        emit(_Loaded(result));
      } catch (e) {
        emit(_Error('Error: $e'));
      }
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());
      try {
        await datasource.insertFavorite(event.data);
        final List<Restaurant> result = await datasource.getAllFavorites();
        emit(_Loaded(result));
      } catch (e) {
        emit(_Error('Error: $e'));
      }
    });

    on<_Remove>((event, emit) async {
      emit(const _Loading());
      try {
        await datasource.deleteFavorite(event.id);
        final List<Restaurant> result = await datasource.getAllFavorites();
        emit(_Loaded(result));
      } catch (e) {
        emit(_Error('Error: $e'));
      }
    });
  }
}
