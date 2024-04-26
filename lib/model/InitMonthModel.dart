//InitMonthNotes
//InitMonthModel
class InitMonthModel {
  List<InitMonthNotes>? notes;
  dynamic contacts;
  List<Schedules>? schedules;
  List<OtherServices>? otherServices;
  List<String>? schedDone;

  InitMonthModel(
      {this.notes,
        this.contacts,
        this.schedules,
        this.otherServices,
        this.schedDone});

  InitMonthModel.fromJson(Map<String, dynamic> json) {
    if (json['notes'] != null) {
      notes = <InitMonthNotes>[];
      json['notes'].forEach((v) {
        notes!.add(new InitMonthNotes.fromJson(v));
      });
    }
    contacts = json['contacts'];
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(new Schedules.fromJson(v));
      });
    }
    if (json['other_services'] != null) {
      otherServices = <OtherServices>[];
      json['other_services'].forEach((v) {
        otherServices!.add(new OtherServices.fromJson(v));
      });
    }
    schedDone = json['sched_done'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notes != null) {
      data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    }
    data['contacts'] = this.contacts;
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    if (this.otherServices != null) {
      data['other_services'] =
          this.otherServices!.map((v) => v.toJson()).toList();
    }
    data['sched_done'] = this.schedDone;
    return data;
  }
}

class InitMonthNotes {
  String? iD;
  String? parentID;
  String? spRelID;
  String? provID;
  String? studentID;
  String? start;
  String? end;
  String? cpt;
  String? locTag;
  String? location;
  String? note;
  String? signed;
  String? progress;
  String? status;
  String? groupSize;
  String? sESISID;
  String? sESISCreate;
  String? sESISSync;
  String? sESISCert;
  String? supFlag;
  String? muDate;
  String? recovered;
  String? missedID;
  String? makeup30d;
  String? absentReason;
  String? provSigned;
  String? guardianSigned;
  List<InitMonthGao>? gao;
  String? color;

  InitMonthNotes(
      {this.iD,
        this.parentID,
        this.spRelID,
        this.provID,
        this.studentID,
        this.start,
        this.end,
        this.cpt,
        this.locTag,
        this.location,
        this.note,
        this.signed,
        this.progress,
        this.status,
        this.groupSize,
        this.sESISID,
        this.sESISCreate,
        this.sESISSync,
        this.sESISCert,
        this.supFlag,
        this.muDate,
        this.recovered,
        this.missedID,
        this.makeup30d,
        this.absentReason,
        this.provSigned,
        this.guardianSigned,
        this.gao,
        this.color});

  InitMonthNotes.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentID = json['parent_ID'];
    spRelID = json['sp_rel_ID'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    start = json['start'];
    end = json['end'];
    cpt = json['cpt'];
    locTag = json['loc_tag'];
    location = json['location'];
    note = json['note'];
    signed = json['signed'];
    progress = json['progress'];
    status = json['status'];
    groupSize = json['group_size'];
    sESISID = json['SESIS_ID'];
    sESISCreate = json['SESIS_create'];
    sESISSync = json['SESIS_sync'];
    sESISCert = json['SESIS_cert'];
    supFlag = json['sup_flag'];
    muDate = json['mu_date'];
    recovered = json['recovered'];
    missedID = json['missed_ID'];
    makeup30d = json['makeup_30d'];
    absentReason = json['absent_reason'];
    provSigned = json['prov_signed'];
    guardianSigned = json['guardian_signed'];
    if (json['gao'] != null) {
      gao = <InitMonthGao>[];
      json['gao'].forEach((v) {
        gao!.add(new InitMonthGao.fromJson(v));
      });
    }
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['parent_ID'] = this.parentID;
    data['sp_rel_ID'] = this.spRelID;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['start'] = this.start;
    data['end'] = this.end;
    data['cpt'] = this.cpt;
    data['loc_tag'] = this.locTag;
    data['location'] = this.location;
    data['note'] = this.note;
    data['signed'] = this.signed;
    data['progress'] = this.progress;
    data['status'] = this.status;
    data['group_size'] = this.groupSize;
    data['SESIS_ID'] = this.sESISID;
    data['SESIS_create'] = this.sESISCreate;
    data['SESIS_sync'] = this.sESISSync;
    data['SESIS_cert'] = this.sESISCert;
    data['sup_flag'] = this.supFlag;
    data['mu_date'] = this.muDate;
    data['recovered'] = this.recovered;
    data['missed_ID'] = this.missedID;
    data['makeup_30d'] = this.makeup30d;
    data['absent_reason'] = this.absentReason;
    data['prov_signed'] = this.provSigned;
    data['guardian_signed'] = this.guardianSigned;
    if (this.gao != null) {
      data['gao'] = this.gao!.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    return data;
  }
}

class InitMonthGao {
  String? iD;
  String? sessionID;
  String? goalID;
  String? activity;
  String? outcome;
  String? archived;
  String? provID;
  String? studentID;
  String? spRelID;
  String? type;
  String? typeID;
  String? pID;
  String? goal;
  String? reportID;
  String? iEPID;
  String? iEPStarted;
  String? endedIEPID;
  String? iEPEnded;
  String? crit;
  String? method;
  String? schedule;
  String? age;
  String? requested;
  String? started;
  String? completed;
  String? related;
  String? sLabelSHOULDDROP;
  String? gaoID;

