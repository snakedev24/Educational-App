class GetServicesModel {
  List<SPRels>? sPRels;
  List<IEPs>? iEPs;

  GetServicesModel({this.sPRels, this.iEPs});

  GetServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['SPRels'] != null) {
      sPRels = <SPRels>[];
      json['SPRels'].forEach((v) {
        sPRels!.add(new SPRels.fromJson(v));
      });
    }
    if (json['IEPs'] != null) {
      iEPs = <IEPs>[];
      json['IEPs'].forEach((v) {
        iEPs!.add(new IEPs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sPRels != null) {
      data['SPRels'] = this.sPRels!.map((v) => v.toJson()).toList();
    }
    if (this.iEPs != null) {
      data['IEPs'] = this.iEPs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SPRels {
  dynamic iD;
  dynamic iTSID;
  dynamic provID;
  dynamic studentID;
  dynamic oSIS;
  dynamic iEPMandateID;
  dynamic relStart;
  dynamic relEnd;
  dynamic minutes;
  dynamic rate;
  dynamic groupRate;
  dynamic groupRate3;
  dynamic mandate;
  dynamic totalMandate;
  dynamic session;
  dynamic indMandate;
  dynamic schoolName;
  dynamic schoolAddress;
  dynamic schoolCode;
  dynamic district;
  dynamic serviceType;
  dynamic group;
  dynamic groupSize;
  dynamic actualSize;
  bool? scheduled;
  dynamic refFa;
  dynamic diag;
  dynamic transmittal;
  dynamic groupInd;
  dynamic schoolAge;
  dynamic iEPHistory;
  dynamic sESISMissing;
  dynamic signExemption;
  dynamic goalsLock;
  dynamic assignedSup;
  dynamic iEPLocation;
  dynamic hasOT;
  dynamic hasPT;
  dynamic hasSP;
  dynamic hasCO;
  dynamic schoolPhone;
  dynamic nonschool;
  dynamic accepted;
  dynamic cAFFSStartLogged;
  dynamic cAFFSEndLogged;
  dynamic schoolID;
  dynamic remoteAuth;
  dynamic inPersonAuth;
  dynamic inPersonAuthPost;
  dynamic isSub;
  dynamic extendedHrs;
  dynamic qAnnExempt;
  dynamic valBypass;
  dynamic calendar;
  dynamic lastAttended;
  dynamic related;
  dynamic subdiv;
  bool? missingReffa;
  bool? hasSchedDone;
  dynamic ieprepIEPID;
  dynamic timeSched;
  dynamic timeRec;
  dynamic numScheds;
  dynamic numRec;
  List<ServicesGoals>? goals;
  IEPs? iEPs;

  SPRels(
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
        this.ieprepIEPID,
        this.timeSched,
        this.timeRec,
        this.numScheds,
        this.numRec,
        this.goals,
        this.iEPs});

  SPRels.fromJson(Map<String, dynamic> json) {
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
    ieprepIEPID = json['ieprep_IEPID'];
    timeSched = json['time_sched'];
    timeRec = json['time_rec'];
    numScheds = json['num_scheds'];
    numRec = json['num_rec'];
    if (json['goals'] != null) {
      goals = <ServicesGoals>[];
      json['goals'].forEach((v) {
        goals!.add(new ServicesGoals.fromJson(v));
      });
    }
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
    data['ieprep_IEPID'] = this.ieprepIEPID;
    data['time_sched'] = this.timeSched;
    data['time_rec'] = this.timeRec;
    data['num_scheds'] = this.numScheds;
    data['num_rec'] = this.numRec;
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v.toJson()).toList();
    }
    if (this.iEPs != null) {
      data['IEPs'] = this.iEPs!.toJson();
    }
    return data;
  }
}

class ServicesGoals {
  dynamic iD;
  dynamic spRelID;
  dynamic pID;
  dynamic gsID;
  dynamic goal;
  dynamic iEPStarted;
  dynamic iEPEnded;

  ServicesGoals(
      {this.iD,
        this.spRelID,
        this.pID,
        this.gsID,
        this.goal,
        this.iEPStarted,
        this.iEPEnded});

  ServicesGoals.fromJson(Map<String, dynamic> json){
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
  dynamic iD;
  dynamic issued;
  dynamic serviceStart;
  dynamic docLink;
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

class IEPss {
  dynamic iD;
  dynamic oSIS;
  dynamic studentID;
  dynamic issued;
  dynamic location;
  dynamic serviceStart;
  dynamic yearSum;
  dynamic groupSize;
  dynamic thirdParty;
  dynamic docLink;

  IEPss(
      {this.iD,
        this.oSIS,
        this.studentID,
        this.issued,
        this.location,
        this.serviceStart,
        this.yearSum,
        this.groupSize,
        this.thirdParty,
        this.docLink});

  IEPss.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    oSIS = json['OSIS'];
    studentID = json['student_ID'];
    issued = json['issued'];
    location = json['location'];
    serviceStart = json['service_start'];
    yearSum = json['year_sum'];
    groupSize = json['group_size'];
    thirdParty = json['third_party'];
    docLink = json['doc_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['OSIS'] = this.oSIS;
    data['student_ID'] = this.studentID;
    data['issued'] = this.issued;
    data['location'] = this.location;
    data['service_start'] = this.serviceStart;
    data['year_sum'] = this.yearSum;
    data['group_size'] = this.groupSize;
    data['third_party'] = this.thirdParty;
    data['doc_link'] = this.docLink;
    return data;
  }
}