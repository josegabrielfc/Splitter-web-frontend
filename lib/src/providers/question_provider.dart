import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class QuestionProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _questions = [];

  List<Map<String, dynamic>> get questions => _questions;

  QuestionProvider() {
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final questionsString = prefs.getString('questions');
    if (questionsString != null) {
      _questions = List<Map<String, dynamic>>.from(jsonDecode(questionsString));
      notifyListeners();
    }
  }

  Future<void> _saveQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('questions', jsonEncode(_questions));
  }

  void addQuestion(Map<String, dynamic> question) {
    _questions.add(question);
    _saveQuestions();
    notifyListeners();
  }
}
