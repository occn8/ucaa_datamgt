class REACHdataModel {
  String vslaName;
  String perAttendence;
  String location;
  int numMembers;
  double totalSavings;
  double vslaCapital;
  double loanTaken;
  double totalWelfare;
  double welfareLoanedOut;
  int membersAccessedLoans;
  double loanRepayment;
  bool selected = false;

  REACHdataModel(
    this.vslaName,
    this.perAttendence,
    this.location,
    this.numMembers,
    this.totalSavings,
    this.vslaCapital,
    this.loanTaken,
    this.totalWelfare,
    this.welfareLoanedOut,
    this.membersAccessedLoans,
    this.loanRepayment,
  );
}
