class SuccessStoryModel {
  String id;
  String name;
  String maritalStatus;
  int numChildren;
  String date;
  String sex;
  int age;
  String district;
  String subCounty;
  String parish;
  String village;
  String groupName;
  String yrOfEncounterAndHow;
  String lifeBeforeEncounter;
  String capacityBuilding;
  String changesInLifeComparedToBefore;
  String otherInfluencesThatChangedLife;
  String futurePlan;
  String otherComments;
  String created;
  String modified;

  SuccessStoryModel(
    this.created,
    this.modified,
    this.id,
    this.age,
    this.capacityBuilding,
    this.changesInLifeComparedToBefore,
    this.date,
    this.district,
    this.futurePlan,
    this.groupName,
    this.lifeBeforeEncounter,
    this.maritalStatus,
    this.name,
    this.numChildren,
    this.otherComments,
    this.otherInfluencesThatChangedLife,
    this.parish,
    this.sex,
    this.subCounty,
    this.village,
    this.yrOfEncounterAndHow,
  );
  void fromMap(String idd, Map map) {
    id = idd;
    name = map["name"];
    maritalStatus = map["maritalStatus"];
    numChildren = map["numChildren"];
    date = map["date"];
    sex = map["sex"];
    age = map["age"];
    district = map["district"];
    subCounty = map["subCounty"];
    parish = map["parish"];
    village = map["village"];
    groupName = map["groupName"];
    yrOfEncounterAndHow = map["yrOfEncounterAndHow"];
    lifeBeforeEncounter = map["lifeBeforeEncounter"];
    capacityBuilding = map["capacityBuilding"];
    changesInLifeComparedToBefore = map["changesInLifeComparedToBefore"];
    otherInfluencesThatChangedLife = map["otherInfluencesThatChangedLife"];
    futurePlan = map["futurePlan"];
    otherComments = map["otherComments"];
    created = map["created"];
    modified = map["modified"];
  }
}
