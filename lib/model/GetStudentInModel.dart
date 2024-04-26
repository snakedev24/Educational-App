class GetStudentInModel {
  dynamic iD;
  dynamic iTSID;
  dynamic ssnBak;
  dynamic ssn;
  dynamic ssnProof;
  dynamic email;
  dynamic pass;
  dynamic emailPass;
  dynamic role;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic primaryAddress;
  dynamic phone;
  dynamic phoneExt;
  dynamic mobile;
  dynamic fax;
  dynamic archived;
  dynamic active;
  dynamic registered;
  dynamic canAccessLegacy;
  dynamic payrollID;
  dynamic employed;
  dynamic userID;
  dynamic oSIS;
  dynamic caseNumber;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic zIP;
  dynamic district;
  dynamic gender;
  dynamic dOB;
  dynamic mother;
  dynamic motherPhone;
  dynamic motherEmail;
  dynamic father;
  dynamic fatherPhone;
  dynamic fatherEmail;
  dynamic school;
  dynamic caseNum;
  dynamic language;
  dynamic yearSum;
  dynamic iEPHistory;
  dynamic schoolAge;
  dynamic homePhone;
  dynamic c1Relation;
  dynamic c1Name;
  dynamic c1Phone;
  dynamic c2Relation;
  dynamic c2Name;
  dynamic c2Phone;
  dynamic c3Relation;
  dynamic c3Name;
  dynamic c3Phone;
  dynamic docName;
  dynamic docAddress;
  dynamic docCity;
  dynamic docState;
  dynamic docZIP;
  dynamic docPhone;
  dynamic healthAlert;
  dynamic notes;
  dynamic t2P;
  dynamic medical;
  dynamic consent;
  dynamic evaluation;
  dynamic cPSEAdmin;
  dynamic latestSPR;
  dynamic latestIEP;
  dynamic oSISChanged;
  dynamic schoolID;
  dynamic lawyer;
  dynamic lawyerPhone;
  dynamic lawyerEmail;
  dynamic nag;

  GetStudentInModel(
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
        this.lawyerEmail,
        this.nag});

  GetStudentInModel.fromJson(Map<String, dynamic> json) {
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
    nag = json['nag'];
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
    data['nag'] = this.nag;
    return data;
  }
}