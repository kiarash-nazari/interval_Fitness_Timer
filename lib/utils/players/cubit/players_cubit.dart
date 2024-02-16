import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  final _player = AudioPlayer();

  void startActiviti(String audio) async {
    emit(StartActivitiAudio(audio));
    await _player.setAsset(audio);
    await _player.play();
  }
}
