import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/controller/formController.dart';
import 'package:intl/intl.dart';
import '../commonWidgets/appText.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/newServicesController.dart';
import '../model/GetStudentInModel.dart';

class UpdateServiceScreen extends StatefulWidget {
  final List<Appointment>? appointments;
   UpdateServiceScreen({Key? key,this.appointments}) : super(key: key);

  @override
  State<UpdateServiceScreen> createState() => _UpdateServiceScreenState();
}

class _UpdateServiceScreenState extends State<UpdateServiceScreen> {

  final newServicesController=Get.put(NewServicesController());
  final formController=Get.put(FormController());
   String? studentId;
   String? startDate;
   String? endDate;
   String? subject;
   String? duration;
   dynamic contactTitle;
   dynamic contactName ;
   dynamic communication ;
   dynamic contactAgency ;
   DateTime? selectedDate;
   bool? changeProvider;
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     changeProvider=false;
       studentId = widget.appointments![0].id.toString()??"";

     startDate = DateFormat("yyyy-MM-dd")
         .format(widget.appointments![0].startTime);
     //startDate=widget.appointments![0].startTime.toString();
     endDate = DateFormat("yyyy-MM-dd")
         .format(widget.appointments![0].endTime);
     subject=widget.appointments![0].subject.toString()??"";
     duration=widget.appointments![0].notes.toString()??"";
     selectedDate=widget.appointments![0].startTime;
     if(subject=="Contact"){
       changeProvider=true;
       String jsonData =
       widget.appointments![0].recurrenceId!.toString();

       Map<String, dynamic> contactData = jsonDecode(jsonData);

       // Accessing the data
       contactTitle = contactData['contact_title']??"";
       contactName = contactData['contact_name']??"";
       communication = contactData['communication']??"";
       contactAgency = contactData['contact_agency']??"";
     }

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            print("post");
            //  formController.postSes();
          },
          child: Icon(
            Icons.check,
            size: Get.height * 0.034,
          ),
        ),
        title: AppText(text: "Update Services", fontSize: 0.025),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  newServicesController.deleteService(int.parse(studentId.toString()));
                },
                child: Icon(
                  Icons.delete,
                  size: Get.height * 0.034,
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
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
        ],
      ),
      body:

      Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: Get.height * 0.04,
                ),
                SizedBox(width: Get.width * 0.03,
                ),
                Obx(() =>
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<GetStudentInModel>(
                        isExpanded: true,
                        hint: Text(
                          studentId!,
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
                        value: newServicesController.setDataStudentInServicesUpdate,
                        onChanged: (value) {
                          setState(() {
                            newServicesController.setDataStudentInServicesUpdate = value;
                            newServicesController.studentIdUpdate=value!.iD;
                            print("setDataStudentInServicesUpdate object $value");
                            print("studentIdUpdate id ${newServicesController.studentIdUpdate}");
                          });
                        },
                        buttonStyleData:  ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: Get.width*0.78,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 200,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    )),
                //AppText(text: studentId!, fontSize: 0.02),
              ],
            ),

            SizedBox(
              height: Get.height * 0.01,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.timelapse,
                  size: Get.height * 0.04,
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Obx(() => GestureDetector(
                    onTap: () {
                      newServicesController.selectDateAndTimeUpdate(context,int.parse( duration.toString()),selectedDate!);
                    },
                    child: AppText(
                      text: newServicesController
                          .formatDate(newServicesController.selectedUpdateDate.value)
                          .toString(),
                      fontSize: 0.02,color: Colors.grey,))),
               // AppText(text: "$startDate - $duration min", fontSize: 0.018)
              ],
            ),
            SizedBox(height: Get.height*0.014,),
            Row(
              children: [
                AppText(text: "Service Provided :-", fontSize: 0.018),
                SizedBox(width: Get.width*0.014,),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      subject!,
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
                    value: newServicesController.serviceProviderUpdateValue,
                    onChanged: (value) {

                      setState(() {
                        newServicesController.serviceProviderUpdateValue = value;
                        switch(newServicesController.serviceProviderUpdateValue){
                          case "Lesson planning":
                            newServicesController.serviceUpdateId="0";
                            changeProvider=false;
                            break;
                          case "Wrote Session Notes":
                            newServicesController.serviceUpdateId="1";
                            changeProvider=false;
                            changeProvider=false;
                            break;
                          case "Contact":
                            newServicesController.serviceUpdateId="2";
                            changeProvider=true;
                            break;
                          case "Prepared & wrote progress report & new IEP Goals":
                            newServicesController.serviceUpdateId="3";
                            changeProvider=false;
                            break;
                          case "Attended IEP meetings in person or by phone":
                            newServicesController.serviceUpdateId="4";
                            changeProvider=false;
                            break;
                          case "Wrote rationale for increased services":
                            newServicesController.serviceUpdateId="5";
                            changeProvider=false;
                            break;
                        }
                        if(value=="Contact"){
                          newServicesController.selectUpdateContact=true;
                          newServicesController.selectedUpdateContact!.value="Parent/Guardian";
                        }else{
                          newServicesController.selectUpdateContact=false;
                          newServicesController.selectedUpdateContact!.value="";
                        }
                      });
                    },
                    buttonStyleData:  ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      width: Get.width*0.56,
                    ),
                    dropdownStyleData:  DropdownStyleData(
                      maxHeight: Get.height*0.3,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),


            (subject=="Contact" &&changeProvider==true)?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: "Contact Title :-", fontSize: 0.02),
                    SizedBox(width: Get.width*0.014,),
                    AppText(text:contactTitle!, fontSize: 0.018),
                    SizedBox(height: Get.height*0.01,),
                    AppText(text: "Contact Name :-", fontSize: 0.02),
                    SizedBox(width: Get.width*0.014,),
                    AppText(text:contactName!, fontSize: 0.018),
                    SizedBox(height: Get.height*0.01,),
                    AppText(text: "Communication :-", fontSize: 0.02),
                    SizedBox(width: Get.width*0.014,),
                    AppText(text:communication!, fontSize: 0.018),
                    SizedBox(height: Get.height*0.01,),
                    AppText(text: "Contact Agency :-", fontSize: 0.02),
                    SizedBox(width: Get.width*0.014,),
                    AppText(text:contactAgency!, fontSize: 0.018),

                  ],
                ):
                SizedBox()

          ],
        ),
      ),
    );
  }
}
