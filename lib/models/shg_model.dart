class SHG {
  String shgName;
  String location;
  String shgFormed;
  int numMember;
  int perAttendanceWk;
  int numChildren;
  double wkSavings;
  double wkSavingPerMember;
  double totalSaving;
  double shgFunds;
  double amountLoanTaken;
  int numLoansAccessed;
  num loanRepayment;
  String loanSavingRatio;
  bool selected = false;

  SHG(
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
  );
}
