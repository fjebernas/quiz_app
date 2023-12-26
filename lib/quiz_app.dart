import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({
    super.key,
  });

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget activeScreen;
  List<String> chosenAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(goToQuestionsScreen);
  }

  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers, goToQuestionsScreen);
      });
    }
  }

  void goToQuestionsScreen() {
    setState(() {
      chosenAnswers = [];
      activeScreen = QuestionsScreen(chooseAnswer); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 6, 39),
                Color.fromARGB(255, 1, 58, 105),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}