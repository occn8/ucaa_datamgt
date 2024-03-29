import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddReach extends StatefulWidget {
  const AddReach({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddReachState createState() => _AddReachState();
}

class _AddReachState extends State<AddReach> {
  final _formkey = GlobalKey<FormState>();
  final _vslaNameController = TextEditingController();
  final _perAttendenceController = TextEditingController();
  final _locationController = TextEditingController();
  final _totalSavingsController = TextEditingController();
  final _numMembersController = TextEditingController();
  final _vslaCapitalController = TextEditingController();
  final _loanTakenController = TextEditingController();
  final _totalWelfareController = TextEditingController();
  final _welfareLoanedOutController = TextEditingController();
  final _membersAccessedLoansController = TextEditingController();
  final _loanRepaymentController = TextEditingController();
  bool isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back,
                          size: 28, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Text(
                  widget.dataId == '' ? "Add Reach Data" : "Update Reach Data",
                  style: TextStyle(
                      fontSize: !kIsWeb ? 18 : 20,
                      fontWeight: !kIsWeb ? FontWeight.w600 : FontWeight.bold),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: SafeArea(
        child: GestureDetector(
          // onTap: () => FocusScope.of(context).unfocus(),
          child: isUploading == false
              ? SafeArea(
                  child: widget.dataId == ''
                      ? ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Form(
                              key: _formkey,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    formColumn(context),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            isUploading = true;
                                          });
                                          Map<String, dynamic> data = {
                                            'vslaName':
                                                _vslaNameController.value.text,
                                            'perAttendence': int.parse(
                                                _perAttendenceController
                                                    .value.text),
                                            'location':
                                                _locationController.value.text,
                                            'numMembers': int.parse(
                                                _numMembersController
                                                    .value.text),
                                            'totalSavings': int.parse(
                                                _totalSavingsController
                                                    .value.text),
                                            'vslaCapital': int.parse(
                                                _vslaCapitalController
                                                    .value.text),
                                            'loanTaken': int.parse(
                                                _loanTakenController
                                                    .value.text),
                                            'totalWelfare': int.parse(
                                                _totalWelfareController
                                                    .value.text),
                                            'welfareLoanedOut': int.parse(
                                                _welfareLoanedOutController
                                                    .value.text),
                                            'membersAccessedLoans': int.parse(
                                                _membersAccessedLoansController
                                                    .value.text),
                                            'loanRepayment': int.parse(
                                                _loanRepaymentController
                                                    .value.text),
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                                  data: data, col: 'reachtable')
                                              .then((result) {
                                            if (result == null) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(buildSnackBar(
                                                      "Data Added to Database"));
                                              // Navigator.pushReplacement(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) => ()));
                                            } else {
                                              setState(() {
                                                isUploading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      buildSnackBar(result));
                                            }
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      child: const Text(
                                        'Add Data',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : FutureBuilder<DocumentSnapshot>(
                          future: _firestore
                              .collection('reachtable')
                              .doc(widget.dataId)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return LinearProgressIndicator(
                                  color: Theme.of(context).primaryColor);
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {}
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            _vslaNameController.text = data['vslaName'];
                            _perAttendenceController.text =
                                data['perAttendence'].toString();
                            _locationController.text = data['location'];
                            _numMembersController.text =
                                data['numMembers'].toString();
                            _totalSavingsController.text =
                                data['totalSavings'].toString();
                            _vslaCapitalController.text =
                                data['vslaCapital'].toString();
                            _loanTakenController.text =
                                data['loanTaken'].toString();
                            _totalWelfareController.text =
                                data['totalWelfare'].toString();
                            _welfareLoanedOutController.text =
                                data['welfareLoanedOut'].toString();
                            _membersAccessedLoansController.text =
                                data['membersAccessedLoans'].toString();
                            _loanRepaymentController.text =
                                data['loanRepayment'].toString();
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Form(
                                  key: _formkey,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        formColumn(context),
                                        const SizedBox(height: 40),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isUploading = true;
                                              });
                                              FocusScope.of(context).unfocus();

                                              Map<String, dynamic> data = {
                                                'vslaName': _vslaNameController
                                                    .value.text,
                                                'perAttendence': int.parse(
                                                    _perAttendenceController
                                                        .value.text),
                                                'location': _locationController
                                                    .value.text,
                                                'numMembers': int.parse(
                                                    _numMembersController
                                                        .value.text),
                                                'totalSavings': int.parse(
                                                    _totalSavingsController
                                                        .value.text),
                                                'vslaCapital': int.parse(
                                                    _vslaCapitalController
                                                        .value.text),
                                                'loanTaken': int.parse(
                                                    _loanTakenController
                                                        .value.text),
                                                'totalWelfare': int.parse(
                                                    _totalWelfareController
                                                        .value.text),
                                                'welfareLoanedOut': int.parse(
                                                    _welfareLoanedOutController
                                                        .value.text),
                                                'membersAccessedLoans': int.parse(
                                                    _membersAccessedLoansController
                                                        .value.text),
                                                'loanRepayment': int.parse(
                                                    _loanRepaymentController
                                                        .value.text),
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'reachtable')
                                                  .then((result) {
                                                if (result == null) {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(buildSnackBar(
                                                          "Data Updated successfully"));
                                                } else {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          buildSnackBar(
                                                              result));
                                                }
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Update Data',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                )
              : const SafeArea(child: LinearProgressIndicator()),
        ),
      ),
    );
  }

  Column formColumn(BuildContext context) {
    return Column(
      children: [
        buildTextFormField2(
            context, _vslaNameController, 'VLSA Name', "vlsa_name",
            type: TextInputType.text),
        buildTextFormField2(
            context, _perAttendenceController, 'Attendance', "20"),
        buildTextFormField2(context, _locationController, 'Location', "kampala",
            type: TextInputType.text),
        buildTextFormField2(
            context, _numMembersController, 'Number of Members', "25"),
        buildTextFormField2(
            context, _totalSavingsController, 'Total Savings', "20000"),
        buildTextFormField2(
            context, _vslaCapitalController, 'VLSA Capital', "2000"),
        buildTextFormField2(
            context, _loanTakenController, 'Loan taken', "10000"),
        buildTextFormField2(
            context, _totalWelfareController, 'Total welfare', "20000"),
        buildTextFormField2(
            context, _welfareLoanedOutController, 'Welfare Loaned out', "400"),
        buildTextFormField2(context, _membersAccessedLoansController,
            'Member accessed Loans', "6"),
        buildTextFormField2(
            context, _loanRepaymentController, 'Loan Repayment', "2000"),
      ],
    );
  }

  @override
  void dispose() {
    _vslaNameController.dispose();
    _perAttendenceController.dispose();
    _locationController.dispose();
    _totalSavingsController.dispose();
    _numMembersController.dispose();
    _vslaCapitalController.dispose();
    _loanTakenController.dispose();
    _totalWelfareController.dispose();
    _welfareLoanedOutController.dispose();
    _membersAccessedLoansController.dispose();
    _loanRepaymentController.dispose();
    super.dispose();
  }
}
