class TebakSurahQuestion {
  String? question;
  int? answerInChoice;
  List<String?>? choiceString;
  List<int>? choiceIndex;

  TebakSurahQuestion({
    this.question,
    required this.answerInChoice,
    this.choiceString,
    required this.choiceIndex,
  });

  @override
  String toString() {
    return 'question: $question, answerInChoice: $answerInChoice, choiceString: $choiceString, choiceIndex: $choiceIndex';
  }
}
