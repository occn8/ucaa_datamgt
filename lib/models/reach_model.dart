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
  String created;
  String modified;
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

  void fromMap(String id, Map map) {
    id = id;
    vslaName = map["vslaName"];
    perAttendence = map["perAttendence"];
    location = map["location"];
    numMembers = map["numMembers"];
    totalSavings = map["totalSavings"];
    vslaCapital = map["vslaCapital"];
    loanTaken = map["loanTaken"];
    totalWelfare = map["totalWelfare"];
    welfareLoanedOut = map["welfareLoanedOut"];
    membersAccessedLoans = map["membersAccessedLoans"];
    loanRepayment = map["loanRepayment"];
    created = map["created"];
    modified = map["modified"];
  }
}
