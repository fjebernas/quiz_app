import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/question_answer_result.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() goToStartScreen;

  const ResultsScreen(this.chosenAnswers, this.goToStartScreen, {super.key});

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'questions_index': i,
        'question': questions[i].question,
        'chosen_answer': chosenAnswers[i],
        'correct_answer': questions[i].choices[0],
        'is_correct':
            chosenAnswers[i] == questions[i].choices[0] ? true : false,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswersCount =
        getSummaryData().where((data) => data['is_correct'] == true).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You\'ve answered $correctAnswersCount out of ${questions.length} correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 450,
              child: SingleChildScrollView(
                child: Column(
                  children: getSummaryData().map((e) {
                    return QuestionAnswerResult(e);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              onPressed: () {
                goToStartScreen();
              },
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
