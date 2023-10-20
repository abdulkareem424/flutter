import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  String title;
  List<Answers> answers;
  Question({
    required this.title,
    required this.answers,
  });

  Question copyWith({
    String? title,
    List<Answers>? answers,
  }) {
    return Question(
      title: title ?? this.title,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'answers': answers.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      title: map['title'] ?? '',
      answers:
          List<Answers>.from(map['answers']?.map((x) => Answers.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() => 'Question(title: $title, answers: $answers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.title == title &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode => title.hashCode ^ answers.hashCode;
}

class Answers {
  String answer_title;
  bool is_correct;
  Answers({
    required this.answer_title,
    required this.is_correct,
  });

  Answers copyWith({
    String? answer_title,
    bool? is_correct,
  }) {
    return Answers(
      answer_title: answer_title ?? this.answer_title,
      is_correct: is_correct ?? this.is_correct,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'answer_title': answer_title});
    result.addAll({'is_correct': is_correct});

    return result;
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      answer_title: map['answer_title'] ?? '',
      is_correct: map['is_correct'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) =>
      Answers.fromMap(json.decode(source));

  @override
  String toString() =>
      'Answers(answer_title: $answer_title, is_correct: $is_correct)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answers &&
        other.answer_title == answer_title &&
        other.is_correct == is_correct;
  }

  @override
  int get hashCode => answer_title.hashCode ^ is_correct.hashCode;
}