  InitMonthGao(
      {this.iD,
        this.sessionID,
        this.goalID,
        this.activity,
        this.outcome,
        this.archived,
        this.provID,
        this.studentID,
        this.spRelID,
        this.type,
        this.typeID,
        this.pID,
        this.goal,
        this.reportID,
        this.iEPID,
        this.iEPStarted,
        this.endedIEPID,
        this.iEPEnded,
        this.crit,
        this.method,
        this.schedule,
        this.age,
        this.requested,
        this.started,
        this.completed,
        this.related,
        this.sLabelSHOULDDROP,
        this.gaoID});

  InitMonthGao.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    sessionID = json['session_ID'];
    goalID = json['goal_ID'];
    activity = json['activity'];
    outcome = json['outcome'];
    archived = json['archived'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    spRelID = json['sp_rel_ID'];
    type = json['type'];
    typeID = json['type_ID'];
    pID = json['p_ID'];
    goal = json['goal'];
    reportID = json['report_ID'];
    iEPID = json['IEP_ID'];
    iEPStarted = json['IEP_started'];
    endedIEPID = json['ended_IEP_ID'];
    iEPEnded = json['IEP_ended'];
    crit = json['crit'];
    method = json['method'];
    schedule = json['schedule'];
    age = json['age'];
    requested = json['requested'];
    started = json['started'];
    completed = json['completed'];
    related = json['related'];
    sLabelSHOULDDROP = json['_label_SHOULD_DROP'];
    gaoID = json['gao_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['session_ID'] = this.sessionID;
    data['goal_ID'] = this.goalID;
    data['activity'] = this.activity;
    data['outcome'] = this.outcome;
    data['archived'] = this.archived;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['sp_rel_ID'] = this.spRelID;
    data['type'] = this.type;
    data['type_ID'] = this.typeID;
    data['p_ID'] = this.pID;
    data['goal'] = this.goal;
    data['report_ID'] = this.reportID;
    data['IEP_ID'] = this.iEPID;
    data['IEP_started'] = this.iEPStarted;
    data['ended_IEP_ID'] = this.endedIEPID;
    data['IEP_ended'] = this.iEPEnded;
    data['crit'] = this.crit;
    data['method'] = this.method;
    data['schedule'] = this.schedule;
    data['age'] = this.age;
    data['requested'] = this.requested;
    data['started'] = this.started;
    data['completed'] = this.completed;
    data['related'] = this.related;
    data['_label_SHOULD_DROP'] = this.sLabelSHOULDDROP;
    data['gao_ID'] = this.gaoID;
    return data;
  }
}

class Schedules {
  String? iD;
  String? parentID;
  String? spRelID;
  String? provID;
  String? studentID;
  String? start;
  String? end;
  String? cpt;
  String? locTag;
  String? location;
  String? note;
  String? signed;
  String? progress;
  String? status;
  String? groupSize;
  String? sESISID;
  String? sESISCreate;
  String? sESISSync;
  String? sESISCert;
  String? supFlag;
  String? muDate;
  String? recovered;
  String? missedID;
  String? makeup30d;
  String? absentReason;
  String? provSigned;
  String? guardianSigned;

