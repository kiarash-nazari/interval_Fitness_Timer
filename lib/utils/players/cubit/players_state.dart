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

final class IsPlayingAudio extends PlayersState {
  final String name;

  const IsPlayingAudio(this.name);

  @override
  List<Object> get props => [name];
}

final class IsNotPlayingAudio extends PlayersState {
  const IsNotPlayingAudio();

  @override
  List<Object> get props => [];
}
