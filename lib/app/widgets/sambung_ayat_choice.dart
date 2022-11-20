import 'package:flutter/material.dart';
import 'package:game_islami/app/modules/sambung_ayat_game/controllers/sambung_ayat_game_controller.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:get/get.dart';

class SambungAyatChoice extends GetView<SambungAyatGameController> {
  final int index;
  SambungAyatChoice({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.isAnswered.value == false) {
          controller.selectedChoice.value = controller.currentQuestion.value?.listChoiceIndexinSurah?[index];
          controller.selectedChoice.refresh();
          controller.checkAnswer();
        }
      },
      child: Obx(
        () {
          int indexInSurah = controller.currentQuestion.value?.listChoiceIndexinSurah?[index] ?? 9999;
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: controller.changeColor(index),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio(
                  value: indexInSurah,
                  groupValue: controller.selectedChoice.value,
                  fillColor: MaterialStateColor.resolveWith((states) => AppColor.secondary),
                  onChanged: (value) {
                    if (controller.isAnswered.value == false) {
                      controller.selectedChoice.value = controller.currentQuestion.value?.listChoiceIndexinSurah?[index];
                      controller.selectedChoice.refresh();
                      controller.checkAnswer();
                    }
                  },
                ),
                Expanded(
                  child: Text(
                    '${controller.currentQuestion.value?.choiceString?[indexInSurah] ?? "loading..."} ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
