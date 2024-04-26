import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iep_app/controller/formController.dart';
import 'package:iep_app/model/InitMonthModel.dart';
import 'package:iep_app/services/prefs.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math' as math;
import '../model/GetServicesModel.dart';
import '../model/InitModel.dart';
import '../model/StudentModel.dart';
import '../network/api_provider.dart';
class HomeController extends GetxController{

  RxList<Color> _alreadyUsedColors = <Color>[].obs;
  List<Goals> goalData = <Goals>[].obs;
  RxList<InitMonthModel> initMonthData=<InitMonthModel>[].obs;
  RxList<InitMonthNotes> initMonthNotesData=<InitMonthNotes>[].obs;
  RxString? firstAcademic="".obs;
  RxBool? showLoader=false.obs;
  RxList<int> idForStudentName=<int>[].obs;
  RxBool? showLoaderOnCalender=false.obs;
  Set<String> uniqueItems = Set();
  Color randomColor(double opacity) {
    Color newColor =
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    while (_alreadyUsedColors.contains(newColor))
      newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(opacity);
    _alreadyUsedColors.add(newColor);
    return newColor;
  }

  final formController =Get.put(FormController());

  initMonth(int month, year,BuildContext context) async {
    try {
      idForStudentName.clear();
      var response = await ApiProvider().getInitMonth(month, year);
      initMonthData.assignAll([response as InitMonthModel]);

      // Check if notes is null or empty
      if (response.notes != null && response.notes!.isNotEmpty) {
        initMonthNotesData.assignAll(response.notes!);
        for (int i = 0; i < initMonthNotesData.length; i++) {
          if (!idForStudentName.contains(int.parse(initMonthNotesData[i].studentID.toString()))) {
            idForStudentName.add(int.parse(initMonthNotesData[i].studentID.toString()));
          }
        }
      } else {
        // Handle the case when notes is null or empty
        // Maybe show a message or perform an alternative action
        final snackBar = SnackBar(
          content:  Text("No notes available for this response.",style: TextStyle(
              color: Colors.black
          ),),
          backgroundColor: (Colors.white),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      getCalendarDataSource();

      showLoader!.value = false;
    } catch (e) {
      print('Error in initMonth(): $e');
    }
  }


  Future<String> getJsonFromAssets() async {
    return await rootBundle.loadString('assets/Json/data.json');
  }

  void updateDropdownItems(List<StudentMode> chartData) {
    Set<String> uniqueDropdownItems = Set();
    for (int i = 0; i < chartData.length; i++) {
      for (int j = 0; j < chartData[i].success!.spRels!.byStu!.goals!.length; j++) {
        uniqueDropdownItems.add(chartData[i].success!.spRels!.byStu!.goals![j].iD.toString());
      }
    }
    items.value = uniqueDropdownItems.toList();
  }

  getGoalData(){
    for (int i = 0; i < chartData.length; i++) {
      goalData.addAll(chartData[i].success!.spRels!.byStu!.goals!);
    }
  }

  RxList<String> items=<String>[].obs;

  List<StudentMode> chartData = [];
  Color parseColor(String colorCode) {
    if (colorCode != null && colorCode.isNotEmpty && colorCode.length == 7 && colorCode.startsWith('#')) {
      String hexColor = colorCode.substring(1); // Remove the # symbol
      int parsedColor = int.parse(hexColor, radix: 16);
      return Color(parsedColor).withAlpha(0xFF); // Set alpha to fully opaque (0xFF)
    } else {
      return Colors.black; // Return a default color if the input is invalid
    }
  }

  _DataSource getCalendarDataSource() {
    List<Appointment> appointments = [];
    for (var event in initMonthData) {
      if(event.otherServices != null){
        for(var data in event.otherServices!){
          appointments.add(Appointment(
            startTime: DateTime.parse(data.date!),
            endTime: DateTime.parse(data.date!),
            subject: data.otherService!,
            color: parseColor(data.color!),
            id: data.iD,
            location: "services",
            recurrenceId:data.detail!,
            notes: data.duration,
            recurrenceRule: data.provID,

          ));
        }
      }};
    for (var event in initMonthData) {
      if(event.notes != null){
        for(var data in event.notes!){
          appointments.add(Appointment(
            startTime: DateTime.parse(data.start!),
            endTime: DateTime.parse(data.end!),
            subject: data.note!,
            color: parseColor(data.color!),
            id: data.iD,
            recurrenceId:data.parentID,
            resourceIds: data.gao??[],
            location: "${data.locTag} ${data.location}",
            notes: data.status,
            recurrenceRule: "${data.locTag} ${data.location}",


          ));
        }
      }
    }
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
