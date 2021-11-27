class StaffGrpTrackToolModel {
  String id;
  String project;
  String areaOfOp;
  String staffName;
  String title;
  String date;
  String monthUnderReview;
  String year;
  String grpName;
  String lessonsLearnt;
  String challengesFaced;
  String possibleSolution;
  String created;
  String modified;

  StaffGrpTrackToolModel(
    this.areaOfOp,
    this.challengesFaced,
    this.created,
    this.date,
    this.grpName,
    this.id,
    this.lessonsLearnt,
    this.modified,
    this.monthUnderReview,
    this.possibleSolution,
    this.project,
    this.staffName,
    this.title,
    this.year,
  );

  void fromMap(String idd, Map map) {
    id = idd;
    project = map["project"];
    areaOfOp = map["areaOfOp"];
    staffName = map["staffName"];
    title = map["title"];
    date = map["date"];
    monthUnderReview = map["monthUnderReview"];
    year = map["year"];
    grpName = map["grpName"];
    lessonsLearnt = map["lessonsLearnt"];
    challengesFaced = map["challengesFaced"];
    possibleSolution = map["possibleSolution"];
    created = map["created"];
    modified = map["modified"];
  }
}
