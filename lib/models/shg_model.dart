class SHGdataModel {
  String shgName;
  String location;
  String shgFormed;
  int numMember;
  int perAttendanceWk;
  int numChildren;
  int wkSavings;
  int wkSavingPerMember;
  int totalSaving;
  int shgFunds;
  int amountLoanTaken;
  int numLoansAccessed;
  int loanRepayment;
  String loanSavingRatio;
  String created;
  String modified;
  bool selected = false;

  SHGdataModel(
    this.shgName,
    this.location,
    this.shgFormed,
    this.numMember,
    this.perAttendanceWk,
    this.numChildren,
    this.wkSavings,
    this.wkSavingPerMember,
    this.totalSaving,
    this.shgFunds,
    this.amountLoanTaken,
    this.numLoansAccessed,
    this.loanRepayment,
    this.loanSavingRatio,
    this.created,
    this.modified,
  );
  void fromMap(String id, Map map) {
    id = id;
    shgName = map["shgName"];
    location = map["location"];
    shgFormed = map["shgFormed"];
    numMember = map["numMember"];
    perAttendanceWk = map["perAttendanceWk"];
    numChildren = map["numChildren"];
    wkSavings = map["wkSavings"];
    wkSavingPerMember = map["wkSavingPerMember"];
    totalSaving = map["totalSaving"];
    shgFunds = map["shgFunds"];
    amountLoanTaken = map["amountLoanTaken"];
    numLoansAccessed = map["numLoansAccessed"];
    loanRepayment = map["loanRepayment"];
    loanSavingRatio = map["loanSavingRatio"];
    created = map["created"];
    modified = map["modified"];
  }
}
