class QuizQuestion {
  final String question;
  final List<String> choices;

  const QuizQuestion(this.question, this.choices);

  List<String> getShuffledChoices () {
    List<String> choicesCopy = List.of(choices);
    choicesCopy.shuffle();
    return choicesCopy;
  }
}