part of 'scheduling_bloc.dart';

@freezed
class SchedulingEvent with _$SchedulingEvent {
  const factory SchedulingEvent.getScheduling() = _GetScheduling;
  const factory SchedulingEvent.toogleScheduling(bool value) =
      _ToogleScheduling;
}
