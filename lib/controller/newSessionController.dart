import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewSessionController extends GetxController{

  RxString? showAbsent="".obs;

  String? makeUpChooseReasonValue;
  String? locationValue;
  final TextEditingController textLocationController = TextEditingController();

  final List<String> subAbsentItems = [
    'Child is sick (spoke to parent)',
    'Child was not available for Remote Session (Covid 19)',
    'Child came late to school (illegal absent)',
    'Death in the family (limited to 5 consecutive days)(spoke to parent)',
    'Due to school programming',
    'Illness in the family which prevented child from coming to school (only 2 per term) (spoke to parent)',
    'Religious observance(spoke to parent)',
    'Stoppage of transportation',
    'Unusually severe weather',
    'None of the above (illegal absent)'
  ];

  final List<String> makeUpChooseReason = [
    'Child receives many related services and there was no time to make up the missed session(s) within 30 calendar days',
    'The child has been absent and there was no time to make up the missed session(s) within 30 days',
    'The child\'s school was closed during the 30 day time period',
    '..provider must be bilingually certified',
    '..provider needs ABA skills',
    '..Child\'s teacher objected to a replacement due to the child\'s adjustment issues',
    'Child\'s availability to be seen at home is limited, due to parents\' scheduling conflicts (FOR HOME CASES ONLY)',
    'Missed session is from a previous provider',
    'Due to COVID absences and/or restrictions in the school I was unable to complete the make-ups within 30 days',
  ];

}