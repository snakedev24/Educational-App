import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iep_app/commonWidgets/appText.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:iep_app/model/GetStudentInModel.dart';
import '../controller/formController.dart';
import '../controller/newSessionController.dart';
import '../model/GetServicesModel.dart';
import '../model/MissedModel.dart';

class NewSessionScreen extends StatefulWidget {
   NewSessionScreen({Key? key}) : super(key: key);

  @override
  State<NewSessionScreen> createState() => _NewSessionScreenState();
}

class _NewSessionScreenState extends State<NewSessionScreen> {
  final formController = Get.put(FormController());
  final newSessionController=Get.put(NewSessionController());
  String? changeValue;
  String? subject;
  String? agency;
  String? startDate;
  String? endDate;
  String? status;
  String? location;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formController.statusValue="Scheduled";
    formController.addGoalData.clear();
    formController.setDataStudentIn=null;
    formController.missedValue=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            print("post");
         formController.postSes(context);
          },
          child: Icon(
            Icons.check,
            size: Get.height * 0.034,
          ),
        ),
        title: AppText(text: "Contact", fontSize: 0.025),
        actions: [
          Row(
            children: [
              Icon(
                Icons.delete,
                size: Get.height * 0.034,
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
      floatingActionButton:
      Obx(() =>
      (formController.isLoadNewService!.value)?SizedBox()
          :GestureDetector(
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
      )),
      body:
      Obx(() =>
      (formController.isLoadNewService!.value)?
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

            left: Get.width * 0.05,
            right: Get.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
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
                      key: UniqueKey(),
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
                      value: formController.setDataStudentIn,
                      onChanged: (value) {
                        setState(() {
                          formController.setDataStudentIn = value;
                          print("setDataStudentIn object $value");
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: Get.width*0.75,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ))
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
                        formController.selectDateAndTime(context);
                      },
                      child: (formController.selectedDateNew!.value.isNotEmpty)?AppText(
                          text: "${formController.selectedDateNew!.value} - ${formController.formattedTimeRange}"
                              .toString(),
                          fontSize: 0.02):AppText(text: "Select Date", fontSize: 0.02)))
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
                 Obx(() =>
                 DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Service Location',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: formController.locationData
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
                      value: newSessionController.locationValue,
                      onChanged: (value) {
                        setState(() {
                          newSessionController.locationValue = value;
                          // Split the original string by space
                          List<String> parts = value!.split(' ');
                          formController.schoolHomeString = parts.isNotEmpty ? parts.first : '';
                          parts.removeAt(0);
                          formController.location = parts.join(' ');
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: Get.width*0.75,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 50,
                      ),
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          newSessionController.textLocationController.clear();
                        }
                      },
                    ),
                  ))

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    size: Get.height * 0.04,

                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: formController.statusItems
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
                      value: formController.statusValue,
                      onChanged: (value) {
                        setState(() {
                          formController.statusValue = value;
                          if(value=="Absent"){
                            formController.showAbsent!.value="Absent";
                          }else if(value=="Make Up"){
                            formController.showAbsent!.value="Make_Up";
                          }else{
                            if(value=="School is Closed"){
                              formController.showAbsent!.value="School_Closed";
                            }else if(value=="Therapist Cancelled"){
                              formController.showAbsent!.value="Cancelled";
                          }
                            formController.showAbsent!.value="Scheduled";
                          }
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: Get.width*0.75,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          formController.textStatusController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
              Obx(() =>
              (formController.showAbsent!.value=="Absent")?
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width*0.06,
                  ),

                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Absent Reason',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: newSessionController.subAbsentItems
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
                      value: formController.subAbsentValue,
                      onChanged: (value) {
                        setState(() {
                          formController.subAbsentValue = value;

                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: Get.width*0.77,
                      ),
                      dropdownStyleData:  DropdownStyleData(
                        maxHeight: Get.width,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 100,
                      ),

                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          formController.textStatusController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ):
                  Obx(() =>
              (formController.showAbsent!.value=="Make_Up")?
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: Get.height*0.01,),
                   AppText(
                       text: "Making Up For",
                       fontSize: 0.016),
                   SizedBox(height: Get.height*0.01,),
                   Obx(() =>
                   DropdownButtonHideUnderline(
                     child: DropdownButton2<MissedModel>(
                       isExpanded: true,
                       hint: Text(
                         '--Choose Section--',
                         style: TextStyle(
                           fontSize: 14,
                           color: Theme.of(context).hintColor,
                         ),
                       ),
                       items: formController.missedList
                           .map((items) => DropdownMenuItem(
                         value: items,
                         child: Text(
                          "${items.start}--${items.end} ${items.status!}",
                           style: const TextStyle(
                             fontSize: 14,
                           ),
                         ),
                       ))
                           .toList(),
                       value: formController.missedValue,
                       onChanged: (value) {
                         setState(() {
                           formController.missedStringValue="${value!.start}--${value.end} ${value.status!}";
                           formController.missedValue = value;
                           formController.missedId=value.iD;
                           print("missed value select ${formController.missedValue}");
                         });
                       },
                       buttonStyleData:  ButtonStyleData(
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         height: 40,
                         width: Get.width*0.9,
                       ),
                       dropdownStyleData:  DropdownStyleData(
                         maxHeight: Get.width,
                       ),
                       menuItemStyleData: const MenuItemStyleData(
                         height: 50,
                       ),

                       //This to clear the search value when you close the menu
                       onMenuStateChange: (isOpen) {
                         if (!isOpen) {
                           formController.textStatusController.clear();
                         }
                       },
                     ),
                   )),
                   SizedBox(height: Get.height*0.01,),
                   AppText(text: "In consultation with the student's teacher and parent it is agreed that in order for the child's IEP goals to be better met, every effort should be made to make up for all missed sessions. Everyone agreed that the child would benefit from the make ups even if they are more than after 30 calendar days after the missed session(s). Reasons make-up sessions was not done within 30 days of the missed session:",
                       fontSize: 0.017),
                   SizedBox(height: Get.height*0.01,),
                   DropdownButtonHideUnderline(
                     child: DropdownButton2<String>(
                       isExpanded: true,
                       hint: Text(
                         '--Choose Reason--',
                         style: TextStyle(
                           fontSize: 14,
                           color: Theme.of(context).hintColor,
                         ),
                       ),
                       items: newSessionController.makeUpChooseReason
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
                       value: newSessionController.makeUpChooseReasonValue,
                       onChanged: (value) {
                         setState(() {
                           newSessionController.makeUpChooseReasonValue = value;
                           switch(newSessionController.makeUpChooseReasonValue){
                             case 'Child receives many related services and there was no time to make up the missed session(s) within 30 calendar days':
                               formController.missed30dAY="0";
                               break;
                             case 'The child has been absent and there was no time to make up the missed session(s) within 30 days':
                               formController.missed30dAY="1";
                               break;
                             case 'The child\'s school was closed during the 30 day time period':
                               formController.missed30dAY="2";
                               break;
                             case '..provider must be bilingually certified':
                               formController.missed30dAY="3";
                               break;
                             case '..provider needs ABA skills':
                               formController.missed30dAY="4";
                               break;
                             case '..Child\'s teacher objected to a replacement due to the child\'s adjustment issues':
                               formController.missed30dAY="5";
                               break;
                             case 'Child\'s availability to be seen at home is limited, due to parents\' scheduling conflicts (FOR HOME CASES ONLY)':
                               formController.missed30dAY="6";
                               break;
                             case 'Missed session is from a previous provider':
                               formController.missed30dAY="7";
                               break;
                             case 'Due to COVID absences and/or restrictions in the school I was unable to complete the make-ups within 30 days':
                               formController.missed30dAY="8";
                               break;

                           }
                         });
                       },
                       buttonStyleData:  ButtonStyleData(
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         height: 40,
                         width: Get.width*0.9,
                       ),
                       dropdownStyleData:  DropdownStyleData(
                         maxHeight: Get.width,
                       ),
                       menuItemStyleData: const MenuItemStyleData(
                         height: 80,
                       ),

                       //This to clear the search value when you close the menu
                       onMenuStateChange: (isOpen) {
                         if (!isOpen) {
                           formController.textStatusController.clear();
                         }
                       },
                     ),
                   ),
                 ],
               )
              :SizedBox())),
              SizedBox(
                height: Get.height * 0.03,
              ),
              (formController.addGoalData.isNotEmpty)
                  ? MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                            //Select Goal
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
                            //Activity
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
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            AppText(
                              text: "OutCome :",
                              fontSize: 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            AppText(
                              text: "Child performed task with..(Select Below)",
                              color: Colors.grey,
                              fontSize: 0.018,

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
              )
                  : SizedBox()

            ],
          ),
        ),
      )),
    );
  }
}
