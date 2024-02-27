import 'package:interval_timer/data/model/remix_music_model.dart';

List<Map<String, dynamic>> json = [
  {
    "id": 0,
    "bgImag": "assets/img/cover1.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3",
    "musicPath": "assets/",
    "name": "mix1",
    "isDownloading": false,
    "isDownloaded": false,
  },
  {
    "id": 1,
    "bgImag": "assets/img/cover2.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix2.mp3",
    "musicPath": "assets/",
    "name": "mix2",
    "isDownloading": false,
    "isDownloaded": false,
  },
  {
    "id": 2,
    "bgImag": "assets/img/cover3.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix3.mp3",
    "musicPath": "assets/",
    "name": "mix3",
    "isDownloading": false,
    "isDownloaded": false,
  },
  {
    "id": 3,
    "bgImag": "assets/img/cover4.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix4.mp3",
    "musicPath": "assets/",
    "name": "mix4",
    "isDownloading": false,
    "isDownloaded": false,
  },
  {
    "id": 4,
    "bgImag": "assets/img/cover5.jpg",
    "downloadPercent": 0.0,
    "musicLink": "https://luxafarin.com/wp-content/uploads/2024/02/mix5.mp3",
    "musicPath": "assets/",
    "name": "mix5",
    "isDownloading": false,
    "isDownloaded": false,
  },
];

abstract class RemixMusicDataSrc {
  List<RemixMusicModel> myData();
}

class InternalMusicDataSrc implements RemixMusicDataSrc {
  @override
  List<RemixMusicModel> myData() {
    List<RemixMusicModel> listMusic = [];
    for (var element in json) {
      listMusic.add(RemixMusicModel.fromJson(element));
    }

    return listMusic;
  }
}
