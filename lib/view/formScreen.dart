import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/commonWidgets/appText.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import '../controller/formController.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/homeController.dart';
import '../model/GetServicesModel.dart';
import '../model/InitMonthModel.dart';

class FormScreen extends StatefulWidget {
  final List<Appointment>? appointments;
  final List<InitMonthGao>? initMonthGao;
  bool? checkNewOld;
  FormScreen({Key? key, this.appointments, this.checkNewOld, this.initMonthGao})
      : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formController = Get.put(FormController());
  final homeController = Get.put(HomeController());

  String? changeValue;
  String? subject;
  String? agency;
  String? startDate;
  String? endDate;
  String? status;
  String? location;
  List<String> _selectedList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.checkNewOld == false) {
      subject = widget.appointments![0].id.toString();
      status = widget.appointments![0].notes.toString();
      location = widget.appointments![0].location.toString();
      startDate = DateFormat("yyyy-MM-dd HH:mm")
          .format(widget.appointments![0].startTime);
      //startDate=widget.appointments![0].startTime.toString();
      endDate = DateFormat("yyyy-MM-dd HH:mm")
          .format(widget.appointments![0].endTime);
    }else{
      formController.addGoalData.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (widget.checkNewOld == true)
          ?
      Obx(() =>
      (formController.loaderApi!.value)?SizedBox():GestureDetector(
              onTap: () {
                if(formController.servicesGoalsData.isNotEmpty)
                formController.addGoalData.insert(
                    0,
                    AddGoalModel(
                      goalName: formController.servicesGoalsData.isNotEmpty
                          ? formController.servicesGoalsData
                          : null,
                      activity: formController.activityData, // Replace with your desired value
                      menu: formController.stringList, // Replace with your desired value
                      per: formController.outcome2List, // Replace with your desired value
                    ));
                setState(() {});
              },
              child: Container(
                width: Get.width * 0.3,
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    AppText(text: "Add Goal", fontSize: 0.02)
                  ],
                ),
              ),
            ))
          : SizedBox(),
      body:
          Obx(() =>
      (formController.loaderApi!.value)?
      Center(
        child: Container(
          height: 40,
          color: Colors.transparent,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      )
      :Padding(
        padding: EdgeInsets.only(
            top: Get.height * 0.08,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: Get.height * 0.034,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    AppText(text: "Contact", fontSize: 0.025)
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){

                        formController.deleteSession(int.parse(subject.toString()));
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
            SizedBox(
              height: Get.height * 0.02,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: Get.height * 0.04,
                ),
                SizedBox(width: Get.width * 0.03,
                ),

                (widget.checkNewOld == true)
                    ? DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Person Name',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: formController.studentItems
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
                          value: formController.selectedValue,
                          onChanged: (value) {
                            setState(() {
                              formController.selectedValue = value;
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
                          dropdownSearchData: DropdownSearchData(
                            searchController:
                                formController.textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller:
                                    formController.textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for an item...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              formController.textEditingController.clear();
                            }
                          },
                        ),
                      )
                    : AppText(text: subject!, fontSize: 0.02),
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
                (widget.checkNewOld == true)
                    ? Obx(() => GestureDetector(
                        onTap: () {
                          formController.selectDateAndTime(context);
                        },
                        child: AppText(
                            text: formController
                                .formatDate(formController.selectedDate.value)
                                .toString(),
                            fontSize: 0.02)))
                    : AppText(text: "$startDate to $endDate", fontSize: 0.018)
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: Get.height * 0.04,
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                (widget.checkNewOld == true)
                    ? AppText(text: "OT", fontSize: 0.02)
                    : AppText(text: status!, fontSize: 0.02)
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: Get.height * 0.04,
                ),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                (widget.checkNewOld == true)
                    ? DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Agency',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: formController.agencyItems
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
                          value: formController.agencyValue,
                          onChanged: (value) {
                            setState(() {
                              formController.agencyValue = value;
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
                          dropdownSearchData: DropdownSearchData(
                            searchController:
                                formController.textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller:
                                    formController.textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for an item...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              formController.textEditingController.clear();
                            }
                          },
                        ),
                      )
                    : AppText(text: location!, fontSize: 0.02)
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            (widget.checkNewOld == true) ?
                (formController.addGoalData.isNotEmpty)
                    ? MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: formController.addGoalData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        child: GestureDetector(
                                            onTap: () {
                                              formController.addGoalData
                                                  .removeAt(index);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.red,
                                            )),
                                        alignment: Alignment.topRight,
                                      ),
                                      AppText(
                                        text: "Goal 1 :",
                                        fontSize: 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<ServicesGoals>(
                                          isExpanded: true,
                                          hint: Text(
                                            'Select Goal',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: formController
                                              .addGoalData[index].goalName!
                                              .map((item) => DropdownMenuItem<
                                                      ServicesGoals>(
                                                    value: item,
                                                    child: Text(
                                                      item.goal ??
                                                          '', // Replace with the property you want to display
                                                      style:  TextStyle(
                                                        fontSize: 14,
                                                        color: (item.pID == "0")?Colors.grey:Colors.white
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: formController.addGoalData[index].selectedGoal,
                                          onChanged: (ServicesGoals? value) {
                                            setState(() {
                                              if (value != null) {
                                                if(value.pID != "0"){
                                                  formController.addGoalData[index].selectedGoal = value;
                                                }
                                              }
                                            });
                                          },

                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            height: 40,
                                            width: 200,
                                          ),
                                          dropdownStyleData:
                                              const DropdownStyleData(
                                            maxHeight: 200,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),


                                          dropdownSearchData:
                                              DropdownSearchData(
                                            searchController: formController
                                                .textEditingController,
                                            searchInnerWidgetHeight: 50,
                                            searchInnerWidget: Container(
                                              height: 50,
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 4,
                                                right: 8,
                                                left: 8,
                                              ),
                                              child: TextFormField(
                                                expands: true,
                                                maxLines: null,
                                                controller: formController
                                                    .textEditingController,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 10,
                                                    vertical: 8,
                                                  ),
                                                  hintText:
                                                      'Search for an item...',
                                                  hintStyle: const TextStyle(
                                                      fontSize: 12),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            searchMatchFn: (item, searchValue) {
                                              return item.value
                                                  .toString()
                                                  .contains(searchValue);
                                            },
                                          ),
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              formController
                                                  .textEditingController
                                                  .clear();
                                            }
                                          },
                                        ),
                                      ),
                                      // AppText(text: formController.addGoalData[index].goalName!, fontSize: 0.019),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),



                                      Row(
                                        children: [
                                          AppText(
                                            text: "Activity :",
                                            fontSize: 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          if (formController.addGoalData[index].changeValue != null)
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              child: SizedBox(
                                                child: Text(
                                                  formController.addGoalData[index].changeValue!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Get.height*0.017
                                                ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                width: Get.width*0.55,
                                              ),
                                            ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.grey), // Border color
                                          ),
                                        ),
                                        isExpanded: true,
                                        hint: Text(
                                          formController.addGoalData[index].selectedHeader ?? 'Select an option',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        value: formController.addGoalData[index].selectedHeader,
                                        items: formController.addGoalData[index].activity!.keys.map((String header) {
                                          return DropdownMenuItem<String>(
                                            value: header,
                                            child: Text(header),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                          //  _selectedHeader = newValue;
                                            formController.addGoalData[index].selectedList = formController.addGoalData[index].activity![newValue] ?? [];
                                          });
                                        },
                                      ),


                                      if (formController.addGoalData[index].selectedList!.isNotEmpty)
                                        Container(
                                          child: Column(
                                            children: formController.addGoalData[index].selectedList!.map((String subData) {
                                              return ListTile(
                                                title: Text(subData,style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: Get.height*0.016
                                                ),),
                                                onTap: () {
                                                  setState(() {
                                                    formController.addGoalData[index].changeValue = subData;
                                                  });

                                                  // Handle subData item selection here...
                                                  print('Selected: $subData');
                                                },
                                              );
                                            }).toList(),
                                          ),

                                        ),


                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      // AppText(
                                      //     text: formController
                                      //         .addGoalData[index].activity!,
                                      //     fontSize: 0.019),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      AppText(
                                        text: "OutCome :",
                                        fontSize: 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Row(
                                        children: [
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: Text(
                                                formController.outcome1Value!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context).hintColor,
                                                ),
                                              ),
                                              items:  formController
                                                  .addGoalData[index].menu!
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
                                            //  activityValue
                                              value: formController.addGoalData[index].menuVal,
                                              onChanged: (value) {
                                                setState(() {
                                                  formController.addGoalData[index].menuVal= value;
                                                });
                                              },
                                              buttonStyleData:  ButtonStyleData(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                height: 40,
                                                width: Get.width*0.4,
                                              ),
                                              dropdownStyleData: const DropdownStyleData(
                                                maxHeight: 200,
                                              ),
                                              menuItemStyleData: const MenuItemStyleData(
                                                height: 40,
                                              ),
                                              dropdownSearchData: DropdownSearchData(
                                                searchController:
                                                formController.outcome1Controller,
                                                searchInnerWidgetHeight: 50,
                                                searchInnerWidget: Container(
                                                  height: 50,
                                                  padding: const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8,
                                                  ),
                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    controller:
                                                    formController.outcome1Controller,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 8,
                                                      ),
                                                      hintText: 'Search for an item...',
                                                      hintStyle: const TextStyle(fontSize: 12),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                searchMatchFn: (item, searchValue) {
                                                  return item.value
                                                      .toString()
                                                      .contains(searchValue);
                                                },
                                              ),
                                              //This to clear the search value when you close the menu
                                              onMenuStateChange: (isOpen) {
                                                if (!isOpen) {
                                                  formController.outcome1Controller.clear();
                                                }
                                              },
                                            ),
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: Text(
                                               formController.outcome2Value!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context).hintColor,
                                                ),
                                              ),
                                              items: formController
                                                  .addGoalData[index].per!
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
                                              value: formController
                                    .addGoalData[index].perValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  formController
                                                      .addGoalData[index].perValue = value;
                                                });
                                              },
                                              buttonStyleData:  ButtonStyleData(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                height: 40,
                                                width: Get.width*0.4,
                                              ),
                                              dropdownStyleData: const DropdownStyleData(
                                                maxHeight: 200,
                                              ),
                                              menuItemStyleData: const MenuItemStyleData(
                                                height: 40,
                                              ),
                                              dropdownSearchData: DropdownSearchData(
                                                searchController:
                                                formController.outcome2Controller,
                                                searchInnerWidgetHeight: 50,
                                                searchInnerWidget: Container(
                                                  height: 50,
                                                  padding: const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8,
                                                  ),
                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    controller:
                                                    formController.outcome2Controller,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding: const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 8,
                                                      ),
                                                      hintText: 'Search for an item...',
                                                      hintStyle: const TextStyle(fontSize: 12),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                searchMatchFn: (item, searchValue) {
                                                  return item.value
                                                      .toString()
                                                      .contains(searchValue);
                                                },
                                              ),
                                              //This to clear the search value when you close the menu
                                              onMenuStateChange: (isOpen) {
                                                if (!isOpen) {
                                                  formController.outcome2Controller.clear();
                                                }
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      //  AppText(text: widget.initMonthGao![index].outcome!, fontSize: 0.019),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox()
                : (widget.initMonthGao!.isNotEmpty)
                    ? MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.initMonthGao!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        child: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.topRight,
                                      ),
                                      AppText(
                                        text: "Goal 1 :",
                                        fontSize: 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),

                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),

                                      AppText(
                                          text:
                                              widget.initMonthGao![index].goal!,
                                          fontSize: 0.019),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      AppText(
                                        text: "Activity :",
                                        fontSize: 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      AppText(
                                          text: widget
                                              .initMonthGao![index].activity!,
                                          fontSize: 0.019),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      AppText(
                                        text: "OutCome :",
                                        fontSize: 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),


                                      AppText(text: widget.initMonthGao![index].outcome!,
                                          fontSize: 0.019),



                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    : SizedBox(),
          ],
        ),
      )),
    );
  }
}
