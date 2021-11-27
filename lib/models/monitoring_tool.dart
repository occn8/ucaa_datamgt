class MonitorToolModel {
  String id;
  String collectorName;
  String title;
  String date;
  String grpName;
  int numMembers;
  int numMale;
  int numFemale;
  String subCounty;
  String parish;
  String village;
  String reportQuarter;
  String month;
  int totalSavings;
  int loanAmtGivenOut;
  int loanRepaymentAmt;
  int totalSocialFund;
  String remarks;
  int numMemeberWithIGA;
  int numMembersIGAcollapsed;
  int numMembersIGAmaitained;
  int numMembersNewIGA;
  String anyIGAyesORno;
  String ifYesWhichIGA;
  String summaryOFArchievements;
  String challenges;
  String solutions;
  String grpActionPlan;
  String created;
  String modified;

  MonitorToolModel(
    this.anyIGAyesORno,
    this.challenges,
    this.collectorName,
    this.created,
    this.date,
    this.grpActionPlan,
    this.grpName,
    this.id,
    this.ifYesWhichIGA,
    this.loanAmtGivenOut,
    this.loanRepaymentAmt,
    this.modified,
    this.month,
    this.numFemale,
    this.numMale,
    this.numMembers,
    this.numMembersIGAcollapsed,
    this.numMembersIGAmaitained,
    this.numMembersNewIGA,
    this.numMemeberWithIGA,
    this.parish,
    this.remarks,
    this.reportQuarter,
    this.solutions,
    this.subCounty,
    this.summaryOFArchievements,
    this.title,
    this.totalSavings,
    this.totalSocialFund,
    this.village,
  );

  void fromMap(String idd, Map map) {
    id = idd;
    collectorName = map["collectorName"];
    title = map["title"];
    date = map["date"];
    grpName = map["grpName"];
    numMembers = map["numMembers"];
    numMale = map["numMale"];
    numFemale = map["numFemale"];
    subCounty = map["subCounty"];
    parish = map["parish"];
    village = map["village"];
    reportQuarter = map["reportQuarter"];
    month = map["month"];
    totalSavings = map["totalSavings"];
    loanAmtGivenOut = map["loanAmtGivenOut"];
    loanRepaymentAmt = map["loanRepaymentAmt"];
    totalSocialFund = map["totalSocialFund"];
    remarks = map["remarks"];
    numMemeberWithIGA = map["numMemeberWithIGA"];
    numMembersIGAcollapsed = map["numMembersIGAcollapsed"];
    numMembersIGAmaitained = map["numMembersIGAmaitained"];
    numMembersNewIGA = map["numMembersNewIGA"];
    anyIGAyesORno = map["anyIGAyesORno"];
    ifYesWhichIGA = map["ifYesWhichIGA"];
    summaryOFArchievements = map["summaryOFArchievements"];
    challenges = map["challenges"];
    solutions = map["solutions"];
    grpActionPlan = map["grpActionPlan"];
    created = map["created"];
    modified = map["modified"];
  }
}
