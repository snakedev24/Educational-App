import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppText extends StatelessWidget {
  TextDecoration? textDecoration;
  String text;
  Color? color;
  double fontSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLine;
  FontStyle? fontStyle;

  AppText(
      {Key? key,
      required this.text,
      this.color,
      required this.fontSize, this.fontWeight,
      this.textAlign,
      this.overflow,
      this.maxLine,
      this.textDecoration,this.fontStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,

      style: TextStyle(
        fontStyle: fontStyle??FontStyle.normal,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: Colors.green,
        fontWeight: fontWeight??FontWeight.w500,

        fontSize: Get.height * fontSize,
        color: color,
      ),
    );
  }
}
