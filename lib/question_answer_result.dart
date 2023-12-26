import 'package:flutter/material.dart';

class QuestionAnswerResult extends StatelessWidget {
  final Map<String, Object> summary;

  const QuestionAnswerResult(this.summary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: summary['is_correct'] as bool
                ? const Color.fromARGB(255, 123, 218, 126)
                : const Color.fromARGB(255, 247, 122, 113),
          ),
          child: Text(
            ((summary['questions_index'] as int) + 1).toString(),
            style: const TextStyle(
              //color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                summary['question'].toString(),
                textAlign: TextAlign.left,
                softWrap: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                summary['chosen_answer'].toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 250, 201),
                  fontSize: 15,
                ),
              ),
              Text(
                summary['correct_answer'].toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 151, 208, 255),
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
