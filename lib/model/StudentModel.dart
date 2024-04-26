class StudentMode {
  Success? success;

  StudentMode({this.success});

  StudentMode.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    return data;
  }
}

class Success {
  List<Periods>? periods;
  String? periodID;
  SpRels? spRels;
  List<Students>? students;

  Success({this.periods, this.periodID, this.spRels, this.students});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(new Periods.fromJson(v));
      });
    }
    periodID = json['period_ID'];
    spRels =
    json['sp_rels'] != null ? new SpRels.fromJson(json['sp_rels']) : null;
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }
    data['period_ID'] = this.periodID;
    if (this.spRels != null) {
      data['sp_rels'] = this.spRels!.toJson();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
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

class SpRels {
  ByStu? byStu;
  Raw? raw;

  SpRels({this.byStu, this.raw});

  SpRels.fromJson(Map<String, dynamic> json) {
    byStu = json['by_stu'] != null ? new ByStu.fromJson(json['by_stu']) : null;
    raw = json['raw'] != null ? new Raw.fromJson(json['raw']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.byStu != null) {
      data['by_stu'] = this.byStu!.toJson();
    }
    if (this.raw != null) {
      data['raw'] = this.raw!.toJson();
    }
    return data;
  }
}

class ByStu {
  String? iD;
  String? iTSID;
  String? provID;
  String? studentID;
  String? oSIS;
  String? iEPMandateID;
  String? relStart;
  String? relEnd;
  String? minutes;
  String? rate;
  String? groupRate;
  String? groupRate3;
  String? mandate;
  String? totalMandate;
  String? session;
  String? indMandate;
  String? schoolName;
  String? schoolAddress;
  String? schoolCode;
  String? district;
  String? serviceType;
  String? group;
  String? groupSize;
  String? actualSize;
  bool? scheduled;
  String? refFa;
  String? diag;
  String? transmittal;
  String? groupInd;
  String? schoolAge;
  String? iEPHistory;
  String? sESISMissing;
  String? signExemption;
  String? goalsLock;
  String? assignedSup;
  String? iEPLocation;
  String? hasOT;
  String? hasPT;
  String? hasSP;
  String? hasCO;
  String? schoolPhone;
  String? nonschool;
  String? accepted;
  String? cAFFSStartLogged;
  String? cAFFSEndLogged;
  String? schoolID;
  String? remoteAuth;
  String? inPersonAuth;
  String? inPersonAuthPost;
  String? isSub;
  String? extendedHrs;
  String? qAnnExempt;
  String? valBypass;
  String? calendar;
  String? lastAttended;
  String? related;
  String? subdiv;
  bool? missingReffa;
  bool? hasSchedDone;
  int? timeSched;
  int? timeRec;
  int? numScheds;
  int? numRec;
  List<Goals>? goals;
  List<int>? goalsOrder;

  ByStu(
      {this.iD,
        this.iTSID,
        this.provID,
        this.studentID,
        this.oSIS,
        this.iEPMandateID,
        this.relStart,
        this.relEnd,
        this.minutes,
        this.rate,
        this.groupRate,
        this.groupRate3,
        this.mandate,
        this.totalMandate,
        this.session,
        this.indMandate,
        this.schoolName,
        this.schoolAddress,
        this.schoolCode,
        this.district,
        this.serviceType,
        this.group,
        this.groupSize,
        this.actualSize,
        this.scheduled,
        this.refFa,
        this.diag,
        this.transmittal,
        this.groupInd,
        this.schoolAge,
        this.iEPHistory,
        this.sESISMissing,
        this.signExemption,
        this.goalsLock,
        this.assignedSup,
        this.iEPLocation,
        this.hasOT,
        this.hasPT,
        this.hasSP,
        this.hasCO,
        this.schoolPhone,
        this.nonschool,
        this.accepted,
        this.cAFFSStartLogged,
        this.cAFFSEndLogged,
        this.schoolID,
        this.remoteAuth,
        this.inPersonAuth,
        this.inPersonAuthPost,
        this.isSub,
        this.extendedHrs,
        this.qAnnExempt,
        this.valBypass,
        this.calendar,
        this.lastAttended,
        this.related,
        this.subdiv,
        this.missingReffa,
        this.hasSchedDone,
        this.timeSched,
        this.timeRec,
        this.numScheds,
        this.numRec,
        this.goals,
        this.goalsOrder});

  ByStu.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iTSID = json['ITS_ID'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    oSIS = json['OSIS'];
    iEPMandateID = json['IEP_mandate_ID'];
    relStart = json['rel_start'];
    relEnd = json['rel_end'];
    minutes = json['minutes'];
    rate = json['rate'];
    groupRate = json['group_rate'];
    groupRate3 = json['group_rate_3'];
    mandate = json['mandate'];
    totalMandate = json['total_mandate'];
    session = json['session'];
    indMandate = json['ind_mandate'];
    schoolName = json['school_name'];
    schoolAddress = json['school_address'];
    schoolCode = json['school_code'];
    district = json['district'];
    serviceType = json['service_type'];
    group = json['group'];
    groupSize = json['group_size'];
    actualSize = json['actual_size'];
    scheduled = json['scheduled'];
    refFa = json['ref_fa'];
    diag = json['diag'];
    transmittal = json['transmittal'];
    groupInd = json['group_ind'];
    schoolAge = json['school_age'];
    iEPHistory = json['IEP_history'];
    sESISMissing = json['SESIS_missing'];
    signExemption = json['sign_exemption'];
    goalsLock = json['goals_lock'];
    assignedSup = json['assigned_sup'];
    iEPLocation = json['IEP_location'];
    hasOT = json['has_OT'];
    hasPT = json['has_PT'];
    hasSP = json['has_SP'];
    hasCO = json['has_CO'];
    schoolPhone = json['school_phone'];
    nonschool = json['nonschool'];
    accepted = json['accepted'];
    cAFFSStartLogged = json['CAFFS_start_logged'];
    cAFFSEndLogged = json['CAFFS_end_logged'];
    schoolID = json['school_ID'];
    remoteAuth = json['remote_auth'];
    inPersonAuth = json['in_person_auth'];
    inPersonAuthPost = json['in_person_auth_post'];
    isSub = json['is_sub'];
    extendedHrs = json['extended_hrs'];
    qAnnExempt = json['q_ann_exempt'];
    valBypass = json['val_bypass'];
    calendar = json['calendar'];
    lastAttended = json['last_attended'];
    related = json['related'];
    subdiv = json['subdiv'];
    missingReffa = json['missing_reffa'];
    hasSchedDone = json['has_sched_done'];
    timeSched = json['time_sched'];
    timeRec = json['time_rec'];
    numScheds = json['num_scheds'];
    numRec = json['num_rec'];
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(new Goals.fromJson(v));
      });
    }
    goalsOrder = json['goals_order'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ITS_ID'] = this.iTSID;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['OSIS'] = this.oSIS;
    data['IEP_mandate_ID'] = this.iEPMandateID;
    data['rel_start'] = this.relStart;
    data['rel_end'] = this.relEnd;
    data['minutes'] = this.minutes;
    data['rate'] = this.rate;
    data['group_rate'] = this.groupRate;
    data['group_rate_3'] = this.groupRate3;
    data['mandate'] = this.mandate;
    data['total_mandate'] = this.totalMandate;
    data['session'] = this.session;
    data['ind_mandate'] = this.indMandate;
    data['school_name'] = this.schoolName;
    data['school_address'] = this.schoolAddress;
    data['school_code'] = this.schoolCode;
    data['district'] = this.district;
    data['service_type'] = this.serviceType;
    data['group'] = this.group;
    data['group_size'] = this.groupSize;
    data['actual_size'] = this.actualSize;
    data['scheduled'] = this.scheduled;
    data['ref_fa'] = this.refFa;
    data['diag'] = this.diag;
    data['transmittal'] = this.transmittal;
    data['group_ind'] = this.groupInd;
    data['school_age'] = this.schoolAge;
    data['IEP_history'] = this.iEPHistory;
    data['SESIS_missing'] = this.sESISMissing;
    data['sign_exemption'] = this.signExemption;
    data['goals_lock'] = this.goalsLock;
    data['assigned_sup'] = this.assignedSup;
    data['IEP_location'] = this.iEPLocation;
    data['has_OT'] = this.hasOT;
    data['has_PT'] = this.hasPT;
    data['has_SP'] = this.hasSP;
    data['has_CO'] = this.hasCO;
    data['school_phone'] = this.schoolPhone;
    data['nonschool'] = this.nonschool;
    data['accepted'] = this.accepted;
    data['CAFFS_start_logged'] = this.cAFFSStartLogged;
    data['CAFFS_end_logged'] = this.cAFFSEndLogged;
    data['school_ID'] = this.schoolID;
    data['remote_auth'] = this.remoteAuth;
    data['in_person_auth'] = this.inPersonAuth;
    data['in_person_auth_post'] = this.inPersonAuthPost;
    data['is_sub'] = this.isSub;
    data['extended_hrs'] = this.extendedHrs;
    data['q_ann_exempt'] = this.qAnnExempt;
    data['val_bypass'] = this.valBypass;
    data['calendar'] = this.calendar;
    data['last_attended'] = this.lastAttended;
    data['related'] = this.related;
    data['subdiv'] = this.subdiv;
    data['missing_reffa'] = this.missingReffa;
    data['has_sched_done'] = this.hasSchedDone;
    data['time_sched'] = this.timeSched;
    data['time_rec'] = this.timeRec;
    data['num_scheds'] = this.numScheds;
    data['num_rec'] = this.numRec;
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v.toJson()).toList();
    }
    data['goals_order'] = this.goalsOrder;
    return data;
  }
}

