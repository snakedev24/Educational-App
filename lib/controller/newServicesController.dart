import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:intl/intl.dart';

import '../model/GetStudentInModel.dart';
import '../network/api_provider.dart';
class NewServicesController extends GetxController{

  String? studentValue;
  String? serviceProvidedValue;
  String? serviceProviderUpdateValue;
  String? serviceId;
  String? serviceUpdateId;
  GetStudentInModel? setDataStudentInServices;
  String? studentId;
  GetStudentInModel? setDataStudentInServicesUpdate;
  String? studentIdUpdate;
  TextEditingController fillCommunityController=TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedUpdateDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  bool selectContact=false;
  bool selectUpdateContact=false;
  String? selectDateString;
  String? selectDateStringUpdate;
  RxBool? loaderApi=false.obs;
  deleteService(int delete) async{
    try{
      loaderApi!.value=true;
      var response = await ApiProvider().deleteService(delete);
      if(response==200){
        Get.back();
      }
      loaderApi!.value=false;
      print("response $response");
    }catch(e){
      loaderApi!.value=false;
      print('Error in delete: $e');
    }
  }
  String? contactTitle;
  TextEditingController contactNameFirst=TextEditingController();
  TextEditingController contactNameLast=TextEditingController();
  String? contactFName;
  TextEditingController contactPhone=TextEditingController();
  TextEditingController contactEmail=TextEditingController();
  String? contactAgency;
  String? relProv_ID;
  String? Communication;
  String dropdownvalue = 'Item 1';
  RxString? selectedContact="".obs;
  RxString? selectedUpdateContact="".obs;

  postService(BuildContext context) async{
    try{


      var request = {
        // "action": "update_other_service",
        "ID": serviceId,
        "spr_ID": "20347",
        "student_ID": studentId,
        "date": selectDateString,
        "duration": duration,
        "other_service": serviceProvidedValue,
        "contact_title": selectedContact!.value,
        "contact_name":contactNameLast.text,
        "contact_fname":contactNameFirst.text,
        "contact_phone":contactPhone.text,
        "contact_email":contactEmail.text,
        "contact_agency":contactAgency??"",
        "rel_prov_ID":"NaN",
        "communication":fillCommunityController.text
      };
      var response = await ApiProvider().postService(request);
      print('Response: $response');
      if (response['outcome'] == 'success') {
        // Handle success
        Get.back();
        print('ID: ${response['ID']}');
      } else {
        // Handle failure
        print('Failed to update service');
        print('Failure message: ${response['msg']}');
        final snackBar = SnackBar(
          content:  Text(response['msg'],style: TextStyle(
              color: Colors.black
          ),),
          backgroundColor: (Colors.white),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      print('Error in getStudentIdName: $e');
    }
  }


  String formatDate(DateTime date) {
    final months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ];

    return '${months[date.month]} ${date.day} ${"- ${date.hour} hour"} ${" ${date.minute} min"}';
  }
  String? duration;
  String? durationUpdateValue;
  Future<void> selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final Duration? pickedDuration = await showDurationPicker(
        context: context,
        initialTime: Duration.zero,
      );

      if (pickedDuration != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedDuration.inHours,
          pickedDuration.inMinutes % 60,
        );
        selectedDate.value = selectedDateTime;
        final int totalMinutes = (pickedDuration.inHours * 60) + pickedDuration.inMinutes;

        // Formatting selectedDate to the desired format "yyyy-MM-dd"
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        selectDateString = formatter.format(selectedDate.value);
        duration= totalMinutes.toString();
        // selectDateString=selectedDate.value.toString();
      }
    }
  }
  Future<void> selectDateAndTimeUpdate(BuildContext context,int durationUpdate,DateTime selectedDateUpdate) async {
    DateTime initialDateTime = selectedDateUpdate; // Set initial date to selectedDate.value
    Duration initialDuration =  Duration(seconds: durationUpdate); // Set initial time to zero duration

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final Duration? pickedDuration = await showDurationPicker(
        context: context,
        initialTime: initialDuration,
      );

      if (pickedDuration != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedDuration.inHours,
          pickedDuration.inMinutes % 60,
        );
        selectedUpdateDate.value = selectedDateTime;
        final int totalMinutes = (pickedDuration.inHours * 60) + pickedDuration.inMinutes;

        durationUpdateValue = totalMinutes.toString();
        selectDateStringUpdate = selectedDate.value.toString();
      }
    }
  }

  final List<String> studentItems = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
  ];
  final List<String> serviceProvidedItems = [
    'Lesson planning',
    'Wrote Session Notes',
    'Contact',
    'Prepared & wrote progress report & new IEP Goals',
    'Attended IEP meetings in person or by phone',
    'Wrote rationale for increased services',
  ];
  final List<String> contactTitleItems = [
    'Parent/Guardian',
    'Classroom Teachers',
    'OT',
    'PT',
    'CO',
    'SP',
    'Shared SEIT',
    'Preschool Director',
    'ITS Supervision',
    'SEIT',

  ];

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final List<String> communityItems = [
    'Parent/Guardian',
    'Classroom Teachers',
    'OT',
    'PT',
    'CO',
    'SP',
    'Shared SEIT',
    'Preschool Director',
    'ITS Supervision',
    'SEIT',

  ];


  final List<String> parentGuardianList=[
    "Discuss activities for carryover in home.",
    "Discuss child's strengths and areas of concern.",
    "Discuss progress and follow-up.",
    "Review IEP Goals.",
    "OT not in place.  Advise parent of importance to contact DOE related service liaison and ITS related service coordinator, Blima Orgel,  borgel@itstherapygroup.com.",
    "PT not in place.  Advise parent of importance to contact DOE related service liaison and ITS related service coordinator, Blima Orgel,  borgel@itstherapygroup.com.",
    "SP not in place.  Advise parent of importance to contact DOE related service liaison and ITS related service coordinator, Blima Orgel,  borgel@itstherapygroup.com.",
    "CO not in place.  Advise parent of importance to contact DOE related service liaison and ITS related service coordinator, Blima Orgel,  borgel@itstherapygroup.com."
  ];
  final List<String> classRoomTeachersList=[
    "Review IEP Goals",
    "Discuss strategies and improve focus and participation.",
    "Discuss necessary modifications and accommodations."
  ];
  final List<String> oTPTCOSPList=[
    "Review implementation of IEP goals within classroom setting.",
    "Discuss necessary modifications and accommodations.",
    "Discuss collaborative efforts and techniques to help child.",
    "Left a detailed message regarding students progress in fine motor skills and asked the OT provider to return the call.",
    "No therapy sessions are being provided due to COVID 19"
  ];
  final List<String> sharedPreItsList=[
    "Discuss collaborative efforts and techniques to help child.",
    "Review methodology and approach.",
    "Review IEP Goals.",

  ];
  final List<String> seitList=[
    "Spoke to previous SEIT in order to review child’s needs/goals and ensure a smooth transition.",
    "Spoke to SEIT taking over the case in order to review child’s needs/goals and ensure a smooth transition.",
  ];
}