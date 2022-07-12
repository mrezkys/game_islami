import 'package:flutter/material.dart';
import 'package:game_islami/app/controllers/loading_controller.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:get/get.dart';

class LoadingScreen extends GetView<LoadingController> {
  final Widget? child;
  final Color? loadingBackgroundColor;
  final Color? circularProgressColor;
  final bool? visible;
  LoadingScreen({
    this.child,
    this.loadingBackgroundColor,
    this.circularProgressColor,
    this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child ??
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
      Obx(
        () {
          print(controller.isLoading.value);
          return Visibility(
            visible: visible ?? controller.isLoading.value,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: loadingBackgroundColor ?? AppColor.secondaryLight,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CircularProgressIndicator(
                        color: circularProgressColor ?? AppColor.primary,
                        strokeWidth: 4,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}
