import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  final _alertPlayer = AudioPlayer();
  final _musicPlayer = AudioPlayer();

  void startActiviti(String audio) async {
    emit(StartActivitiAudio(audio));
    await _alertPlayer.setAsset(audio);
    await _alertPlayer.play();
  }

  void startMusic({required String audioLink}) async {
    await _musicPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioLink)));
    await _musicPlayer.play();
  }

  Future<void> pauseMusic() async {
    await _musicPlayer.pause();
  }

  Future<void> resumeMusic() async {
    await _musicPlayer.play();
  }
}
