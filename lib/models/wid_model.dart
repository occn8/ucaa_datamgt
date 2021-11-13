class WIDdataModel {
  String groupName;
  String subCounty;
  String parish;
  String gdFormed;
  int numMembers;
  int timesSharedOut;
  double shareValue;
  int numChildren;
  double amntHighestSaver;
  double amntSaved;
  double amntSocialFund;
  double amntLoansTaken;
  int numLoansAccessed;
  num loanRepayment;
  double amntLoansWrittenoff;
  bool selected = false;

  WIDdataModel(
    this.groupName,
    this.subCounty,
    this.parish,
    this.gdFormed,
    this.numMembers,
    this.timesSharedOut,
    this.shareValue,
    this.numChildren,
    this.amntHighestSaver,
    this.amntSaved,
    this.amntSocialFund,
    this.amntLoansTaken,
    this.numLoansAccessed,
    this.loanRepayment,
    this.amntLoansWrittenoff,
  );
}
