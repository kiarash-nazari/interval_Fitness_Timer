import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class YoutubeService {
  final String apiKey = dotenv.env["YOUTUBEAPI"]!;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://www.googleapis.com/youtube/v3',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 6),
  ));

  Future<List<String>> fetchVideoIds(String query) async {
    Future<List<String>> videosId = Isolate.run(() async {
      final respone = await _dio.get('/search', queryParameters: {
        'part': 'snippet',
        'maxResults': 10,
        'q': query,
        'key': apiKey,
      });
      final data = respone.data;
      List<dynamic> items = [];
      items.clear();

      items = data['items'];

      // print(items);
      return items
          .map((item) => item['id']['videoId'] == null
              ? ""
              : item['id']['videoId'] as String)
          .toList();
    });

    return videosId;
  }
}