class Goals {
  String? iD;
  String? spRelID;
  String? pID;
  String? gsID;
  String? goal;
  String? iEPStarted;
  String? iEPEnded;

  Goals(
      {this.iD,
        this.spRelID,
        this.pID,
        this.gsID,
        this.goal,
        this.iEPStarted,
        this.iEPEnded});

  Goals.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    spRelID = json['sp_rel_ID'];
    pID = json['p_ID'];
    gsID = json['gs_ID'];
    goal = json['goal'];
    iEPStarted = json['IEP_started'];
    iEPEnded = json['IEP_ended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['sp_rel_ID'] = this.spRelID;
    data['p_ID'] = this.pID;
    data['gs_ID'] = this.gsID;
    data['goal'] = this.goal;
    data['IEP_started'] = this.iEPStarted;
    data['IEP_ended'] = this.iEPEnded;
    return data;
  }
}

class Raw {
  String? iD;
  String? iTSID;
  String? provID;
  String? studentID;
  String? oSIS;
  String? iEPMandateID;
  String? relStart;
  String? relEnd;
  String? minutes;
  String? rate;
  String? groupRate;
  String? groupRate3;
  String? mandate;
  String? totalMandate;
  String? session;
  String? indMandate;
  String? schoolName;
  String? schoolAddress;
  String? schoolCode;
  String? district;
  String? serviceType;
  String? group;
  String? groupSize;
  String? actualSize;
  bool? scheduled;
  String? refFa;
  String? diag;
  String? transmittal;
  String? groupInd;
  String? schoolAge;
  String? iEPHistory;
  String? sESISMissing;
  String? signExemption;
  String? goalsLock;
  String? assignedSup;
  String? iEPLocation;
  String? hasOT;
  String? hasPT;
  String? hasSP;
  String? hasCO;
  String? schoolPhone;
  String? nonschool;
  String? accepted;
  String? cAFFSStartLogged;
  String? cAFFSEndLogged;
  String? schoolID;
  String? remoteAuth;
  String? inPersonAuth;
  String? inPersonAuthPost;
  String? isSub;
  String? extendedHrs;
  String? qAnnExempt;
  String? valBypass;
  String? calendar;
  String? lastAttended;
  String? related;
  String? subdiv;
  bool? missingReffa;
  bool? hasSchedDone;
  int? timeSched;
  int? timeRec;
  int? numScheds;
  int? numRec;
  List<Goals>? goals;
  List<int>? goalsOrder;
  IEPs? iEPs;

