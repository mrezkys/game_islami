import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/data/models/surah_model.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/loading_screen.dart';

import 'package:get/get.dart';

import '../controllers/pilih_surah_controller.dart';

class PilihSurahView extends GetView<PilihSurahController> {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      child: Scaffold(
        backgroundColor: AppColor.secondary,
        appBar: AppBar(
          backgroundColor: AppColor.secondary,
          title: Text(
            'Pilih',
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
        body: FutureBuilder<List<Surah>>(
          future: controller.listSurah,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return LoadingScreen(
                  circularProgressColor: AppColor.primary,
                  loadingBackgroundColor: AppColor.secondaryLight,
                  visible: true,
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        Surah surah = snapshot.data![index];
                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SAMBUNG_AYAT_GAME, arguments: surah);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey, width: 1),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                              ),
                              child: Text(
                                '${surah.number}. ${surah.englishName}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              default:
                return Text('nodata');
            }
          },
        ),
      ),
    );
  }
}
