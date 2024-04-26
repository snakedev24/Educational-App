import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/commonWidgets/appText.dart';
import 'package:iep_app/commonWidgets/appTextField.dart';
import 'package:iep_app/controller/authController.dart';
import 'package:iep_app/network/api_provider.dart';
import 'package:iep_app/services/prefs.dart';
import 'package:iep_app/view/homeScreen.dart';

import '../commonWidgets/authButton.dart';
import '../constants/imageConstants.dart';
import '../constants/stringConstants.dart';
import '../controller/checkBioController.dart';
import '../controller/homeController.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final check=Get.put(CheckBioController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     authController.email.text = Prefs.getString("User")??"";
     authController.password.text =Prefs.getString("Password")??"";
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
      removeBottom: true,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: Get.width * 0.06, right: Get.width * 0.06),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                        ImageConstants.iepnetLogoImage,
                        height: Get.height * 0.2,
                      )),
                      AppText(text: StringConstants.welcome, fontSize: 0.03),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      AppTextField(
                          textController: authController.email,
                          hintText: StringConstants.email,
                          validator: ((value) {
                            return authController.emailValidation(value!);
                          }),
                          textColor: Colors.black),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Obx(() => AppTextField(
                          hintText: StringConstants.password,
                          validator: ((value) {
                            return authController.passwordValidation(value!);
                          }),
                          textController: authController.password,
                          obscureText: authController.passwordHideShow!.value,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                authController.passwordHideShow!.value =
                                    !authController.passwordHideShow!.value;
                              },
                              child: Icon(
                                  (authController.passwordHideShow!.value)
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                          textColor: Colors.black)),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: AppText(
                                text: StringConstants.forgotPassword,
                                fontSize: 0.017,
                                color: Colors.blue,
                              )),
                          Row(
                            children: [
                              Obx(() =>
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Checkbox(value: authController.checkRememberMe!.value, onChanged: (value){
                                  authController.checkRememberMe!.value =! authController.checkRememberMe!.value;
                                }),
                              )),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: AppText(
                                    text: "Remember me",
                                    fontSize: 0.017,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                                authController.login(context);
                            }
                          },
                          child: CommonAuthButton(
                            text: StringConstants.login,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
