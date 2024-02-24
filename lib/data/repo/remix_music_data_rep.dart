import 'package:interval_timer/data/model/remix_music_model.dart';
import 'package:interval_timer/data/res/remix_music_data_src.dart';

abstract class RemixMusicInternalDataRep {
  List<RemixMusicModel> myData();
}

class MusicDataRep implements RemixMusicInternalDataRep {
  final RemixMusicDataSrc _remixMusicDataSrc;

  MusicDataRep(this._remixMusicDataSrc);

  @override
  List<RemixMusicModel> myData() {
    return _remixMusicDataSrc.myData();
  }
}
