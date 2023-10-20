import 'package:demo_bloc/bloc/counter_bloc.dart';
import 'package:demo_bloc/config/bloc_observe.dart';
import 'package:demo_bloc/model/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => QuestionBloc(),
          )
        ], child: QuestionPage()));
  }
}

class QuestionPage extends StatefulWidget {
  QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> question = [
    Question(title: 'How Long this Tower is ?', answers: [
      Answers(answer_title: '2', is_correct: false),
      Answers(answer_title: '29', is_correct: true),
      Answers(answer_title: '20', is_correct: false),
      Answers(answer_title: '16', is_correct: false)
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(116, 203, 200, 200),
      body: PageView.builder(
        itemCount: question.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                question[index].title,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 600,
              width: double.maxFinite,
              child: BlocListener<QuestionBloc, QuestionState>(
                listener: (context, state) {
                  if (state is Rightstate) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('right'),
                      backgroundColor: Colors.green,
                      duration: Duration(milliseconds: 900),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('wrong'),
                        backgroundColor: Colors.red,
                        duration: Duration(milliseconds: 900)));
                  }
                },
                child: GridView.builder(
                  itemCount: question[index].answers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2, crossAxisCount: 2),
                  itemBuilder: (context, ind) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Color.fromARGB(200, 36, 166, 218),
                      child: InkWell(
                        onTap: () => context.read<QuestionBloc>().add(Answer(
                            answer: question[index].answers[ind].is_correct)),
                        child: Container(
                          child: Center(
                            child:
                                Text(question[index].answers[ind].answer_title),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
