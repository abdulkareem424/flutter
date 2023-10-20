part of 'counter_bloc.dart';

abstract class QuestionState {}

final class QuestionInitial extends QuestionState {}

class Rightstate extends QuestionState {}

class WrongState extends QuestionState {}

class ErrorState extends QuestionState {}
