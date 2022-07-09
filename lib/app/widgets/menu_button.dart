import 'package:flutter/material.dart';
import 'package:game_islami/app/style/app_color.dart';

class MenuButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color borderColor;
  final Widget suffixIcon;

  MenuButton({
    required this.onTap,
    required this.title,
    required this.suffixIcon,
    this.titleColor = AppColor.secondary,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColor.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: titleColor,
              ),
            ),
            suffixIcon,
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 0,
          padding: EdgeInsets.only(left: 24, right: 16),
          side: BorderSide(color: borderColor, width: 1),
          onPrimary: AppColor.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
