part of 'body_compose_cubit.dart';

sealed class BodyComposeState extends Equatable {
  const BodyComposeState();

  @override
  List<Object> get props => [];
}

final class BodyComposeInitial extends BodyComposeState {}

final class BodyComposeUpdatePercentage extends BodyComposeState {
  const BodyComposeUpdatePercentage({required this.percentage});

  final double percentage;

  @override
  List<Object> get props => [percentage];
}
