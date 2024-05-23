class QuizQuestion{
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers(){
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
  const QuizQuestion(this.text, this.answers);
}