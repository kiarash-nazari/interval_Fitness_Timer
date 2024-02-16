part of 'players_cubit.dart';

sealed class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

final class PlayersInitial extends PlayersState {}

final class StartActivitiAudio extends PlayersState {
  final String audio;

  const StartActivitiAudio(this.audio);

  @override
  List<Object> get props => [audio];
}
