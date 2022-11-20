class SambungAyatQuestion {
  String? question;
  int? questionIndexinSurah;
  List<String?>? choiceString;
  int? answerInChoice;
  List<int?>? listChoiceIndexinSurah;

  SambungAyatQuestion({
    required this.question,
    required this.questionIndexinSurah,
    required this.answerInChoice,
    required this.choiceString,
    required this.listChoiceIndexinSurah,
  });

  @override
  String toString() {
    return ' questionIndexinSurah: $questionIndexinSurah, answerInChoice: $answerInChoice, listChoiceIndexinSurah: $listChoiceIndexinSurah, question: $question, choiceString: $choiceString';
  }
}
