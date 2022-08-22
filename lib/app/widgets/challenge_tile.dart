import 'package:flutter/material.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChallengeTile extends StatelessWidget {
  final double progressValue;
  final Widget progressTitle;
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry margin;

  ChallengeTile({
    required this.progressValue,
    required this.progressTitle,
    required this.title,
    required this.subtitle,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            child: CircularPercentIndicator(
              radius: 26,
              lineWidth: 6,
              percent: progressValue,
              progressColor: AppColor.primary,
              backgroundColor: AppColor.secondary,
              center: progressTitle,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$subtitle',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
