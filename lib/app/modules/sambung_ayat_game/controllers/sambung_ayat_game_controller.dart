import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_islami/app/controllers/loading_controller.dart';
import 'package:game_islami/app/data/models/ayahs_model.dart';
import 'package:game_islami/app/data/models/sambung_ayat_question.dart';
import 'package:game_islami/app/data/models/surah_model.dart';
import 'package:game_islami/app/data/providers/surah_provider.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/alert/game_alert.dart';
import 'package:get/get.dart';

class SambungAyatGameController extends GetxController {
  Surah? argument = Get.arguments;

  LoadingController loadingController = Get.find<LoadingController>();
  SurahProvider surahProvider = SurahProvider();
  int surahCount = 114;

  RxBool isAnswered = RxBool(false);
  RxnInt selectedChoice = RxnInt();
  Rx<Surah> selectedSurah = Rx(Surah());
  Rxn<SambungAyatQuestion> currentQuestion = Rxn();

  Future<Surah> getRandomSurah() async {
    // randomize
    Random random = Random();
    int r;
    r = random.nextInt(surahCount - 1) + 1;
    print('r : $r');
    //getSurah
    Surah surah = await surahProvider.getSurah(r);
    return surah;
  }

  SambungAyatQuestion generateQuestion() {
    int? end = selectedSurah.value.numberOfAyahs;
    print(end);
    Random random = Random();

    int questionAyahs = random.nextInt((end! - 1));

    List<int?> choice = [null, null, null, null];
    int answerIndex = random.nextInt(3);
    choice[answerIndex] = questionAyahs + 1;

    int choiceIndexStart = 0;
    int trying = 0;

    while (trying < 3) {
      int pickAyahChoice = random.nextInt(end - 1);

      if (pickAyahChoice == questionAyahs || choice.contains(pickAyahChoice) == true) {
        continue;
      } else {
        if (choiceIndexStart == answerIndex) {
          choiceIndexStart++;
          continue;
        } else {
          choice[choiceIndexStart] = pickAyahChoice;
          choiceIndexStart++;
          trying++;
        }
      }
    }

    List<Ayahs?> listAyahs = selectedSurah.value.listAyahs!;
    List<String?> listAyahsString = [];
    listAyahs.forEach((ayahs) => listAyahsString.add(ayahs!.text));
    // print('choice : $choice | question: $questionAyahs | answer : ${choice[answerIndex]}');

    SambungAyatQuestion question = SambungAyatQuestion(
      question: listAyahs[questionAyahs]!.text,
      questionIndexinSurah: questionAyahs,
      listChoiceIndexinSurah: choice,
      answerIndexInChoice: choice[answerIndex],
      choiceString: listAyahsString,
    );

    print(question);

    return question;
  }

  initApp() async {
    loadingController.isLoading.value = true;
    if (argument == null) {
      selectedSurah.value = await getRandomSurah();
    } else {
      selectedSurah.value = await surahProvider.getSurah(argument!.number!);
    }
    currentQuestion.value = await generateQuestion();
    loadingController.isLoading.value = false;
  }

  checkAnswer() {
    isAnswered.value = true;
    isAnswered.refresh();

    if (selectedChoice == currentQuestion.value!.answerIndexInChoice) {
      GameAlert.showTrueAlert(point: 10);
      print("benar");
    } else {
      GameAlert.showWrongAlert();
      print("salah");
    }
  }

  changeColor(int index) {
    if (selectedChoice.value != null) {
      if (currentQuestion.value!.listChoiceIndexinSurah![index] == currentQuestion.value!.answerIndexInChoice) {
        return AppColor.primary;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }

  showNextButton() {
    if (selectedChoice.value != null) {
      return true;
    } else {
      return false;
    }
  }

  nextQuestion() {
    loadingController.isLoading.value = true;
    isAnswered.value = false;
    selectedChoice.value = null;
    initApp();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initApp();
    super.onReady();
  }
}
