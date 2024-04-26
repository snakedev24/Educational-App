class MissedModel {
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

  MissedModel(
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

  MissedModel.fromJson(Map<String, dynamic> json) {
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