  Raw(
      {this.iD,
        this.iTSID,
        this.provID,
        this.studentID,
        this.oSIS,
        this.iEPMandateID,
        this.relStart,
        this.relEnd,
        this.minutes,
        this.rate,
        this.groupRate,
        this.groupRate3,
        this.mandate,
        this.totalMandate,
        this.session,
        this.indMandate,
        this.schoolName,
        this.schoolAddress,
        this.schoolCode,
        this.district,
        this.serviceType,
        this.group,
        this.groupSize,
        this.actualSize,
        this.scheduled,
        this.refFa,
        this.diag,
        this.transmittal,
        this.groupInd,
        this.schoolAge,
        this.iEPHistory,
        this.sESISMissing,
        this.signExemption,
        this.goalsLock,
        this.assignedSup,
        this.iEPLocation,
        this.hasOT,
        this.hasPT,
        this.hasSP,
        this.hasCO,
        this.schoolPhone,
        this.nonschool,
        this.accepted,
        this.cAFFSStartLogged,
        this.cAFFSEndLogged,
        this.schoolID,
        this.remoteAuth,
        this.inPersonAuth,
        this.inPersonAuthPost,
        this.isSub,
        this.extendedHrs,
        this.qAnnExempt,
        this.valBypass,
        this.calendar,
        this.lastAttended,
        this.related,
        this.subdiv,
        this.missingReffa,
        this.hasSchedDone,
        this.timeSched,
        this.timeRec,
        this.numScheds,
        this.numRec,
        this.goals,
        this.goalsOrder,
        this.iEPs});

