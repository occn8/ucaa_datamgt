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
  String totalSavings;
  String loanAmtGivenOut;
  String loanRepaymentAmt;
  String totalSocialFund;
  String remarks;
  String numMemeberWithIGA;
  String numMembersIGAcollapsed;
  String numMembersIGAmaitained;
  String numMembersNewIGA;
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
}
