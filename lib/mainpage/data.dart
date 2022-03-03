import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class BackendService {
  static Future<List<Map<String, dynamic>>> getSuggestions(
      String query, String apiKey) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }
    var response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=${query}&units=imperial&appid=${apiKey}'));
    List<Suggestion> suggestions = [];
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> _map = {};
      List<dynamic> json = [];
      json.add(jsonDecode(response.body)['city']);
      suggestions = List<Suggestion>.from(
          json.map((model) => Suggestion.fromJson(model)));
    }
    return Future.value(suggestions.map((e) => {'name': e.word}).toList());
  }
}

class Suggestion {
  final String word;
  Suggestion({
    required this.word,
  });
  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      word: json['name'],
    );
  }
}
