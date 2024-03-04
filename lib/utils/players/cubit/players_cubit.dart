import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  final _alertPlayer = AudioPlayer();
  final _musicPlayer = AudioPlayer();
  String nameA = "mix1";
  Duration _currentPosition = Duration.zero;

  void startActiviti(String audio) async {
    emit(StartActivitiAudio(audio));
    await _alertPlayer.setAsset(audio);
    emit(IsPlayingAudio(nameA));

    await _alertPlayer.play();
  }

  void startMusicOnline({required String audioLink}) async {
    await _musicPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioLink)));
    await _musicPlayer.seek(_currentPosition);
    await _musicPlayer.play();
    _currentPosition = _musicPlayer.position;
  }

  void startMusicFile({required String name}) async {
    nameA = name;
    var directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$name';
    await _musicPlayer.setFilePath(filePath);
    await _musicPlayer.seek(_currentPosition);

    _currentPosition = Duration.zero;
    emit(IsPlayingAudio(name));
    await _musicPlayer.play();
  }

  Future<void> pauseMusic() async {
    await _musicPlayer.pause();
    nameA = "";
    emit(const IsNotPlayingAudio());
  }

  Future<void> resumeMusic() async {
    await _musicPlayer.play();
  }
}
