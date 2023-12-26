import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String content;
  final void Function() onTap;

  const AnswerButton(this.content, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 4, 26),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          
          fontSize: 18,
        ),
      ),
    );
  }
}