  Raw.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iTSID = json['ITS_ID'];
    provID = json['prov_ID'];
    studentID = json['student_ID'];
    oSIS = json['OSIS'];
    iEPMandateID = json['IEP_mandate_ID'];
    relStart = json['rel_start'];
    relEnd = json['rel_end'];
    minutes = json['minutes'];
    rate = json['rate'];
    groupRate = json['group_rate'];
    groupRate3 = json['group_rate_3'];
    mandate = json['mandate'];
    totalMandate = json['total_mandate'];
    session = json['session'];
    indMandate = json['ind_mandate'];
    schoolName = json['school_name'];
    schoolAddress = json['school_address'];
    schoolCode = json['school_code'];
    district = json['district'];
    serviceType = json['service_type'];
    group = json['group'];
    groupSize = json['group_size'];
    actualSize = json['actual_size'];
    scheduled = json['scheduled'];
    refFa = json['ref_fa'];
    diag = json['diag'];
    transmittal = json['transmittal'];
    groupInd = json['group_ind'];
    schoolAge = json['school_age'];
    iEPHistory = json['IEP_history'];
    sESISMissing = json['SESIS_missing'];
    signExemption = json['sign_exemption'];
    goalsLock = json['goals_lock'];
    assignedSup = json['assigned_sup'];
    iEPLocation = json['IEP_location'];
    hasOT = json['has_OT'];
    hasPT = json['has_PT'];
    hasSP = json['has_SP'];
    hasCO = json['has_CO'];
    schoolPhone = json['school_phone'];
    nonschool = json['nonschool'];
    accepted = json['accepted'];
    cAFFSStartLogged = json['CAFFS_start_logged'];
    cAFFSEndLogged = json['CAFFS_end_logged'];
    schoolID = json['school_ID'];
    remoteAuth = json['remote_auth'];
    inPersonAuth = json['in_person_auth'];
    inPersonAuthPost = json['in_person_auth_post'];
    isSub = json['is_sub'];
    extendedHrs = json['extended_hrs'];
    qAnnExempt = json['q_ann_exempt'];
    valBypass = json['val_bypass'];
    calendar = json['calendar'];
    lastAttended = json['last_attended'];
    related = json['related'];
    subdiv = json['subdiv'];
    missingReffa = json['missing_reffa'];
    hasSchedDone = json['has_sched_done'];
    timeSched = json['time_sched'];
    timeRec = json['time_rec'];
    numScheds = json['num_scheds'];
    numRec = json['num_rec'];
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(new Goals.fromJson(v));
      });
    }
    goalsOrder = json['goals_order'].cast<int>();
    iEPs = json['IEPs'] != null ? new IEPs.fromJson(json['IEPs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ITS_ID'] = this.iTSID;
    data['prov_ID'] = this.provID;
    data['student_ID'] = this.studentID;
    data['OSIS'] = this.oSIS;
    data['IEP_mandate_ID'] = this.iEPMandateID;
    data['rel_start'] = this.relStart;
    data['rel_end'] = this.relEnd;
    data['minutes'] = this.minutes;
    data['rate'] = this.rate;
    data['group_rate'] = this.groupRate;
    data['group_rate_3'] = this.groupRate3;
    data['mandate'] = this.mandate;
    data['total_mandate'] = this.totalMandate;
    data['session'] = this.session;
    data['ind_mandate'] = this.indMandate;
    data['school_name'] = this.schoolName;
    data['school_address'] = this.schoolAddress;
    data['school_code'] = this.schoolCode;
    data['district'] = this.district;
    data['service_type'] = this.serviceType;
    data['group'] = this.group;
    data['group_size'] = this.groupSize;
    data['actual_size'] = this.actualSize;
    data['scheduled'] = this.scheduled;
    data['ref_fa'] = this.refFa;
    data['diag'] = this.diag;
    data['transmittal'] = this.transmittal;
    data['group_ind'] = this.groupInd;
    data['school_age'] = this.schoolAge;
    data['IEP_history'] = this.iEPHistory;
    data['SESIS_missing'] = this.sESISMissing;
    data['sign_exemption'] = this.signExemption;
    data['goals_lock'] = this.goalsLock;
    data['assigned_sup'] = this.assignedSup;
    data['IEP_location'] = this.iEPLocation;
    data['has_OT'] = this.hasOT;
    data['has_PT'] = this.hasPT;
    data['has_SP'] = this.hasSP;
    data['has_CO'] = this.hasCO;
    data['school_phone'] = this.schoolPhone;
    data['nonschool'] = this.nonschool;
    data['accepted'] = this.accepted;
    data['CAFFS_start_logged'] = this.cAFFSStartLogged;
    data['CAFFS_end_logged'] = this.cAFFSEndLogged;
    data['school_ID'] = this.schoolID;
    data['remote_auth'] = this.remoteAuth;
    data['in_person_auth'] = this.inPersonAuth;
    data['in_person_auth_post'] = this.inPersonAuthPost;
    data['is_sub'] = this.isSub;
    data['extended_hrs'] = this.extendedHrs;
    data['q_ann_exempt'] = this.qAnnExempt;
    data['val_bypass'] = this.valBypass;
    data['calendar'] = this.calendar;
    data['last_attended'] = this.lastAttended;
    data['related'] = this.related;
    data['subdiv'] = this.subdiv;
    data['missing_reffa'] = this.missingReffa;
    data['has_sched_done'] = this.hasSchedDone;
    data['time_sched'] = this.timeSched;
    data['time_rec'] = this.timeRec;
    data['num_scheds'] = this.numScheds;
    data['num_rec'] = this.numRec;
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v.toJson()).toList();
    }
    data['goals_order'] = this.goalsOrder;
    if (this.iEPs != null) {
      data['IEPs'] = this.iEPs!.toJson();
    }
    return data;
  }
}

