class GaoSessionModel {
  List<Gao>? gao;

  GaoSessionModel({this.gao});

  GaoSessionModel.fromJson(Map<String, dynamic> json) {
    if (json['gao'] != null) {
      gao = <Gao>[];
      json['gao'].forEach((v) {
        gao!.add(new Gao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gao != null) {
      data['gao'] = this.gao!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gao {
  String? gaoID;
  String? goalID;
  String? activity;
  String? outcome;
  String? archive;

  Gao({this.gaoID, this.goalID, this.activity, this.outcome, this.archive});

  Gao.fromJson(Map<String, dynamic> json) {
    gaoID = json['gao_ID'];
    goalID = json['goal_ID'];
    activity = json['activity'];
    outcome = json['outcome'];
    archive = json['archive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gao_ID'] = this.gaoID;
    data['goal_ID'] = this.goalID;
    data['activity'] = this.activity;
    data['outcome'] = this.outcome;
    data['archive'] = this.archive;
    return data;
  }
}