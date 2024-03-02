import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  final _alertPlayer = AudioPlayer();
  final _musicPlayer = AudioPlayer();
  Duration _currentPosition = Duration.zero;
  String? pName;

  void startActiviti(String audio) async {
    emit(StartActivitiAudio(audio));
    await _alertPlayer.setAsset(audio);
    await _alertPlayer.play();
  }

  void startMusicOnline({required String audioLink}) async {
    await _musicPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioLink)));
    await _musicPlayer.seek(_currentPosition);
    await _musicPlayer.play();
    _currentPosition = await _musicPlayer.position;
  }

  void startMusicFile({required String name}) async {
    var directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$name';
    await _musicPlayer.setFilePath(filePath);
    await _musicPlayer.seek(_currentPosition);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh" +
        pName.toString());
    print(name);
    if (pName != name) {
      _currentPosition = Duration.zero;
      await _musicPlayer.play();
    }
    if (pName == name) {
      await _musicPlayer.play();
      _currentPosition = _musicPlayer.position;
    }
    pName = name;
  }

  Future<void> pauseMusic() async {
    await _musicPlayer.pause();
  }

  Future<void> resumeMusic() async {
    await _musicPlayer.play();
  }
}
