import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/data/models/request/review_restaurant_request_model.dart';
import 'package:mauzy_food/data/models/response/review_restaurant_response_model.dart';

part 'add_review_event.dart';
part 'add_review_state.dart';
part 'add_review_bloc.freezed.dart';

class AddReviewBloc extends Bloc<AddReviewEvent, AddReviewState> {
  final RestaurantRemoteDatasource datasource;
  AddReviewBloc(this.datasource) : super(const _Initial()) {
    on<_Post>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.addReview(event.data);
        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      } catch (e) {
        emit(_Error('Error $e'));
      }
    });

    on<_Started>((event, emit) => emit(const _Initial()));
  }
}
