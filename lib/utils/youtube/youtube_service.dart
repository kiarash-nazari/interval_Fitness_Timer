import 'package:dio/dio.dart';

class YoutubeService {
  final String apiKey = "AIzaSyDrBM11s4nQZ8SXjfSQx0xmjXPE7W-qIuo";
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://www.googleapis.com/youtube/v3',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<String>> fetchVideoIds(String query) async {
    try {
      final respone = await _dio.get('/search', queryParameters: {
        'part': 'snippet',
        'maxResults': 10,
        'q': query,
        'key': apiKey,
      });
      final data = respone.data;
      final List<dynamic> items = data['items'];
      // print(data);
      return items.map((item) => item['id']['videoId'] as String).toList();
    } catch (e) {
      throw Exception('Failed to load videos: $e');
    }
  }
}
