import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_islami/app/controllers/loading_controller.dart';
import 'package:game_islami/app/data/models/surah_model.dart';
import 'package:game_islami/app/data/models/tebak_surah_question.dart';
import 'package:game_islami/app/data/providers/surah_provider.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/alert/game_alert.dart';
import 'package:get/get.dart';

class TebakSurahGameController extends GetxController {
  LoadingController loadingController = Get.find<LoadingController>();
  SurahProvider surahProvider = SurahProvider();

  int surahCount = 114;
  Rxn<List<Surah>> listSurah = Rxn();
  Rxn<TebakSurahQuestion> currentQuestion = Rxn();

  RxBool isAnswered = RxBool(false);
  RxnInt selectedChoice = RxnInt();

  Future<List<Surah>> getAllSurah(List<int> listIndex) async {
    List<Surah> listSurah_ = await surahProvider.get4Surah(listIndex);
    print(listSurah_);
    return listSurah_;
  }

  TebakSurahQuestion generateQuestion() {
    Random random = Random();
    int answerSurahNumber = random.nextInt(surahCount - 1);
    int answerIndexInChoice = random.nextInt(3);
    List<int?> choiceSurahNumber = [null, null, null, null];
    choiceSurahNumber[answerIndexInChoice] = answerSurahNumber;

    int trying = 0;
    int choiceIndexStart = 0;
    while (trying < 3) {
      int pickSurahNumber = random.nextInt(surahCount - 1);
      if (pickSurahNumber == answerSurahNumber || choiceSurahNumber.contains(pickSurahNumber) == true) {
        continue;
      } else {
        if (choiceIndexStart == answerIndexInChoice) {
          choiceIndexStart++;
          continue;
        } else {
          choiceSurahNumber[choiceIndexStart] = pickSurahNumber;
          choiceIndexStart++;
          trying++;
        }
      }
    }

    TebakSurahQuestion tebakSurahQuestion = TebakSurahQuestion(
      // question: listSurah.value![answerSurahNumber].listAyahs![0]!.text,
      // choiceString: listSurahName,
      answerIndexInChoice: answerIndexInChoice,
      choiceIndex: choiceSurahNumber.cast<int>(),
    );

    return tebakSurahQuestion;
    // print(tebakSurahQuestion.toString());
    // print('answerSurahNumber : $answerSurahNumber, choiceSurahNumber: $choiceSurahNumber');
  }

  initApp() async {
    loadingController.isLoading.value = true;

    currentQuestion.value = await generateQuestion();
    List<int> answerIndexInChoice = currentQuestion.value!.choiceIndex!;

    listSurah.value = await getAllSurah(answerIndexInChoice);
    listSurah.refresh();
    List<String?> listSurahName = [];
    listSurah.value!.forEach((surah) => listSurahName.add(surah.englishName));
    currentQuestion.value!.choiceString = listSurahName;
    //pertanyaanny ayat ke 2 aja [1]
    currentQuestion.value!.question = listSurah.value![currentQuestion.value!.answerIndexInChoice!].listAyahs![1]!.text;
    currentQuestion.refresh();
    listSurah.refresh();
    print(currentQuestion.value);

    loadingController.isLoading.value = false;
  }

  checkAnswer() {
    isAnswered.value = true;
    isAnswered.refresh();

    if (selectedChoice.value == currentQuestion.value!.answerIndexInChoice) {
      GameAlert.showTrueAlert(point: 10);
      print("benar");
    } else {
      GameAlert.showWrongAlert();
      print('salah');
    }
  }

  changeColor(int index) {
    if (selectedChoice.value != null) {
      if (index == currentQuestion.value!.answerIndexInChoice) {
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

  @override
  void onClose() {}
}
