import 'package:get/get.dart';
import '../model/InitModel.dart';
import '../network/api_provider.dart';

class AcademicController extends GetxController{
  RxList<InitPeriods> initData=<InitPeriods>[].obs;

  RxString? firstAcademic="".obs;
  RxBool? showLoader=false.obs;
  initPeriod(DateTime selectedDate) async{
    try{
      showLoader!.value=true;
      initData.clear();
      var response = await ApiProvider().init();
      List<InitPeriods> periods = (response as InitModel).periods ?? [];
      initData.addAll(periods);
      firstAcademic!.value = periods.first.label!;
      int currentYear = selectedDate.year;
      int currentMonth = selectedDate.month;
      List<InitPeriods> filteredPeriods = initData.where((period) {
        DateTime start = DateTime.parse(period.start!);
        DateTime end = DateTime.parse(period.end!);
        return (start.year == currentYear && start.month == currentMonth) ||
            (end.year == currentYear && end.month == currentMonth);
      }).toList();
      print("Filtered periods for $selectedDate: ${filteredPeriods[0].iD}");
      print("date per $filteredPeriods");
      showLoader!.value=false;
    }catch(e){
      showLoader!.value=false;
      print('Error in login(): $e');
    }
  }

}



