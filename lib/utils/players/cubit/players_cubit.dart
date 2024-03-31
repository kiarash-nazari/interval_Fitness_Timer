import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  final _alertPlayer = AudioPlayer();
  final _musicPlayer = AudioPlayer();
  String currentAudioName = "mix1";
  Duration _currentPosition = Duration.zero;
  // Duration _currentPositionAlert = Duration.zero;

  void startActivity(String audio) async {
    emit(StartActivitiAudio(audio));
    try {
      await _alertPlayer.setAsset(audio);
    } catch (e) {
      // Handle error if setting asset fails
      print('Error setting asset: $e');
    }
    emit(IsPlayingAudio(currentAudioName));
    await _alertPlayer.play();
    // _currentPositionAlert = _alertPlayer.position;
  }

  void startMusicOnline({required String audioLink}) async {
    try {
      await _musicPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioLink)));
    } catch (e) {
      // Handle error if setting audio source fails
    }
    await _musicPlayer.seek(_currentPosition);
    await _musicPlayer.play();
    _currentPosition = _musicPlayer.position;
  }

  void startMusicFile({required String name}) async {
    currentAudioName = name;
    var directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$name';
    await _musicPlayer.setFilePath(filePath);
    await _musicPlayer.seek(_currentPosition);
    _currentPosition = Duration.zero;
    emit(IsPlayingAudio(currentAudioName));
    await _musicPlayer.play();
  }

  Future<void> pauseMusic() async {
    await _musicPlayer.pause();
    await _alertPlayer.pause();
    currentAudioName = "";
    emit(const IsNotPlayingAudio());
  }

  Future<void> stopMusic() async {
    await _musicPlayer.stop();
    await _alertPlayer.stop();
    currentAudioName = "";
    emit(PlayersInitial());
  }

  Future<void> resumeMusic(String name) async {
    emit(IsPlayingAudio(name));
    await _musicPlayer.play();
  }

  Future<void> resumeAlert() async {
    await _alertPlayer.play();
  }

  @override
  Future<void> close() {
    _musicPlayer.dispose();
    _alertPlayer.dispose();
    return super.close();
  }
}
