import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appText.dart';

class CommonAuthButton extends StatelessWidget {
  String? text;
  CommonAuthButton({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Get.width,
      height: Get.height*0.062,
      decoration: BoxDecoration(
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: AppText(
          text:text!,
          fontSize: 0.02,
          color: Colors.white,
        ),
      ),
    );
  }
}
