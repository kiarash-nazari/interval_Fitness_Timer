import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class YoutubeService {
  final String apiKey = dotenv.env['YOUTUBEAPI']!;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://www.googleapis.com/youtube/v3',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<String>> fetchVideoIds(String query) async {
    var videosId = Isolate.run(() async {
      final respone = await _dio.get('/search', queryParameters: {
        'part': 'snippet',
        'maxResults': 10,
        'q': query,
        'key': apiKey,
      });
      final data = respone.data;
      final List<dynamic> items = data['items'];

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
