import 'package:flutter/material.dart';
import 'package:game_islami/app/style/app_color.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Color? labelColor;
  final Color? textColor;
  final Color? hintColor;
  final String hint;
  final bool disabled;
  final EdgeInsetsGeometry margin;
  final bool obsecureText;
  final Widget? suffixIcon;
  final Color? borderColor;
  CustomInput({
    required this.controller,
    required this.label,
    this.labelColor,
    this.textColor,
    this.hintColor,
    required this.hint,
    this.disabled = false,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.obsecureText = false,
    this.suffixIcon,
    this.borderColor,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    print("builded");
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 14, right: 14, top: 4),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: (widget.disabled == false) ? Colors.transparent : AppColor.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: widget.borderColor ?? AppColor.grey),
        ),
        child: TextField(
          readOnly: widget.disabled,
          obscureText: widget.obsecureText,
          style: TextStyle(fontSize: 14, fontFamily: 'poppins', color: widget.textColor ?? AppColor.secondary),
          maxLines: 1,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon ?? SizedBox(),
            label: Text(
              widget.label,
              style: TextStyle(
                color: widget.labelColor ?? AppColor.secondaryLight,
                fontSize: 14,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              color: widget.hintColor ?? AppColor.secondaryLight,
            ),
          ),
        ),
      ),
    );
  }
}
