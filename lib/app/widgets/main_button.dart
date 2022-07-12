import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color iconColor;
  final Function() onTap;

  MainButton({
    this.margin = const EdgeInsets.all(0),
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              '$title',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: titleColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: iconColor,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
