class RemixMusicModel {
  final int id;
  final String bgImag;
  double downloadPercent;
  final String musicLink;
  final String musicPath;
  final String name;
  bool isDownloading;
  bool isDownloaded;

  RemixMusicModel(
      {required this.isDownloaded,
      required this.isDownloading,
      required this.id,
      required this.name,
      required this.bgImag,
      required this.downloadPercent,
      required this.musicLink,
      required this.musicPath});

  factory RemixMusicModel.fromJson(Map<String, dynamic> json) {
    return RemixMusicModel(
        isDownloaded: json['isDownloaded'],
        isDownloading: json['isDownloading'],
        bgImag: json['bgImag'],
        downloadPercent: json['downloadPercent'],
        musicLink: json['musicLink'],
        musicPath: json['musicPath'],
        name: json['name'],
        id: json['id']);
  }
}
