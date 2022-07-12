import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/sambung_ayat_choice.dart';
import 'package:game_islami/app/widgets/loading_screen.dart';
import 'package:game_islami/app/widgets/main_button.dart';

import 'package:get/get.dart';

import '../controllers/sambung_ayat_game_controller.dart';

class SambungAyatGameView extends GetView<SambungAyatGameController> {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        appBar: AppBar(
          backgroundColor: AppColor.secondary,
          title: Text(
            'Sambung Ayat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
          ),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Pilih sambungan dari ayat berikut...',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.7),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Obx(
                      () => Text(
                        '${controller.currentQuestion.value?.question ?? "loading..."} ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return SambungAyatChoice(
                        index: index,
                      );
                    },
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.showNextButton(),
                      child: MainButton(
                        margin: EdgeInsets.only(top: 16),
                        title: "Soal Selanjutnya",
                        backgroundColor: AppColor.secondary,
                        titleColor: Colors.white,
                        iconColor: Colors.white.withOpacity(0.5),
                        onTap: () {
                          controller.nextQuestion();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
