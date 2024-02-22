class RemixMusicModel {
  final String bgImag;
  final double downloadPercent;
  final String musicLink;
  final String musicPath;
  final String name;

  RemixMusicModel(
      {required this.name,
      required this.bgImag,
      required this.downloadPercent,
      required this.musicLink,
      required this.musicPath});

  factory RemixMusicModel.fromJson(Map<String, dynamic> json) {
    return RemixMusicModel(
        bgImag: json['bgImag'],
        downloadPercent: json['downloadPercent'],
        musicLink: json['musicLink'],
        musicPath: json['musicPath'],
        name: json['name']);
  }
}
