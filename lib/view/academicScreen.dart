import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:iep_app/commonWidgets/appText.dart';
import 'package:iep_app/controller/academicController.dart';
import 'package:iep_app/view/loginScreen.dart';
class AcademicScreen extends StatefulWidget {
  const AcademicScreen({Key? key}) : super(key: key);

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  String? agencyValue;
  final TextEditingController textEditingController = TextEditingController();
  final academicController=Get.put(AcademicController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // academicController.initPeriod();

  }

  final List<String> agencyItems = [
    'Agency 1',
    'Agency 2',
    'Agency 3',
    'Agency 4',
    'Agency 5',
    'Agency 6',
    'Agency 7',
    'Agency 8',
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child:  Obx(() =>
      (academicController.showLoader!.value)?
      Center(
        child: Container(
          height: 40,
          color: Colors.transparent,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      )
      :Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.height*0.06,),
          Container(
            height: Get.height*0.2,
            width: Get.width*0.8,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AppText(text: "Test User", fontSize: 0.02),
                SizedBox(height: Get.height*0.02,),
                Obx(() =>
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint:

                    Text(
                      academicController.firstAcademic!.value,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: academicController.initData
                        .map((item) => DropdownMenuItem(
                      value: item.label,
                      child: Text(
                        item.label!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: agencyValue,
                    onChanged: (value) {
                      setState(() {
                        agencyValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),

                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                )),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.offAll(LoginScreen());
            },
            child: Container(
              width: Get.width*0.28,
              height: Get.height*0.042,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: AppText(
                  text: "Logout",
                  fontSize: 0.02,
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height*0.03,),

        ],
      )),
    );
  }
}


