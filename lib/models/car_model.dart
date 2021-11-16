class CaRDataModel {
  final String groupName;
  final String subCounty;
  final String parish;
  final String gdFormed;
  final int numMembers;
  final int segMale;
  final int segFemale;
  final int timesSharedOut;
  final int shareValue;
  final int numChildren;
  final int amntHighestSaver;
  final int amntSaved;
  final int amntSocialFund;
  final int amntLoansTaken;
  final int numLoansAccessed;
  final int loanRepayment;
  final int amntLoansWrittenoff;
  final String created;
  final String modified;
  bool selected = false;

  CaRDataModel(
    this.groupName,
    this.subCounty,
    this.parish,
    this.gdFormed,
    this.numMembers,
    this.segMale,
    this.segFemale,
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
