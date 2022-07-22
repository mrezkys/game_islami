import 'package:flutter/material.dart';
import 'package:game_islami/app/style/app_color.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int value;
  final Widget icon;
  final bool isLoading;

  InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: icon,
          ),
          Container(
            margin: EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (isLoading == true)
                    ? Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                        ),
                      )
                    : Text(
                        '$value',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                        ),
                      ),
                Text(
                  '$title',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
