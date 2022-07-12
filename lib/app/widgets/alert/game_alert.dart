import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameAlert {
  static showWrongAlert() {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  'Jawaban anda salah',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('silahkan lanjut ke soal berikutnya'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static showTrueAlert({
    required int point,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  'Selamat anda benar !',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '$point Pahala',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text('ditambahkan'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
