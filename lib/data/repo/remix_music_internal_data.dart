import 'package:interval_timer/data/model/remix_music_model.dart';

List<Map<String, dynamic>> json = [
  {
    "bgImag": "assets/img/cover1.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3",
    "musicPath": "assets/"
  },
  {
    "bgImag": "assets/img/cover2.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix2.mp3",
    "musicPath": "assets/"
  },
  {
    "bgImag": "assets/img/cover3.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix3.mp3",
    "musicPath": "assets/"
  },
  {
    "bgImag": "assets/img/cover4.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix4.mp3",
    "musicPath": "assets/"
  },
  {
    "bgImag": "assets/img/cover5.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix5.mp3",
    "musicPath": "assets/"
  },
];

abstract class RemixMusicInternalData {
  List<RemixMusicModel> myData();
}

class InternalMusicDataIml implements RemixMusicInternalData {
  @override
  List<RemixMusicModel> myData() {
    List<RemixMusicModel> listMusic = [];
    for (var element in json) {
      listMusic.add(RemixMusicModel.fromJson(element));
    }

    return listMusic;
  }
}