class IEPs {
  Initial? initial;

  IEPs({this.initial});

  IEPs.fromJson(Map<String, dynamic> json) {
    initial =
    json['initial'] != null ? new Initial.fromJson(json['initial']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.initial != null) {
      data['initial'] = this.initial!.toJson();
    }
    return data;
  }
}

class Initial {
  int? iD;
  String? issued;
  String? serviceStart;
  String? docLink;
  bool? isReported;

  Initial(
      {this.iD, this.issued, this.serviceStart, this.docLink, this.isReported});

  Initial.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    issued = json['issued'];
    serviceStart = json['service_start'];
    docLink = json['doc_link'];
    isReported = json['is_reported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['issued'] = this.issued;
    data['service_start'] = this.serviceStart;
    data['doc_link'] = this.docLink;
    data['is_reported'] = this.isReported;
    return data;
  }
}

class Students {
  String? iD;
  String? iTSID;
  String? ssnBak;
  String? ssn;
  String? ssnProof;
  String? email;
  String? pass;
  String? emailPass;
  String? role;
  String? firstName;
  String? middleName;
  String? lastName;
  String? primaryAddress;
  String? phone;
  String? phoneExt;
  String? mobile;
  String? fax;
  String? archived;
  String? active;
  String? registered;
  String? canAccessLegacy;
  String? payrollID;
  String? employed;
  String? userID;
  String? oSIS;
  String? caseNumber;
  String? address;
  String? city;
  String? state;
  String? zIP;
  String? district;
  String? gender;
  String? dOB;
  String? mother;
  String? motherPhone;
  String? motherEmail;
  String? father;
  String? fatherPhone;
  String? fatherEmail;
  String? school;
  String? caseNum;
  String? language;
  String? yearSum;
  String? iEPHistory;
  String? schoolAge;
  String? homePhone;
  String? c1Relation;
  String? c1Name;
  String? c1Phone;
  String? c2Relation;
  String? c2Name;
  String? c2Phone;
  String? c3Relation;
  String? c3Name;
  String? c3Phone;
  String? docName;
  String? docAddress;
  String? docCity;
  String? docState;
  String? docZIP;
  String? docPhone;
  String? healthAlert;
  String? notes;
  String? t2P;
  String? medical;
  String? consent;
  String? evaluation;
  String? cPSEAdmin;
  String? latestSPR;
  String? latestIEP;
  String? oSISChanged;
  String? schoolID;
  String? lawyer;
  String? lawyerPhone;
  String? lawyerEmail;

