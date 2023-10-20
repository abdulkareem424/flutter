// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

abstract class QuestionEvent {}

class Answer extends QuestionEvent {
  bool answer;
  Answer({
    required this.answer,
  });
}
