import 'dart:convert';
import 'package:artifitia_machine_test/models/question_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static String baseUrl = 'https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz';

  Future<List<QuestionModel>> fetchQuestions() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<QuestionModel> questions = data.map((item) {
        return QuestionModel.fromJson(item as Map<String, dynamic>);
      }).toList();

      return questions;
    } else {
      throw Exception(
          'Failed to load questions. Status code: ${response.statusCode}');
    }
  }
}
