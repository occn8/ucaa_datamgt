class REACHdataModel {
  String vslaName;
  int perAttendence;
  String location;
  int numMembers;
  int totalSavings;
  int vslaCapital;
  int loanTaken;
  int totalWelfare;
  int welfareLoanedOut;
  int membersAccessedLoans;
  int loanRepayment;
  final String created;
  final String modified;
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
    this.created,
    this.modified,
  );
}
