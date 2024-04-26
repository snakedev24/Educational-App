import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/controller/checkBioController.dart';
import 'package:iep_app/services/prefs.dart';
import '../constants/stringConstants.dart';
import '../model/LoginModel.dart';
import '../network/api_provider.dart';

class AuthController extends GetxController{

  RxBool? passwordHideShow=true.obs;
  RxBool? checkRememberMe=false.obs;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  emailValidation(String value) {
    if(value.isEmpty){
      return "Email is required";
    }else if(!GetUtils.isEmail(value)){
      return "Please enter valid email";
    }
    return null;
  }

  passwordValidation(String value){
    if(value.isEmpty){
      return "password is required";
    }
    return null;
  }


  login(BuildContext context) async{
    try{
      var response = await ApiProvider().login(email.text, password.text);
      if ((response as LoginModel).status =="ok" ) {
        Prefs.setString(StringConstants.userId, response.userID!);
        Get.find<CheckBioController>().checkBiometrics(context,loginTime: true);
      }else{
        final snackBar = SnackBar(
          content:  Text(response.msg!),
          backgroundColor: (Colors.black12),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      print('Error in login(): $e');
    }
  }
}