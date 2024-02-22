class RemixMusicModel {
  final String bgImag;
  final double downloadPercent;
  final String musicLink;
  final String musicPath;

  RemixMusicModel(
      {required this.bgImag,
      required this.downloadPercent,
      required this.musicLink,
      required this.musicPath});

  factory RemixMusicModel.fromJson(Map<String, dynamic> json) {
    return RemixMusicModel(
        bgImag: json['bgImag'],
        downloadPercent: json['downloadPercent'],
        musicLink: json['musicLink'],
        musicPath: json['musicPath']);
  }
}
