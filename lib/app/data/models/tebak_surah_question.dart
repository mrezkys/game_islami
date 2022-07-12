class TebakSurahQuestion {
  String? question;
  int? answerIndexInChoice;
  List<String?>? choiceString;
  List<int>? choiceIndex;

  TebakSurahQuestion({
    this.question,
    required this.answerIndexInChoice,
    this.choiceString,
    required this.choiceIndex,
  });

  @override
  String toString() {
    return 'question: $question, answerIndexInChoice: $answerIndexInChoice, choiceString: $choiceString, choiceIndex: $choiceIndex';
  }
}
