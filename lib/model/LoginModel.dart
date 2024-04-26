class LoginModel {
  String? status;
  String? userID;
  String? msg;

  LoginModel({this.status, this.userID,this.msg});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userID = json['user_ID'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_ID'] = this.userID??"";
    data['msg'] = this.msg??"";
    return data;
  }
}

