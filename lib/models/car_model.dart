class CaRDataModel {
  final String groupName;
  final String subCounty;
  final String parish;
  final String gdFormed;
  final int numMembers;
  final int segMale;
  final int segFemale;
  final int timesSharedOut;
  final double shareValue;
  final int numChildren;
  final double amntHighestSaver;
  final double amntSaved;
  final double amntSocialFund;
  final double amntLoansTaken;
  final int numLoansAccessed;
  final num loanRepayment;
  final double amntLoansWrittenoff;
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
  );
}
