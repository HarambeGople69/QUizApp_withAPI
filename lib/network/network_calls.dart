import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/api_response_model.dart';

class Networkclass {
  String computer =
      "https://opentdb.com/api.php?amount=10&category=18&type=multiple";
  String film =
      "https://opentdb.com/api.php?amount=10&category=11&type=multiple";
  String music =
      "https://opentdb.com/api.php?amount=10&category=12&type=multiple";
  String math =
      "https://opentdb.com/api.php?amount=10&category=19&type=multiple";
  String sport =
      "https://opentdb.com/api.php?amount=10&category=21&type=multiple";

  Future<QuizHelper?> callComputerData() async {
    var computerUrl = Uri.parse(computer);
    final response = await http.get(computerUrl);
    if (response.statusCode == 200) {
      return QuizHelper.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<QuizHelper?> callFilmData() async {
    var filmUrl = Uri.parse(film);
    final response = await http.get(filmUrl);
    if (response.statusCode == 200) {
      return QuizHelper.fromJson(jsonDecode(response.body));
    }
  }

  Future<QuizHelper?> callMusicData() async {
    var musicUrl = Uri.parse(music);
    final response = await http.get(musicUrl);
    if (response.statusCode == 200) {
      return QuizHelper.fromJson(jsonDecode(response.body));
    }
  }

  Future<QuizHelper?> callMathData() async {
    var mathUrl = Uri.parse(math);
    final response = await http.get(mathUrl);
    if (response.statusCode == 200) {
      return QuizHelper.fromJson(jsonDecode(response.body));
    }
  }

  Future<QuizHelper?> callSportData() async {
    var sportUrl = Uri.parse(sport);
    final response = await http.get(sportUrl);
    if (response.statusCode == 200) {
      return QuizHelper.fromJson(jsonDecode(response.body));
    }
  }
}
