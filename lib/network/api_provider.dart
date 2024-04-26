import 'package:get/get.dart';
import 'package:iep_app/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:iep_app/constants/stringConstants.dart';
import 'package:iep_app/model/GetServicesModel.dart';
import 'package:iep_app/model/GetStudentInModel.dart';
import 'package:iep_app/model/InitModel.dart';
import 'package:iep_app/model/InitMonthModel.dart';
import 'package:iep_app/services/prefs.dart';
import 'package:iep_app/view/loginScreen.dart';
import '../commonWidgets/loader_dialog.dart';
import '../model/ActivityModel.dart';
import '../model/LoginModel.dart';

class ApiProvider{

  final Dio _dio =Dio();

  String getUrlWithBaseUrl(String url){
    return ApiConstants.baseUrl + url;
  }

  var headerOptions = Options(
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  String? accessToken = Prefs.getString(StringConstants.token);

  Future<dynamic> login(String email, password,) async {
    CommonDialog.showLoading();
    var map = <String, dynamic>{
      "username": email,
      "password": password,
    };
    try {
      final response = await _dio.post(getUrlWithBaseUrl(ApiConstants.login),
          data: map, options: headerOptions);
      CommonDialog.hideLoading();
      String? token = response.headers.map['iepnet-token']?.first;
      Prefs.setString(StringConstants.token,token!);
      print("token $token");
      return LoginModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      CommonDialog.hideLoading();
      if (error.response!.statusCode == 200) {
        print("error Login ${error.response!.data['message'].toString()}");
      }else if (error.response!.statusCode == 404) {
       print(error.response!.statusMessage.toString());
      }else{
        print(error.response!.statusMessage.toString());
      }
    }
  }

  Future<dynamic> init() async {
    try {
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");
      final response = await _dio.get(getUrlWithBaseUrl(ApiConstants.init),
          options: headerOptionsWithToken);
      return InitModel.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      if(error.response!.statusMessage=="Unauthorized"){
        Get.offAll(LoginScreen());
        Prefs.setBool(StringConstants.userLogin,false);
      }
    }
  }

  Future<dynamic> getService(String period)async{
    try{
      String userId=Prefs.getString(StringConstants.userId)!;
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");
      final response = await _dio.get(getUrlWithBaseUrl("${ApiConstants.getServices}?prov_ID=$userId&period=${period}"),
          options: headerOptionsWithToken);
      print("getServicesData ${response.data}");
      return GetServicesModel.fromJson(response.data);
    }on DioError catch(error){
      if(error.response!.statusMessage=="Unauthorized"){
        Get.offAll(LoginScreen());
        Prefs.setBool(StringConstants.userLogin,false);
      }
    }
  }

  Future<dynamic> getInitMonth(int month,year)async{
    try{
      String userId=Prefs.getString(StringConstants.userId)!;
      int userIdInt=int.parse(userId);
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");
      final response = await _dio.get(getUrlWithBaseUrl("${ApiConstants.getInitMonth}?prov_ID=$userIdInt&m=$month&Y=$year"),
          options: headerOptionsWithToken);
      print("initMonth Data ${response.data}");
      return InitMonthModel.fromJson(response.data);
    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }


  Future<dynamic> getActivity()async{
    try{
      String userId=Prefs.getString(StringConstants.userId)!;
      int userIdInt=int.parse( userId);
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");
      final response = await _dio.get(getUrlWithBaseUrl("${ApiConstants.getActiviity}?types[]=activity&types[]=outcome"),
          options: headerOptionsWithToken);
      return ActivityModel.fromJson(response.data);
    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }

  Future<dynamic> getStudentIn(List<int> id)async{
    try{
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      String idString = id.join(',');
      print("acc token $accessToken");
      print("idString $idString");
      final response = await _dio.get(getUrlWithBaseUrl("${ApiConstants.getStudentInt}?in=$idString"),
          options: headerOptionsWithToken);
      List<dynamic> responseData = response.data;
      List<GetStudentInModel> students = responseData
          .map((data) => GetStudentInModel.fromJson(data))
          .toList();
      return students;
    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }

  Future<dynamic> addNewSession(var map) async {
    CommonDialog.showLoading();
    try {
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token": accessToken!,
        },
      );
      final response = await _dio.post(
        getUrlWithBaseUrl(ApiConstants.session),
        data: map,
        options: headerOptionsWithToken,
      );
      CommonDialog.hideLoading();
      // Handling success response
      if (response.statusCode == 200) {
        print("Success: ${response.data}");
        // You can return the parsed response data if needed
        return response.data;
      }
    } on DioError catch (error) {
      CommonDialog.hideLoading();
      // Handling different error scenarios
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
      if (error.response != null) {
        if (error.response!.statusCode == 401){
          print(error.response!.statusMessage);
          if(error.response!.statusMessage=="Unauthorized"){
            Get.offAll(LoginScreen());
            Prefs.setBool(StringConstants.userLogin,false);
          }
        }
        if (error.response!.statusCode == 200) {
          // Handling specific failure scenarios based on response data
          final responseData = error.response!.data;
          if (responseData.containsKey("makeup_reload_misseds") &&
              responseData.containsKey("msg")) {
            final errMsg = responseData['msg']['err'];
            // Handle the error messages here
            errMsg.forEach((msg) => print("Error: $msg"));
          } else {
            // Handle other error cases
            print("Error: ${error.response!.statusMessage}");
          }
        } else if (error.response!.statusCode == 404) {
          print("Error 404: ${error.response!.statusMessage}");
        } else {
          print("Error: ${error.response!.statusMessage}");
        }
      } else {
        print("Network error: ${error.message}");
      }
      // Return an error object or null based on your requirement
      return null;
    }
    // Return null if no response or error occurred
    return null;
  }

  Future<dynamic> postService(var map) async {
    CommonDialog.showLoading();
    print("map posService $map");
    try {
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token": accessToken!,
        },
      );
      final response = await _dio.post(getUrlWithBaseUrl(ApiConstants.service),
          data: map, options: headerOptionsWithToken);
      CommonDialog.hideLoading();
      if (response.statusCode == 200) {
        return response.data; // Return success data
      } else {
        throw DioError(
          requestOptions: RequestOptions(
            path: getUrlWithBaseUrl(ApiConstants.service),
          ),
          response: response,
          error: 'Request failed with status ${response.statusCode}',
        );
      }
     // return response.data;
    } on DioError catch (error, stacktrace) {
      CommonDialog.hideLoading();
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }

  Future<dynamic> getMissed(String sp_rel_ID,student_ID,prov_ID,period_ID)async{
    try{
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");

      final response = await _dio.get(getUrlWithBaseUrl("${ApiConstants.missed}?sp_rel_ID=$sp_rel_ID&student_ID=$student_ID&prov_ID=$prov_ID&period_ID=$period_ID"),
          options: headerOptionsWithToken);

      return response.data;
    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }

  Future<dynamic> deleteSession(int deleteId)async{
    try{
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");

      final response = await _dio.delete(getUrlWithBaseUrl("${ApiConstants.session}?ID=$deleteId"),
          options: headerOptionsWithToken);
      return response.statusCode;

    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }

  Future<dynamic> deleteService(int deleteId)async{
    try{
      var headerOptionsWithToken = Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "iepnet-token":accessToken!
        },
      );
      print("acc token $accessToken");

      final response = await _dio.delete(getUrlWithBaseUrl("${ApiConstants.service}?ID=$deleteId"),
          options: headerOptionsWithToken);
      return response.statusCode;

    }on DioError catch(error){
      if (error.response!.statusCode == 401){
        print(error.response!.statusMessage);
        if(error.response!.statusMessage=="Unauthorized"){
          Get.offAll(LoginScreen());
          Prefs.setBool(StringConstants.userLogin,false);
        }
      }
    }
  }



}




