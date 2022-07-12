class SambungAyatQuestion {
  String? question;
  int? questionIndexinSurah;
  List<String?>? choiceString;
  int? answerIndexInChoice;
  List<int?>? listChoiceIndexinSurah;

  SambungAyatQuestion({
    required this.question,
    required this.questionIndexinSurah,
    required this.answerIndexInChoice,
    required this.choiceString,
    required this.listChoiceIndexinSurah,
  });

  @override
  String toString() {
    return ' questionIndexinSurah: $questionIndexinSurah, answerIndexInChoice: $answerIndexInChoice, listChoiceIndexinSurah: $listChoiceIndexinSurah, question: $question, choiceString: $choiceString';
  }
}
