import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatGPTService {
  final Dio _dio;

  ChatGPTService()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api.openai.com/v1/chat/completions',
          headers: {
            'Authorization': 'Bearer ${dotenv.env['OPENAIAPIKEY']}',
            'Content-Type': 'application/json',
          },
        ));

  Future<Map<String, dynamic>> sendMessage(String message) async {
    print(dotenv.env['OPENAIAPIKEY']);
    try {
      final response = await _dio.post('', data: {
        'model': 'text-embedding-3-small', // or 'gpt-4' if you have access
        'prompt': message,
        'messages': [
          {'role': 'user', 'content': message},
        ],
        "temperature": 0.7
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}
