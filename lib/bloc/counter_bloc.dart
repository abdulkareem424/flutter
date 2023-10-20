import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionInitial()) {
    bool answer;
    on<Answer>(((event, emit) {
      if (event.answer) {
        answer = true;
        emit(Rightstate());
      } else {
        emit(WrongState());
      }
    }));
  }
}