  Students(
      {this.iD,
        this.iTSID,
        this.ssnBak,
        this.ssn,
        this.ssnProof,
        this.email,
        this.pass,
        this.emailPass,
        this.role,
        this.firstName,
        this.middleName,
        this.lastName,
        this.primaryAddress,
        this.phone,
        this.phoneExt,
        this.mobile,
        this.fax,
        this.archived,
        this.active,
        this.registered,
        this.canAccessLegacy,
        this.payrollID,
        this.employed,
        this.userID,
        this.oSIS,
        this.caseNumber,
        this.address,
        this.city,
        this.state,
        this.zIP,
        this.district,
        this.gender,
        this.dOB,
        this.mother,
        this.motherPhone,
        this.motherEmail,
        this.father,
        this.fatherPhone,
        this.fatherEmail,
        this.school,
        this.caseNum,
        this.language,
        this.yearSum,
        this.iEPHistory,
        this.schoolAge,
        this.homePhone,
        this.c1Relation,
        this.c1Name,
        this.c1Phone,
        this.c2Relation,
        this.c2Name,
        this.c2Phone,
        this.c3Relation,
        this.c3Name,
        this.c3Phone,
        this.docName,
        this.docAddress,
        this.docCity,
        this.docState,
        this.docZIP,
        this.docPhone,
        this.healthAlert,
        this.notes,
        this.t2P,
        this.medical,
        this.consent,
        this.evaluation,
        this.cPSEAdmin,
        this.latestSPR,
        this.latestIEP,
        this.oSISChanged,
        this.schoolID,
        this.lawyer,
        this.lawyerPhone,
        this.lawyerEmail});

