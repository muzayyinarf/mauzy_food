import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mauzy_food/utils/background_services.dart';
import 'package:mauzy_food/utils/date_time_helper.dart';
import 'package:mauzy_food/utils/subscription_preference.dart';

part 'scheduling_event.dart';
part 'scheduling_state.dart';
part 'scheduling_bloc.freezed.dart';

class SchedulingBloc extends Bloc<SchedulingEvent, SchedulingState> {
  final SubscriptionPreference subscriptionPreference;
  SchedulingBloc(this.subscriptionPreference) : super(const SchedulingState()) {
    on<_ToogleScheduling>((event, emit) async {
      if (event.value) {
        if (kDebugMode) {
          print('Scheduling Restaurant Activated');
        }
        await AndroidAlarmManager.periodic(
          const Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
        subscriptionPreference.setSubscription(event.value);
        emit(state.copyWith(isScheduled: event.value));
      } else {
        if (kDebugMode) {
          print('Scheduling Restaurant Canceled');
        }
        await AndroidAlarmManager.cancel(1);
        subscriptionPreference.setSubscription(event.value);
        emit(state.copyWith(isScheduled: event.value));
      }
    });

    on<_GetScheduling>((event, emit) async {
      final subscription = await subscriptionPreference.getSubscription();
      if (subscription) {
        if (kDebugMode) {
          print('Scheduling Restaurant Activated');
        }
        await AndroidAlarmManager.periodic(
          const Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
      } else {
        if (kDebugMode) {
          print('Scheduling Restaurant Canceled');
        }
        await AndroidAlarmManager.cancel(1);
      }
      emit(state.copyWith(isScheduled: subscription));
    });
  }
}
