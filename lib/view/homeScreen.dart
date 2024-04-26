import 'dart:convert';
import 'dart:ffi';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:iep_app/commonWidgets/appText.dart';
import 'package:iep_app/controller/academicController.dart';
import 'package:iep_app/controller/formController.dart';
import 'package:iep_app/controller/homeController.dart';
import 'package:iep_app/controller/checkBioController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/services/prefs.dart';
import 'package:iep_app/view/academicScreen.dart';
import 'package:iep_app/view/formScreen.dart';
import 'package:iep_app/view/updateServicesScreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../constants/stringConstants.dart';
import '../model/InitMonthModel.dart';
import '../model/StudentModel.dart';
import 'newServicesScreen.dart';
import 'newSessionScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final check = Get.put(CheckBioController());
  final homeController = Get.put(HomeController());
  final academicController = Get.put(AcademicController());
  final formController=Get.put(FormController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Prefs.getBool(StringConstants.userLogin) == true) {
        check.checkBiometrics(context, loginTime: false);
      }
    });
    loadSalesData();
  }

  Future loadSalesData() async {
    final String jsonString = await homeController.getJsonFromAssets();
    final dynamic jsonResponse = json.decode(jsonString);
    homeController.chartData.add(StudentMode.fromJson(jsonResponse));
    homeController.updateDropdownItems(homeController.chartData);
    homeController.getGoalData();
  }

  DateTime? selectedDateNew;

  //Code for drawer
  //final scaffoldKey = GlobalKey<ScaffoldState>();
  List<InitMonthGao> geoList = [];


  String? selectedValue;
  @override
  Widget build(BuildContext context) {

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeRight: true,
      removeBottom: true,
      child: Scaffold(
        //Code for drawer

        // key: scaffoldKey,
        // drawer: AcademicScreen(),
        // appBar: AppBar(
        //   leading: GestureDetector(
        //       onTap: (){
        //
        //         scaffoldKey.currentState!.openDrawer();
        //       },
        //       child: Icon(Icons.menu)),
        // ),
        floatingActionButton:PopupMenuButton(
          onSelected: (result) {

            if (result == 0) {
              formController.initPeriod( selectedDateNew,0,context);

            }else{
              formController.initPeriod( selectedDateNew,1,context);

            }
          },
            child: Container(
              width: Get.width * 0.3,
              height: Get.height * 0.04,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  AppText(text: "New Form", fontSize: 0.02)
                ],
              ),
            ),
          itemBuilder: (context)=>[
            const PopupMenuItem(
                value: 0,
                child: Text("Session")),
            const PopupMenuItem(
                value: 1,
                child: Text("Services")),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.042,
            ),
            Expanded(
              child: Stack(
                children: [
                  Obx(() => SfCalendar(
                        showDatePickerButton: true,
                        showTodayButton: true,
                        view: CalendarView.month,
                        dataSource: homeController.getCalendarDataSource(),
                        onViewChanged: (ViewChangedDetails viewChangedDetails) {
                          List<DateTime> visibleDates =
                              viewChangedDetails.visibleDates;
                          if (visibleDates.isNotEmpty) {
                            if (visibleDates.length > 7) {
                                DateTime startDate = visibleDates.elementAt(10);
                                print("month ${startDate.month}  year ${startDate.year}");
                                selectedDateNew=startDate;
                                homeController.initMonth(startDate.month, startDate.year,context);
                            } else {
                              DateTime startDate = visibleDates.first;
                              print(
                                  "month ${startDate.month}  year ${startDate.year}");
                              selectedDateNew=startDate;
                              homeController.initMonth(
                                  startDate.month, startDate.year,context);
                            }
                          }
                        },
                        onSelectionChanged: (CalendarSelectionDetails de) {
                          print("object");
                        },
                        onTap: (CalendarTapDetails details) {

                          if (details.targetElement ==
                              CalendarElement.appointment) {
                            if (details.appointments != null &&
                                details.appointments!.isNotEmpty) {

                              geoList.clear();
                              List<Appointment> appointments = details
                                  .appointments!
                                  .map((dynamic data) => data as Appointment)
                                  .toList();
                              if(appointments[0].location!="services"){
                                if (appointments[0].resourceIds!.isNotEmpty && appointments[0].resourceIds != null) {
                                  List<InitMonthGao> initMonthGaoList = appointments[
                                  0]
                                      .resourceIds!
                                      .map((e) {
                                    if (e is InitMonthGao) {
                                      return e;
                                    }
                                  })
                                      .whereType<InitMonthGao>().toList();
                                  geoList.addAll(initMonthGaoList);};
                                Get.to(FormScreen(
                                  appointments: appointments,
                                  checkNewOld: false,
                                  initMonthGao: geoList,
                                ))!.then((value) {
                                  homeController.initMonth(
                                      details.date!.month, details.date!.year,context);
                                });
                              }else{
                             Get.to(UpdateServiceScreen(appointments: appointments,))!.then((value) {
                             homeController.initMonth(
                             details.date!.month, details.date!.year,context);
                             });
                              }

                            }
                          }
                        },
                        monthViewSettings: const MonthViewSettings(
                          monthCellStyle: MonthCellStyle(),
                          showAgenda: true,
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.appointment,
                        ),
                        allowedViews: const [
                          CalendarView.week,
                          CalendarView.month,
                          CalendarView.schedule
                        ],
                      ),

                  ),
                  Obx(() =>
                  (homeController.showLoaderOnCalender!.value)?
                    Center(
                      child: Container(
                        height: 40,
                        color: Colors.transparent,
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ):SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                          color: Colors.black),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Student',
                            style: TextStyle(
                              fontSize: Get.height * 0.016,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: homeController.items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: Get.height * 0.016,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {

                              selectedValue = value!;

                            homeController.goalData.clear();
                            homeController.getGoalData();
                            for (int i = 0;
                                i < homeController.chartData.length;
                                i++) {
                              for (int j = 0;
                                  j <
                                      homeController.chartData[i].success!.spRels!
                                          .byStu!.goals!.length;
                                  j++) {
                                homeController.goalData.clear();
                                if (selectedValue ==
                                    homeController.chartData[i].success!.spRels!
                                        .byStu!.goals![j].iD) {
                                  homeController.goalData.add(homeController
                                      .chartData[i]
                                      .success!
                                      .spRels!
                                      .byStu!
                                      .goals![j]);
                                  return;
                                }
                              }
                            }
                          },
                          buttonStyleData: ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: Get.height * 0.04,
                            width: Get.width * 0.28,
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            height: Get.height * 0.027,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentDetails {
  final String subject;
  final DateTime startTime;
  final DateTime endTime;

  AppointmentDetails({
    required this.subject,
    required this.startTime,
    required this.endTime,
  });
}

