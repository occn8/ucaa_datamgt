class CaRDataModel {
  String id;
  String groupName;
  String subCounty;
  String parish;
  String gdFormed;
  int numMembers;
  int segMale;
  int segFemale;
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
  String created;
  String modified;
  bool selected = false;

  CaRDataModel(
    this.id,
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

  void fromMap(String idd, Map map) {
    id = idd;
    groupName = map["groupName"];
    subCounty = map["subCounty"];
    parish = map["parish"];
    gdFormed = map["gdFormed"];
    numMembers = map["numMembers"];
    segMale = map["segMale"];
    segFemale = map["segFemale"];
    timesSharedOut = map["timesSharedOut"];
    shareValue = map["shareValue"];
    numChildren = map["numChildren"];
    amntHighestSaver = map["amntHighestSaver"];
    amntSaved = map["amntSaved"];
    amntSocialFund = map["amntSocialFund"];
    amntLoansTaken = map["amntLoansTaken"];
    numLoansAccessed = map["numLoansAccessed"];
    loanRepayment = map["loanRepayment"];
    amntLoansWrittenoff = map["amntLoansWrittenoff"];
    created = map["created"];
    modified = map["modified"];
  }
}
