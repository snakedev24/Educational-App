import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/model/GetStudentInModel.dart';
import 'package:intl/intl.dart';
import '../model/ActivityModel.dart';
import '../model/GaoSessionModel.dart';
import '../model/GetServicesModel.dart';
import '../model/InitModel.dart';
import '../model/MissedModel.dart';
import '../network/api_provider.dart';
import '../view/newServicesScreen.dart';
import '../view/newSessionScreen.dart';

class FormController extends GetxController{

  String? selectedValue;
  String? outcome1Value;
  String? outcome2Value;
  String? agencyValue;
  String? statusValue;
  ServicesGoals? selectedServiceGoal;
  List<AddGoalModel> addGoalData=[];

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textStatusController = TextEditingController();
  final TextEditingController outcome1Controller = TextEditingController();
  final TextEditingController outcome2Controller = TextEditingController();
  final TextEditingController goalDropDownController = TextEditingController();
  final TextEditingController activityTextEditingController = TextEditingController();
  final TextEditingController activityDropDownController = TextEditingController();


  String formatDate(DateTime date) {
    final months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ];

    return '${months[date.month]} ${date.day} ${"- ${date.hour} hour"} ${" ${date.minute} min"}';
  }
  RxList<InitPeriods> initData=<InitPeriods>[].obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxString? selectedDateNew=''.obs;
  RxBool? loaderApi=false.obs;
  RxList<InitAgenciesModel> initAgenciesData=<InitAgenciesModel>[].obs;
  InitAgenciesModel? getDataOfAgency;
  String? selectedAgency;
  String? subAbsentValue;
  RxBool? isLoadNewService=false.obs;
  String? newPeriodId;
  initPeriod(DateTime? selectedDate,int checkNav,BuildContext context) async{
    try{
      loaderApi!.value=true;
      isLoadNewService!.value=true;
      initData.clear();
      initAgenciesData.clear();

      var response = await ApiProvider().init();
      for (var period in  (response as InitModel).periods!) {
        DateTime startDate = DateTime.parse(period.start!);
        DateTime endDate = DateTime.parse(period.end!);
        if (selectedDate!.isAfter(startDate) && selectedDate.isBefore(endDate)) {
          newPeriodId=period.iD.toString();
        }
      }
      if(newPeriodId==null){
        final snackBar = SnackBar(
          content:  Text("No session and service available for this month.",style: TextStyle(color: Colors.black),),
          backgroundColor: (Colors.white),
        );
       return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      print("new id peroid $newPeriodId");
      if(checkNav==0){
        Get.to(NewSessionScreen());
        loaderApi!.value=false;
        getActivityApiCall();
      }else{
        Get.to(NewServicesScreen());
      }

      getServicesApiCall(newPeriodId!);
    //  getServicesApiCall((response as InitModel).periodID.toString());
      initAgenciesData.addAll((response).agencies!);
      print("initAgenciesData $initAgenciesData");
    }catch(e){
      print('Error in login(): $e');
    }
  }
  List<ServicesGoals> servicesGoalsData=<ServicesGoals>[].obs;

  String? selectGoal="Select";
  List<int> idForStudentName=[];
  RxList<String> locationData=<String>[].obs;
  String? spRealsId;
  String? provID;
  String? studentID;
  getServicesApiCall(String peroid) async{
    try{
      locationData.clear();
      servicesGoalsData.clear();
      idForStudentName.clear();
      var response = await ApiProvider().getService(peroid);
      if ((response as GetServicesModel).sPRels !=null ) {
        print("response getServices ${response.sPRels}");
        servicesGoalsData.addAll(response.sPRels![0].goals!);
        for(int i=0;i<response.sPRels!.length;i++){
          idForStudentName.add(int.parse( response.sPRels![i].studentID.toString()));
          locationData.add("School (${response.sPRels![i].schoolAddress.toString()})");
        }
        await getStudentIdName(idForStudentName);
        print("id student $idForStudentName");
        await getMissedData(response.sPRels![0].iD!,response.sPRels![0].studentID,response.sPRels![0].provID,peroid);
        loaderApi!.value=false;
        isLoadNewService!.value=false;
        print("service goal $servicesGoalsData");
        spRealsId=response.sPRels![0].iD??"";
        provID=response.sPRels![0].provID??"";
        studentID=response.sPRels![0].studentID??"";
      }
    }catch(e){
      print('Error in getServices: $e');
    }
  }
  GetStudentInModel? setDataStudentIn;
  RxList<GetStudentInModel> studentData=<GetStudentInModel>[].obs;

  List<MissedModel> missedList=<MissedModel>[].obs;
  MissedModel? missedValue;
  String? missedStringValue;

  getMissedData(String sp_rel_ID, student_ID, prov_ID, period_ID) async {
    try {
      missedList.clear();
      var response = await ApiProvider().getMissed(sp_rel_ID, student_ID, prov_ID, period_ID);
      // Process the response here
      if (response != null && response is List<dynamic>) {
        missedList =
        response.map((item) => MissedModel.fromJson(item)).toList().obs;

        // Now you have a list of MissedModel objects in missedList
        // You can perform operations on this list or use the data as needed
        print("Missed Data: $missedList");
      }
    } catch (e) {
      print('Error in getMissedData: $e');
    }
  }

  getStudentIdName(List<int> id) async{
    try{
      studentData.clear();
      if(id.isNotEmpty){
        var response = await ApiProvider().getStudentIn(id);
        studentData.addAll(response);
        for(int i=0;i<studentData.length;i++){
          locationData.add("Home (${studentData[i].address})");
        }
        print("studentData id $studentData");
      }

    }catch(e){
      print('Error in getStudentIdName: $e');
    }
  }
  deleteSession(int delete) async{
    try{
      loaderApi!.value=true;
      var response = await ApiProvider().deleteSession(delete);
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
  List<GaoSessionModel> gaoSendDataSession=[];
  List<Gao> gaoList = [];
  postSes(BuildContext context) {
    print("addGoalData $addGoalData");
    gaoSendDataSession.clear();
    gaoList.clear();
    if(addGoalData.isNotEmpty){
      for (int i = 0; i < addGoalData.length; i++) {
        // Create a list of Gao objects for each entry in addGoalData
        Gao gao = Gao(gaoID: "0",
            goalID: addGoalData[i].selectedGoal!.iD, activity: addGoalData[i].changeValue,
            outcome: "Child performed task with ${addGoalData[i].menuVal} ${addGoalData[i].perValue}",
            archive: "0");
        gaoList.add(gao);
        GaoSessionModel gaoSessionModel = GaoSessionModel(gao: gaoList);
        gaoSendDataSession.add(gaoSessionModel);
        print("gaoSenderSession $gaoSendDataSession");
      }
    }

    if(schoolHomeString!.isNotEmpty&&statusValue!.isNotEmpty&&onlyYear!.isNotEmpty
    &&endHour!.isNotEmpty&&endMin!.isNotEmpty&&startHour!.isNotEmpty&&startMin!.isNotEmpty
    ){
      postSession(context);
    }else{
      final snackBar = SnackBar(
        content:  Text("Please add requird information",style: TextStyle(
            color: Colors.black
        ),),
        backgroundColor: (Colors.white),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  String? missedId;
  String? schoolHomeString;
  String? location;
  RxString? showAbsent="".obs;
  String? missed30dAY;
  postSession(BuildContext context) async{
    try{
      loaderApi!.value=true;
      Map<String, dynamic> sessionData = {
        "sp_rel_ID": spRealsId,
        "prov_ID": provID,
        "student_ID": studentID,
        "start": startDateFinal,
        "end": endDateFinal,
        "loc_tag": schoolHomeString,
        "location":location,
        "note": "",
        "status":  showAbsent!.value,
        "absent_reason": (subAbsentValue!=null)?subAbsentValue:"NaN",
        if(gaoSendDataSession.isNotEmpty)
          "gao": gaoSendDataSession[0].gao,
        "is_SEIT": "1",
         "missed_ID": (missedId!=null)?missedId!:"",
         "makeup_30d": (missed30dAY!=null)?missed30dAY!:"",
        "raw_start": [
          onlyYear,
          endHour,
          endMin,
          startHour,
          startMin,

        ],
        "st": "seit"
      };
      print("reponse $sessionData");
      var response = await ApiProvider().addNewSession(sessionData);
      loaderApi!.value=false;
      if (response != null ) {
        if(response.containsKey("msg")){
          final errorMsg = response["msg"];
          if (errorMsg.containsKey("err") && errorMsg["err"] != null) {
            final List<dynamic> errorList = errorMsg["err"];
            errorList.forEach((error) {
              final snackBar = SnackBar(
                content:  Text(error,style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: (Colors.white),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              print("Error message: $error");
            });
          }
        }
        else if (response != null && response.containsKey("ID") &&response.containsKey("ID")!=null) {
          Get.back();
          final snackBar = SnackBar(
            content:  Text("Session Save Successfully",style: TextStyle(
                color: Colors.black
            ),),
            backgroundColor: (Colors.white),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      print("postResponse $response");
    }catch(e){
      print('Error in getStudentIdName: $e');
    }
  }

  String? selectActivity ="Select";
  List<String> stringList = [];
  List<String> outcome2List = [];
  List<String> activityList = [];
  Map<String, List<String>> activityData = {};
  getActivityApiCall() async{
    try{
      var response = await ApiProvider().getActivity();
      if ((response as ActivityModel).activity !=null ) {
        if (response.outcomeFrequency != null ) {
          stringList.clear();
          outcome2List.clear();
          activityData.clear();
          OutcomeFrequency? outcomeFrequency = response.outcomeFrequency;
          OutcomeLevel? outcomeLevel = response.outcomeLevel;
          Map<String, dynamic> toJsonData = outcomeFrequency!.toJson();
          Map<String, dynamic> toJsonDataLevel = outcomeLevel!.toJson();
          outcome1Value=outcomeFrequency.minimal;
          outcome2Value=outcomeLevel.cuing;
          toJsonData.forEach((key, value) {
            if (value != null) {
              stringList.add(value.toString());
            }
          });
          toJsonDataLevel.forEach((key, value) {
            if (value != null) {
              outcome2List.add(value.toString());
            }
          });
          if (response.activity != null) {
            ActivityFreLeModel? activityFreLe = response.activity;
            if (activityFreLe != null) {
              Map<String, dynamic> toJsonActivity = activityFreLe.toJson();
              toJsonActivity.forEach((key, value) {
                if (value != null && value is List<String>) {
                  activityData[key] = value;
                }
              });
            }
          }
        }
      }
    }catch(e){
      print('Error in getActivityApiCall: $e');
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

  final List<String> statusItems = [
    'Scheduled',
    'Absent',
    'School is Closed',
    'Therapist Cancelled',
    'Make Up',
  ];
  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formattedTime = DateFormat.jm().format(dateTime); // Format time to 'h:mm a'
    return formattedTime;
  }
  String? formattedTimeRange;
  String? startHour;
  String? startMin;
  String? endHour;
  String? endMin;
  String? utcDate;
  String? onlyYear;
  String? startDateFinal;
  String? endDateFinal;
  Future<void> selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      print("pickedData $pickedDate");

      DateTime dateTime = DateTime.parse(pickedDate.toString());
      onlyYear=dateTime.year.toString();
      final DateFormat formatter = DateFormat('MMM dd');
      final String formattedDate = formatter.format(pickedDate);
      print("formsttedDate $formattedDate");
      final TimeOfDay? startTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (startTime != null) {
        final TimeOfDay? endTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (endTime != null) {
          final String formattedStartTime =
          _formatTimeOfDay(startTime); // Format start time
          final String formattedEndTime =
          _formatTimeOfDay(endTime); // Format end time

          formattedTimeRange =
              '$formattedStartTime to $formattedEndTime';

          print("Formate start $formattedStartTime");
          print("Formte end $formattedEndTime");
          print('Selected time range: $formattedTimeRange');
          List<String> timeParts = formattedStartTime.split(' ');
          List<String> timeEndParts = formattedEndTime.split(' ');
            String time = timeParts[0];
            List<String> timeValues = time.split(':');
          String timeEnd = timeEndParts[0];
          List<String> timeValuesEnd = timeEnd.split(':');
              startHour = timeValues[0]; // Extract hours
              startMin = timeValues[1];
              endHour = timeValuesEnd[0]; // Extract hours
              endMin = timeValuesEnd[1]; // Extract minutes
              print('StartHours: $startHour');
              print('StartMinutes: $startMin');

          final DateTime startDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            startTime.hour,
            startTime.minute,
          );

          final DateTime endDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            endTime.hour,
            endTime.minute,
          );
          startDateFinal = DateFormat('yyyy-MM-dd HH:mm:ss').format(startDateTime);
          endDateFinal= DateFormat('yyyy-MM-dd HH:mm:ss').format(endDateTime);
          print("startDateFinal $startDateFinal");
          print("endDateFinal $endDateFinal");

        }
      }
      selectedDateNew!.value = formattedDate;
      print("select date new ${selectedDateNew!.value}");
      }
    }

}

class AddGoalModel{
  List<ServicesGoals>? goalName=<ServicesGoals>[].obs;
  ServicesGoals? selectedGoal;
  Map<String, List<String>>? activity;
  String? activityValue;
  List<String>? menu;
  String? menuVal;
  List<String>? per;
  String? perValue;
  String? selectedHeader;
  String? changeValue;
  List<String> selectedList=[];
  AddGoalModel({this.goalName, this.activity, this.menu, this.per});
}



