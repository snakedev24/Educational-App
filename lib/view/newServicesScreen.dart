import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../commonWidgets/appText.dart';
import '../commonWidgets/appTextField.dart';
import '../controller/formController.dart';
import '../controller/newServicesController.dart';
import '../model/GetStudentInModel.dart';
import '../model/InitModel.dart';

class NewServicesScreen extends StatefulWidget {
  const NewServicesScreen({Key? key}) : super(key: key);

  @override
  State<NewServicesScreen> createState() => _NewServicesScreenState();
}

class _NewServicesScreenState extends State<NewServicesScreen> {

  final newServicesController=Get.put(NewServicesController());
  final formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

        Obx(() =>

    (formController.isLoadNewService!.value)

        ?
    Center(
      child: Container(
        height: 40,
        color: Colors.transparent,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    ):
      Padding(
        padding: EdgeInsets.only(
            top: Get.height * 0.06,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        child:

        SingleChildScrollView(
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          print('ccaall');
                          if(newServicesController.serviceId!.isNotEmpty&&
                          newServicesController.studentId!.isNotEmpty&&
                          newServicesController.selectDateString!.isNotEmpty &&
                          newServicesController.duration!.isNotEmpty&&
                          newServicesController.serviceProvidedValue!.isNotEmpty){
                            newServicesController.postService(context);
                          }else{
                            final snackBar = SnackBar(
                              content:  Text("Please add requird information"),
                              backgroundColor: (Colors.black12),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }

                        },
                        child: Icon(
                          Icons.check,
                          size: Get.height * 0.034,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      AppText(text: "New Services Record", fontSize: 0.02)
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.clear,
                        size: Get.height * 0.034,
                      )),
                ],
              ),
              SizedBox(height: Get.height*0.03,),
              AppText(text: "Service Relationship :", fontSize: 0.02),
              SizedBox(height: Get.height*0.01,),
              Obx(() =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<GetStudentInModel>(
                      isExpanded: true,
                      hint: Text(
                        'Student Name',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: formController.studentData
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          "${item.lastName!} ${item.firstName!}",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: newServicesController.setDataStudentInServices,
                      onChanged: (value) {
                        setState(() {
                          newServicesController.setDataStudentInServices = value;
                          newServicesController.studentId=value!.iD;
                          print("setDataStudentInServices object $value");
                          print("student id ${newServicesController.studentId}");
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: Get.width*0.8,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  )),
              SizedBox(height: Get.height*0.02,),
              AppText(text: "Date / Duration :", fontSize: 0.02),
              SizedBox(height: Get.height*0.01,),
              Obx(() => GestureDetector(
                  onTap: () {
                    newServicesController.selectDateAndTime(context);
                  },
                  child: AppText(
                      text: newServicesController
                          .formatDate(newServicesController.selectedDate.value)
                          .toString(),
                      fontSize: 0.02,color: Colors.grey,))),
              SizedBox(height: Get.height*0.03,),
              AppText(text: "Service Provided :", fontSize: 0.02),
              SizedBox(height: Get.height*0.01,),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Service',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: newServicesController.serviceProvidedItems
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  value: newServicesController.serviceProvidedValue,
                  onChanged: (value) {
                    setState(() {
                      newServicesController.serviceProvidedValue = value;
                      switch(newServicesController.serviceProvidedValue){
                        case "Lesson planning":
                          newServicesController.serviceId="0";
                        break;
                        case "Wrote Session Notes":
                          newServicesController.serviceId="1";
                          break;
                        case "Contact":
                          newServicesController.serviceId="2";
                          break;
                        case "Prepared & wrote progress report & new IEP Goals":
                          newServicesController.serviceId="3";
                          break;
                        case "Attended IEP meetings in person or by phone":
                          newServicesController.serviceId="4";
                          break;
                        case "Wrote rationale for increased services":
                          newServicesController.serviceId="5";
                          break;
                      }
                      if(value=="Contact"){
                        newServicesController.selectContact=true;
                        newServicesController.selectedContact!.value="Parent/Guardian";
                      }else{
                        newServicesController.selectContact=false;
                        newServicesController.selectedContact!.value="";
                        newServicesController.contactNameLast.text="";
                        newServicesController.contactNameFirst.text="";
                        newServicesController.contactPhone.text="";
                        newServicesController.contactEmail.text="";
                        newServicesController.contactAgency="";
                        newServicesController.fillCommunityController.text="";
                      }
                    });
                  },
                  buttonStyleData:  ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 60,
                    width: Get.width*0.8,
                  ),
                  dropdownStyleData:  DropdownStyleData(
                    maxHeight: Get.height*0.3,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 60,
                  ),
                ),
              ),

              (newServicesController.selectContact)?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Contact Title/Name :", fontSize: 0.02),
                  SizedBox(height: Get.height*0.01,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Contact Title/Name',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: newServicesController.contactTitleItems
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: newServicesController.selectedContact!.value,
                      onChanged: (value) {
                        setState(() {
                          newServicesController.selectedContact!.value = value!;
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 60,
                        width: Get.width*0.8,
                      ),
                      dropdownStyleData:  DropdownStyleData(
                        maxHeight: Get.height*0.3,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 60,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() =>
                      ([
                        "Parent/Guardian",
                        "Classroom Teachers",
                        "Shared SEIT",
                        "Preschool Director",
                        "SEIT"
                      ].contains(newServicesController.selectedContact!.value))?
                      AppText(text: "Name :", fontSize: 0.02):AppText(text: "Agency",
                          fontSize: 0.02)),
                      SizedBox(height: Get.height*0.01,),
                      Obx(() =>
                      ([
                        "Parent/Guardian",
                        "Classroom Teachers",
                        "Shared SEIT",
                        "Preschool Director",
                        "SEIT"
                      ].contains(newServicesController.selectedContact!.value))?
                      AppTextField(hintText: 'Enter Name', textColor: Colors.black,
                      textController: newServicesController.contactNameFirst,
                      ):
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() =>
                            DropdownButton<InitAgenciesModel>(
                              isExpanded: true,
                              hint: Text("Agency"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: formController.initAgenciesData.map((InitAgenciesModel model) {
                                return DropdownMenuItem<InitAgenciesModel>(
                                  value: model,
                                  child: Text(model.agency ?? ''), // Display agency name in the dropdown
                                );
                              }).toList(),
                              value: formController.getDataOfAgency,
                              onChanged: (InitAgenciesModel? newValue) {
                                setState(() {
                                  formController.getDataOfAgency = newValue!;
                                  formController.selectedAgency=newValue.agency;
                                  newServicesController.contactAgency=newValue.id;

                                });
                              },
                            )),
                            SizedBox(height: Get.height*0.01,),
                            AppText(text: "Name :", fontSize: 0.02),
                            SizedBox(height: Get.height*0.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: AppTextField(hintText: 'First Name', textColor: Colors.black,
                                    textController: newServicesController.contactNameFirst,
                                    )),
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: AppTextField(hintText: 'Last Name', textColor: Colors.black,
                                    textController: newServicesController.contactNameLast,
                                    )),
                              ],
                            ),
                            SizedBox(height: Get.height*0.01,),
                            AppText(text: "Phone :", fontSize: 0.02),
                            SizedBox(height: Get.height*0.01,),
                            AppTextField(hintText: 'Phone', textColor: Colors.black,
                            textController: newServicesController.contactPhone,),
                            SizedBox(height: Get.height*0.01,),
                            AppText(text: "Email :", fontSize: 0.02),
                            SizedBox(height: Get.height*0.01,),
                            AppTextField(hintText: 'Email', textColor: Colors.black,
                            textController: newServicesController.contactEmail,
                            ),
                          ],
                        ))
                      ,
                      SizedBox(height: Get.height*0.02,),
                      AppText(text: "Communication :", fontSize: 0.02),
                      SizedBox(height: Get.height*0.01,),
                      Obx(() =>
                      DropdownButton(
                        isExpanded: true,
                        hint: Text("-- Insert Communication Text --"),
                         icon: const Icon(Icons.keyboard_arrow_down),
                        items: ( newServicesController.selectedContact!.value=="Parent/Guardian")?
                        newServicesController.parentGuardianList
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():( newServicesController.selectedContact!.value=="Classroom Teachers")?
                        newServicesController.classRoomTeachersList
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():( newServicesController.selectedContact!.value=="OT"||newServicesController.selectedContact!.value=="PT"
                            ||newServicesController.selectedContact!.value=="CO"
                            ||newServicesController.selectedContact!.value=="SP"
                        )?
                        newServicesController.oTPTCOSPList
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():( newServicesController.selectedContact!.value=="Shared SEIT"
                            ||newServicesController.selectedContact!.value=="Preschool Director"
                            ||newServicesController.selectedContact!.value=="ITS Supervision"
                        )?
                        newServicesController.sharedPreItsList
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():( newServicesController.selectedContact!.value=="SEIT"
                        )?
                        newServicesController.seitList
                            .map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList():null,
                        onChanged: (String? newValue) {
                          setState(() {
                            newServicesController.dropdownvalue = newValue!;
                            newServicesController.fillCommunityController.text=newValue!;
                            setState(() {

                            });
                          });
                        },
                      )),
                      SizedBox(height: Get.height*0.01,),
                      AppTextField(hintText: '',
                        maxLine: 4,
                        textController: newServicesController.fillCommunityController,
                        textColor: Colors.black,

                      ),
                      SizedBox(height: Get.height*0.06,)
                    ],
                  ),
                ],

              ):
                  SizedBox()

            ],
          ),
        ),
      )),
    );
  }
}


