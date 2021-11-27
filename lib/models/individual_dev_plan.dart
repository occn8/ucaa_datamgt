class IndDevPlanModel {
  String id;
  String dataMakingPlan;
  String name;
  String grpName;
  String district;
  String subCounty;
  String parish;
  String village;
  String needs;
  String actionsTaken;
  String staff;
  String date;
  String created;
  String modified;

  IndDevPlanModel(
    this.actionsTaken,
    this.created,
    this.date,
    this.dataMakingPlan,
    this.district,
    this.grpName,
    this.id,
    this.modified,
    this.name,
    this.needs,
    this.parish,
    this.staff,
    this.subCounty,
    this.village,
  );

  void fromMap(String idd, Map map) {
    id = idd;
    dataMakingPlan = map["dataMakingPlan"];
    name = map["name"];
    grpName = map["grpName"];
    district = map["district"];
    subCounty = map["subCounty"];
    parish = map["parish"];
    village = map["village"];
    needs = map["needs"];
    actionsTaken = map["actionsTaken"];
    staff = map["staff"];
    date = map["date"];
    created = map["created"];
    modified = map["modified"];
  }
}
