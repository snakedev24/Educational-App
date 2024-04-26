import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final AutovalidateMode? autoValidateMode;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Color textColor;
  final bool? obscureText;
  final VoidCallback? callbackSuffix;
  final FormFieldValidator<String>? validator;
  bool? readOnly;
  int? minChar;
  int? maxLine;
  final ValueChanged<String>? onChanged;
  final Color? textBorderColor;
  final Color? textFieldLight;
  final Color? textFieldDark;
  final Color? textColorHint;
  final Color? fillColor;
  final Color? enableBorderColor;


  AppTextField(
      {Key? key,
      this.keyBoardType,
      this.autoValidateMode,
      this.textInputAction,
        this.textController,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.textColor,
        this.maxLine,
      this.obscureText,
      this.callbackSuffix,
      this.suffix,
      this.validator,
      this.readOnly,
      this.minChar,
      this.onChanged,
      this.textBorderColor,
      this.textFieldLight,
      this.textFieldDark,
      this.textColorHint,this.fillColor,this.enableBorderColor})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      readOnly: readOnly ?? false,
      textAlign: TextAlign.start,
      maxLength: minChar,
      autovalidateMode: autoValidateMode,
      validator: validator,
      textInputAction: textInputAction,
      onChanged: onChanged,
      maxLines: maxLine??1,
      obscureText: obscureText ?? false,
      controller: textController,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor?? Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: enableBorderColor??Colors.grey), //<-- SEE HERE
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: textColorHint ?? Colors.grey,
            fontSize: Get.height * 0.018,
            fontWeight: FontWeight.w400,
          ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            EdgeInsets.symmetric(vertical: Get.height * 0.016, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