  Schedules(
      {this.iD,
        this.parentID,
        this.spRelID,
        this.provID,
        this.studentID,
        this.start,
        this.end,
        this.cpt,
        this.locTag,
        this.location,
        this.note,
        this.signed,
        this.progress,
        this.status,
        this.groupSize,
        this.sESISID,
        this.sESISCreate,
        this.sESISSync,
        this.sESISCert,
        this.supFlag,
        this.muDate,
        this.recovered,
        this.missedID,
        this.makeup30d,
        this.absentReason,
        this.provSigned,
        this.guardianSigned});

  Schedules.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentID = json['parent_ID'];
    spRelID = json['sp_rel_ID'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    start = json['start'];
    end = json['end'];
    cpt = json['cpt'];
    locTag = json['loc_tag'];
    location = json['location'];
    note = json['note'];
    signed = json['signed'];
    progress = json['progress'];
    status = json['status'];
    groupSize = json['group_size'];
    sESISID = json['SESIS_ID'];
    sESISCreate = json['SESIS_create'];
    sESISSync = json['SESIS_sync'];
    sESISCert = json['SESIS_cert'];
    supFlag = json['sup_flag'];
    muDate = json['mu_date'];
    recovered = json['recovered'];
    missedID = json['missed_ID'];
    makeup30d = json['makeup_30d'];
    absentReason = json['absent_reason'];
    provSigned = json['prov_signed'];
    guardianSigned = json['guardian_signed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['parent_ID'] = this.parentID;
    data['sp_rel_ID'] = this.spRelID;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['start'] = this.start;
    data['end'] = this.end;
    data['cpt'] = this.cpt;
    data['loc_tag'] = this.locTag;
    data['location'] = this.location;
    data['note'] = this.note;
    data['signed'] = this.signed;
    data['progress'] = this.progress;
    data['status'] = this.status;
    data['group_size'] = this.groupSize;
    data['SESIS_ID'] = this.sESISID;
    data['SESIS_create'] = this.sESISCreate;
    data['SESIS_sync'] = this.sESISSync;
    data['SESIS_cert'] = this.sESISCert;
    data['sup_flag'] = this.supFlag;
    data['mu_date'] = this.muDate;
    data['recovered'] = this.recovered;
    data['missed_ID'] = this.missedID;
    data['makeup_30d'] = this.makeup30d;
    data['absent_reason'] = this.absentReason;
    data['prov_signed'] = this.provSigned;
    data['guardian_signed'] = this.guardianSigned;
    return data;
  }
}

class OtherServices {
  String? iD;
  String? provID;
  String? studentID;
  String? sprID;
  String? date;
  String? duration;
  String? otherService;
  String? detail;
  String? contactEmail;
  String? color;
  String? contactTitle;
  String? contactName;
  String? communication;
  dynamic contactAgency;

  OtherServices(
      {this.iD,
        this.provID,
        this.studentID,
        this.sprID,
        this.date,
        this.duration,
        this.otherService,
        this.detail,
        this.contactEmail,
        this.color,
        this.contactTitle,
        this.contactName,
        this.communication,
        this.contactAgency});

  OtherServices.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    sprID = json['spr_ID'];
    date = json['date'];
    duration = json['duration'];
    otherService = json['other_service'];
    detail = json['detail'];
    contactEmail = json['contact_email'];
    color = json['color'];
    contactTitle = json['contact_title'];
    contactName = json['contact_name'];
    communication = json['communication'];
    contactAgency = json['contact_agency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['spr_ID'] = this.sprID;
    data['date'] = this.date;
    data['duration'] = this.duration;
    data['other_service'] = this.otherService;
    data['detail'] = this.detail;
    data['contact_email'] = this.contactEmail;
    data['color'] = this.color;
    data['contact_title'] = this.contactTitle;
    data['contact_name'] = this.contactName;
    data['communication'] = this.communication;
    data['contact_agency'] = this.contactAgency;
    return data;
  }
}