class ActivityModel {
  ActivityFreLeModel? activity;
  OutcomeFrequency? outcomeFrequency;
  OutcomeLevel? outcomeLevel;

  ActivityModel({this.activity, this.outcomeFrequency, this.outcomeLevel});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'] != null
        ? new ActivityFreLeModel.fromJson(json['activity'])
        : null;
    outcomeFrequency = json['outcome_frequency'] != null
        ? new OutcomeFrequency.fromJson(json['outcome_frequency'])
        : null;
    outcomeLevel = json['outcome_level'] != null
        ? new OutcomeLevel.fromJson(json['outcome_level'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    if (this.outcomeFrequency != null) {
      data['outcome_frequency'] = this.outcomeFrequency!.toJson();
    }
    if (this.outcomeLevel != null) {
      data['outcome_level'] = this.outcomeLevel!.toJson();
    }
    return data;
  }
}

class ActivityFreLeModel {
  List<String>? dramaticPlay;
  List<String>? constructionPlay;
  List<String>? fineMotor;
  List<String>? library;
  List<String>? sensory;
  List<String>? art;
  List<String>? circleTime;
  List<String>? smallGroup;
  List<String>? grossMotor;
  List<String>? transitions;

  ActivityFreLeModel(
      {this.dramaticPlay,
        this.constructionPlay,
        this.fineMotor,
        this.library,
        this.sensory,
        this.art,
        this.circleTime,
        this.smallGroup,
        this.grossMotor,
        this.transitions});

  ActivityFreLeModel.fromJson(Map<String, dynamic> json) {
    dramaticPlay = json['Dramatic Play'].cast<String>();
    constructionPlay = json['Construction Play'].cast<String>();
    fineMotor = json['Fine Motor'].cast<String>();
    library = json['Library'].cast<String>();
    sensory = json['Sensory'].cast<String>();
    art = json['Art'].cast<String>();
    circleTime = json['Circle Time'].cast<String>();
    smallGroup = json['Small Group'].cast<String>();
    grossMotor = json['Gross Motor'].cast<String>();
    transitions = json['Transitions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Dramatic Play'] = this.dramaticPlay;
    data['Construction Play'] = this.constructionPlay;
    data['Fine Motor'] = this.fineMotor;
    data['Library'] = this.library;
    data['Sensory'] = this.sensory;
    data['Art'] = this.art;
    data['Circle Time'] = this.circleTime;
    data['Small Group'] = this.smallGroup;
    data['Gross Motor'] = this.grossMotor;
    data['Transitions'] = this.transitions;
    return data;
  }
}

class OutcomeFrequency {
  String? minimal;
  String? moderate;
  String? maximum;
  String? independently;

  OutcomeFrequency(
      {this.minimal, this.moderate, this.maximum, this.independently});

  OutcomeFrequency.fromJson(Map<String, dynamic> json) {
    minimal = json['minimal'];
    moderate = json['moderate'];
    maximum = json['maximum'];
    independently = json['independently'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimal'] = this.minimal;
    data['moderate'] = this.moderate;
    data['maximum'] = this.maximum;
    data['independently'] = this.independently;
    return data;
  }
}

class OutcomeLevel {
  String? cuing;
  String? prompting;
  String? repetitionReview;
  String? positiveReinforcementTangibleReward;
  String? positiveReinforcementHighFive;
  String? positiveReinforcementPraise;
  String? positiveReinforcementThumbsUp;
  String? positiveReinforcementCheering;
  String? positiveReinforcementExtraPrivileges;
  String? modelingIdealBehavior;
  String? visualSchedule;
  String? establishingGuidelines;
  String? redirection;
  String? proximityControl;
  String? encouragement;

  OutcomeLevel(
      {this.cuing,
        this.prompting,
        this.repetitionReview,
        this.positiveReinforcementTangibleReward,
        this.positiveReinforcementHighFive,
        this.positiveReinforcementPraise,
        this.positiveReinforcementThumbsUp,
        this.positiveReinforcementCheering,
        this.positiveReinforcementExtraPrivileges,
        this.modelingIdealBehavior,
        this.visualSchedule,
        this.establishingGuidelines,
        this.redirection,
        this.proximityControl,
        this.encouragement});

  OutcomeLevel.fromJson(Map<String, dynamic> json) {
    cuing = json['cuing'];
    prompting = json['prompting'];
    repetitionReview = json['repetition/review'];
    positiveReinforcementTangibleReward =
    json['positive reinforcement-tangible reward'];
    positiveReinforcementHighFive = json['positive reinforcement-high five'];
    positiveReinforcementPraise = json['positive reinforcement-praise'];
    positiveReinforcementThumbsUp = json['positive reinforcement-thumbs up'];
    positiveReinforcementCheering = json['positive reinforcement-cheering'];
    positiveReinforcementExtraPrivileges =
    json['positive reinforcement-extra privileges'];
    modelingIdealBehavior = json['modeling ideal behavior'];
    visualSchedule = json['visual schedule'];
    establishingGuidelines = json['establishing guidelines'];
    redirection = json['redirection'];
    proximityControl = json['proximity control'];
    encouragement = json['encouragement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cuing'] = this.cuing;
    data['prompting'] = this.prompting;
    data['repetition/review'] = this.repetitionReview;
    data['positive reinforcement-tangible reward'] =
        this.positiveReinforcementTangibleReward;
    data['positive reinforcement-high five'] =
        this.positiveReinforcementHighFive;
    data['positive reinforcement-praise'] = this.positiveReinforcementPraise;
    data['positive reinforcement-thumbs up'] =
        this.positiveReinforcementThumbsUp;
    data['positive reinforcement-cheering'] =
        this.positiveReinforcementCheering;
    data['positive reinforcement-extra privileges'] =
        this.positiveReinforcementExtraPrivileges;
    data['modeling ideal behavior'] = this.modelingIdealBehavior;
    data['visual schedule'] = this.visualSchedule;
    data['establishing guidelines'] = this.establishingGuidelines;
    data['redirection'] = this.redirection;
    data['proximity control'] = this.proximityControl;
    data['encouragement'] = this.encouragement;
    return data;
  }
}