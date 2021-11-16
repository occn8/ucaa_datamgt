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
  final String created;
  final String modified;
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
}
