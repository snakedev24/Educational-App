// class InitModel {
//   List<InitPeriods>? periods;
//   String? periodID;
//
//   InitModel({this.periods, this.periodID});
//
//   InitModel.fromJson(Map<String, dynamic> json) {
//     if (json['periods'] != null) {
//       periods = <InitPeriods>[];
//       json['periods'].forEach((v) {
//         periods!.add(new InitPeriods.fromJson(v));
//       });
//     }
//     periodID = json['period_ID'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.periods != null) {
//       data['periods'] = this.periods!.map((v) => v.toJson()).toList();
//     }
//     data['period_ID'] = this.periodID;
//     return data;
//   }
// }



class InitModel {
  List<InitPeriods>? periods;
  String? periodID;
  List<InitAgenciesModel>? agencies;
  AbsentReasons? absentReasons;
  List<String>? sessionStatuses;
  List<String>? serviceTypes;
  ContactSnips? contactSnips;

  InitModel(
      {this.periods,
        this.periodID,
        this.agencies,
        this.absentReasons,
        this.sessionStatuses,
        this.serviceTypes,
        this.contactSnips});

  InitModel.fromJson(Map<String, dynamic> json) {
    if (json['periods'] != null) {
      periods = <InitPeriods>[];
      json['periods'].forEach((v) {
        periods!.add(new InitPeriods.fromJson(v));
      });
    }
    periodID = json['period_ID'];
    if (json['agencies'] != null) {
      agencies = <InitAgenciesModel>[];
      json['agencies'].forEach((v) {
        agencies!.add(new InitAgenciesModel.fromJson(v));
      });
    }
    absentReasons = json['absent_reasons'] != null
        ? new AbsentReasons.fromJson(json['absent_reasons'])
        : null;
    sessionStatuses = json['session_statuses'].cast<String>();
    serviceTypes = json['service_types'].cast<String>();
    contactSnips = json['contact_snips'] != null
        ? new ContactSnips.fromJson(json['contact_snips'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }
    data['period_ID'] = this.periodID;
    if (this.agencies != null) {
      data['agencies'] = this.agencies!.map((v) => v.toJson()).toList();
    }
    if (this.absentReasons != null) {
      data['absent_reasons'] = this.absentReasons!.toJson();
    }
    data['session_statuses'] = this.sessionStatuses;
    data['service_types'] = this.serviceTypes;
    if (this.contactSnips != null) {
      data['contact_snips'] = this.contactSnips!.toJson();
    }
    return data;
  }
}

class Periods {
  String? iD;
  String? label;
  String? start;
  String? end;
  String? pwStart;
  String? pwEnd;
  String? archived;

  Periods(
      {this.iD,
        this.label,
        this.start,
        this.end,
        this.pwStart,
        this.pwEnd,
        this.archived});

  Periods.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    label = json['label'];
    start = json['start'];
    end = json['end'];
    pwStart = json['pw_start'];
    pwEnd = json['pw_end'];
    archived = json['archived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['label'] = this.label;
    data['start'] = this.start;
    data['end'] = this.end;
    data['pw_start'] = this.pwStart;
    data['pw_end'] = this.pwEnd;
    data['archived'] = this.archived;
    return data;
  }
}

class InitAgenciesModel {
  String? id;
  String? agency;

  InitAgenciesModel({this.id, this.agency});

  InitAgenciesModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    agency = json['agency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['agency'] = this.agency;
    return data;
  }
}

class AbsentReasons {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s10;
  String? s11;

  AbsentReasons(
      {this.s0,
        this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s10,
        this.s11});

  AbsentReasons.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s10 = json['10'];
    s11 = json['11'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['10'] = this.s10;
    data['11'] = this.s11;
    return data;
  }
}

class ContactSnips {
  List<String>? parentGuardian;
  List<String>? classroomTeachers;
  List<String>? oT;
  List<String>? pT;
  List<String>? cO;
  List<String>? sP;
  List<String>? sharedSEIT;
  List<String>? preschoolDirector;
  List<String>? iTSSupervisor;
  List<String>? sEIT;

  ContactSnips(
      {this.parentGuardian,
        this.classroomTeachers,
        this.oT,
        this.pT,
        this.cO,
        this.sP,
        this.sharedSEIT,
        this.preschoolDirector,
        this.iTSSupervisor,
        this.sEIT});

  ContactSnips.fromJson(Map<String, dynamic> json) {
    parentGuardian = json['Parent/Guardian'].cast<String>();
    classroomTeachers = json['Classroom Teachers'].cast<String>();
    oT = json['OT'].cast<String>();
    pT = json['PT'].cast<String>();
    cO = json['CO'].cast<String>();
    sP = json['SP'].cast<String>();
    sharedSEIT = json['Shared SEIT'].cast<String>();
    preschoolDirector = json['Preschool Director'].cast<String>();
    iTSSupervisor = json['ITS Supervisor'].cast<String>();
    sEIT = json['SEIT'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Parent/Guardian'] = this.parentGuardian;
    data['Classroom Teachers'] = this.classroomTeachers;
    data['OT'] = this.oT;
    data['PT'] = this.pT;
    data['CO'] = this.cO;
    data['SP'] = this.sP;
    data['Shared SEIT'] = this.sharedSEIT;
    data['Preschool Director'] = this.preschoolDirector;
    data['ITS Supervisor'] = this.iTSSupervisor;
    data['SEIT'] = this.sEIT;
    return data;
  }
}

class InitPeriods {
  String? iD;
  String? label;
  String? start;
  String? end;
  String? pwStart;
  String? pwEnd;
  String? archived;

  InitPeriods(
      {this.iD,
        this.label,
        this.start,
        this.end,
        this.pwStart,
        this.pwEnd,
        this.archived});

  InitPeriods.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    label = json['label'];
    start = json['start'];
    end = json['end'];
    pwStart = json['pw_start'];
    pwEnd = json['pw_end'];
    archived = json['archived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['label'] = this.label;
    data['start'] = this.start;
    data['end'] = this.end;
    data['pw_start'] = this.pwStart;
    data['pw_end'] = this.pwEnd;
    data['archived'] = this.archived;
    return data;
  }
}