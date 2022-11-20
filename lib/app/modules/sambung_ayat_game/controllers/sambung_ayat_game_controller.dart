import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_islami/app/controllers/game_controller.dart';
import 'package:game_islami/app/controllers/loading_controller.dart';
import 'package:game_islami/app/data/models/ayahs_model.dart';
import 'package:game_islami/app/data/models/point_allocation.dart';
import 'package:game_islami/app/data/models/sambung_ayat_question.dart';
import 'package:game_islami/app/data/models/surah_model.dart';
import 'package:game_islami/app/data/providers/surah_provider.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/alert/game_alert.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SambungAyatGameController extends GetxController {
  Surah? argument = Get.arguments;
  RxnString gameType = RxnString();

  LoadingController loadingController = Get.find<LoadingController>();
  GameController gameController = Get.find<GameController>();
  SurahProvider surahProvider = SurahProvider();
  GetStorage box = GetStorage();

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

  // fix bug if ayah <= 5 gonna be error
  addMoreChoice(int exclude) {
    while (selectedSurah.value.listAyahs!.length <= 6) {
      Random random = Random();
      int r;
      r = random.nextInt(selectedSurah.value.listAyahs!.length);
      if (r == exclude) {
        continue;
      } else {
        selectedSurah.value.listAyahs!.add(
          selectedSurah.value.listAyahs![r],
        );
        selectedSurah.refresh();
      }
    }
  }

  SambungAyatQuestion generateQuestion() {
    bool isLessThan5 = false;
    int? end = selectedSurah.value.listAyahs!.length;
    Random random = Random();

    int questionAyahs = random.nextInt(end);
    if (questionAyahs == end) {
      questionAyahs -= 1;
    }

    List<int?> choice = [null, null, null, null];
    int answerIndex = random.nextInt(3);
    choice[answerIndex] = questionAyahs + 1;

    if (end <= 5) {
      isLessThan5 = true;
      addMoreChoice((questionAyahs + 1));
    }

    int choiceIndexStart = 0;
    int trying = 0;

    if (isLessThan5 == true) {
      while (trying < 3) {
        int pickAyahChoice = random.nextInt(end);

        if (pickAyahChoice == questionAyahs) {
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
    } else {
      while (trying < 3) {
        int pickAyahChoice = random.nextInt(end);

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
    }

    List<Ayahs?> listAyahs = selectedSurah.value.listAyahs!;
    List<String?> listAyahsString = [];
    listAyahs.forEach((ayahs) => listAyahsString.add(ayahs!.text));

    SambungAyatQuestion question = SambungAyatQuestion(
      question: listAyahs[questionAyahs]!.text,
      questionIndexinSurah: questionAyahs,
      listChoiceIndexinSurah: choice,
      answerInChoice: choice[answerIndex],
      choiceString: listAyahsString,
    );

    print(question);

    return question;
  }

  initApp() async {
    loadingController.isLoading.value = true;
    if (argument == null) {
      selectedSurah.value = await getRandomSurah();
      gameType.value = 'random';
    } else {
      selectedSurah.value = await surahProvider.getSurah(argument!.number!);
      gameType.value = 'pick';
    }
    currentQuestion.value = await generateQuestion();
    loadingController.isLoading.value = false;
  }

  checkAnswer() async {
    isAnswered.value = true;
    isAnswered.refresh();

    if (selectedChoice == currentQuestion.value!.answerInChoice) {
      PointAllocation pointAllocation = await box.read('point_allocation');
      if (gameType.value == 'random') {
        await gameController.addPointToUserAccount(amount: pointAllocation.sambungAyatRandom);
        GameAlert.showTrueAlert(point: pointAllocation.sambungAyatRandom);
      } else {
        await gameController.addPointToUserAccount(amount: pointAllocation.sambungAyat);
        GameAlert.showTrueAlert(point: pointAllocation.sambungAyat);
      }
      print("benar");
    } else {
      GameAlert.showWrongAlert();
      print("salah");
    }
  }

  changeColor(int index) {
    if (selectedChoice.value != null) {
      if (currentQuestion.value!.listChoiceIndexinSurah![index] == currentQuestion.value!.answerInChoice) {
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
