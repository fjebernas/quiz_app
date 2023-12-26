import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) chooseAnswer;

  const QuestionsScreen(this.chooseAnswer, {super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String chosenAnswer) {
    setState(() {
      widget.chooseAnswer(chosenAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledChoices().map((e) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: AnswerButton(
                  e,
                  () {
                    answerQuestion(e);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
