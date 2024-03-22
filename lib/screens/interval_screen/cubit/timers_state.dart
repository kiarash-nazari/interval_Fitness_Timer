part of 'timers_cubit.dart';

sealed class TimersState extends Equatable {
  const TimersState();

  @override
  List<Object> get props => [];
}

final class TimersInitial extends TimersState {}

final class StartOfActiviti extends TimersState {
  const StartOfActiviti({
    required this.calculatedActiviti,
    required this.centerDigit,
  });
  final double calculatedActiviti;
  final int centerDigit;

  @override
  List<Object> get props => [calculatedActiviti, centerDigit];
}

final class EndOfActiviti extends TimersState {}

final class StartOfRest extends TimersState {
  const StartOfRest({
    required this.calculatedRest,
    required this.centerDigit,
  });
  final double calculatedRest;
  final int centerDigit;

  @override
  List<Object> get props => [calculatedRest, centerDigit];
}

final class EndOfRest extends TimersState {}

final class IntervalProgressing extends TimersState {}

final class EndOfProgressing extends TimersState {}

final class ThreeSecondsBeforeStop extends TimersState {}

final class ThreeSecondsBeforeStart extends TimersState {}

final class PauseInActiviti extends TimersState {}

final class PauseInRest extends TimersState {}

final class Stop extends TimersState {}
