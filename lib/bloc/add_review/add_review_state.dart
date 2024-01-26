part of 'add_review_bloc.dart';

@freezed
class AddReviewState with _$AddReviewState {
  const factory AddReviewState.initial() = _Initial;
  const factory AddReviewState.loading() = _Loading;
  const factory AddReviewState.loaded(ReviewRestaurantResponseModel data) =
      _Loaded;
  const factory AddReviewState.error(String message) = _Error;
}