  Students.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iTSID = json['ITS_ID'];
    ssnBak = json['ssn_bak'];
    ssn = json['ssn'];
    ssnProof = json['ssn_proof'];
    email = json['email'];
    pass = json['pass'];
    emailPass = json['email_pass'];
    role = json['role'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    primaryAddress = json['primary_address'];
    phone = json['phone'];
    phoneExt = json['phone_ext'];
    mobile = json['mobile'];
    fax = json['fax'];
    archived = json['archived'];
    active = json['active'];
    registered = json['registered'];
    canAccessLegacy = json['can_access_legacy'];
    payrollID = json['payroll_ID'];
    employed = json['employed'];
    userID = json['user_ID'];
    oSIS = json['OSIS'];
    caseNumber = json['case_number'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zIP = json['ZIP'];
    district = json['district'];
    gender = json['gender'];
    dOB = json['DOB'];
    mother = json['mother'];
    motherPhone = json['mother_phone'];
    motherEmail = json['mother_email'];
    father = json['father'];
    fatherPhone = json['father_phone'];
    fatherEmail = json['father_email'];
    school = json['school'];
    caseNum = json['case_num'];
    language = json['language'];
    yearSum = json['year_sum'];
    iEPHistory = json['IEP_history'];
    schoolAge = json['school_age'];
    homePhone = json['home_phone'];
    c1Relation = json['c1_relation'];
    c1Name = json['c1_name'];
    c1Phone = json['c1_phone'];
    c2Relation = json['c2_relation'];
    c2Name = json['c2_name'];
    c2Phone = json['c2_phone'];
    c3Relation = json['c3_relation'];
    c3Name = json['c3_name'];
    c3Phone = json['c3_phone'];
    docName = json['doc_name'];
    docAddress = json['doc_address'];
    docCity = json['doc_city'];
    docState = json['doc_state'];
    docZIP = json['doc_ZIP'];
    docPhone = json['doc_phone'];
    healthAlert = json['health_alert'];
    notes = json['notes'];
    t2P = json['T2P'];
    medical = json['medical'];
    consent = json['consent'];
    evaluation = json['evaluation'];
    cPSEAdmin = json['CPSE_admin'];
    latestSPR = json['latest_SPR'];
    latestIEP = json['latest_IEP'];
    oSISChanged = json['OSIS_changed'];
    schoolID = json['school_ID'];
    lawyer = json['lawyer'];
    lawyerPhone = json['lawyer_phone'];
    lawyerEmail = json['lawyer_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ITS_ID'] = this.iTSID;
    data['ssn_bak'] = this.ssnBak;
    data['ssn'] = this.ssn;
    data['ssn_proof'] = this.ssnProof;
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['email_pass'] = this.emailPass;
    data['role'] = this.role;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['primary_address'] = this.primaryAddress;
    data['phone'] = this.phone;
    data['phone_ext'] = this.phoneExt;
    data['mobile'] = this.mobile;
    data['fax'] = this.fax;
    data['archived'] = this.archived;
    data['active'] = this.active;
    data['registered'] = this.registered;
    data['can_access_legacy'] = this.canAccessLegacy;
    data['payroll_ID'] = this.payrollID;
    data['employed'] = this.employed;
    data['user_ID'] = this.userID;
    data['OSIS'] = this.oSIS;
    data['case_number'] = this.caseNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['ZIP'] = this.zIP;
    data['district'] = this.district;
    data['gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['mother'] = this.mother;
    data['mother_phone'] = this.motherPhone;
    data['mother_email'] = this.motherEmail;
    data['father'] = this.father;
    data['father_phone'] = this.fatherPhone;
    data['father_email'] = this.fatherEmail;
    data['school'] = this.school;
    data['case_num'] = this.caseNum;
    data['language'] = this.language;
    data['year_sum'] = this.yearSum;
    data['IEP_history'] = this.iEPHistory;
    data['school_age'] = this.schoolAge;
    data['home_phone'] = this.homePhone;
    data['c1_relation'] = this.c1Relation;
    data['c1_name'] = this.c1Name;
    data['c1_phone'] = this.c1Phone;
    data['c2_relation'] = this.c2Relation;
    data['c2_name'] = this.c2Name;
    data['c2_phone'] = this.c2Phone;
    data['c3_relation'] = this.c3Relation;
    data['c3_name'] = this.c3Name;
    data['c3_phone'] = this.c3Phone;
    data['doc_name'] = this.docName;
    data['doc_address'] = this.docAddress;
    data['doc_city'] = this.docCity;
    data['doc_state'] = this.docState;
    data['doc_ZIP'] = this.docZIP;
    data['doc_phone'] = this.docPhone;
    data['health_alert'] = this.healthAlert;
    data['notes'] = this.notes;
    data['T2P'] = this.t2P;
    data['medical'] = this.medical;
    data['consent'] = this.consent;
    data['evaluation'] = this.evaluation;
    data['CPSE_admin'] = this.cPSEAdmin;
    data['latest_SPR'] = this.latestSPR;
    data['latest_IEP'] = this.latestIEP;
    data['OSIS_changed'] = this.oSISChanged;
    data['school_ID'] = this.schoolID;
    data['lawyer'] = this.lawyer;
    data['lawyer_phone'] = this.lawyerPhone;
    data['lawyer_email'] = this.lawyerEmail;
    return data;
  }
}