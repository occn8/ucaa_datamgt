class WIDdataModel {
  String groupName;
  String subCounty;
  String parish;
  String gdFormed;
  int numMembers;
  int timesSharedOut;
  int shareValue;
  int numChildren;
  int amntHighestSaver;
  int amntSaved;
  int amntSocialFund;
  int amntLoansTaken;
  int numLoansAccessed;
  int loanRepayment;
  int amntLoansWrittenoff;
  final String created;
  final String modified;
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
    this.created,
    this.modified,
  );
}
