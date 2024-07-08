import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';

class GptApiCall {
  /// beginers GPT API call
  Future<Map<String, dynamic>> beginers(String prompt) async {
    final completion =
        await OpenAI.instance.chat.create(model: "gpt-3.5-turbo", messages: [
      OpenAIChatCompletionChoiceMessageModel(content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "You are a Pro Gym trainer.")
      ], role: OpenAIChatMessageRole.system),
      OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt)
          ])
    ]);

    final jsonString = completion.choices[0].message.content![0].text!;
    var jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    print(jsonMap);

    return jsonMap;
  }
}
