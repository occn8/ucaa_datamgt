import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddShg extends StatefulWidget {
  const AddShg({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddShgState createState() => _AddShgState();
}

class _AddShgState extends State<AddShg> {
  final _formkey = GlobalKey<FormState>();
  final _shgNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _shgFormedController = TextEditingController();
  final _numMemberController = TextEditingController();
  final _perAttendanceWkController = TextEditingController();
  final _numChildrenController = TextEditingController();
  final _wkSavingsController = TextEditingController();
  final _wkSavingPerMemberController = TextEditingController();
  final _totalSavingController = TextEditingController();
  final _shgFundsController = TextEditingController();
  final _amountLoanTakenController = TextEditingController();
  final _numLoansAccessedController = TextEditingController();
  final _loanRepaymentController = TextEditingController();
  final _loanSavingRatioController = TextEditingController();
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
                          size: 28, color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
                Text(
                  widget.dataId == '' ? "Add Data" : "Edit Data",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: const Text(
                                'Add SHG Data',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Form(
                              key: _formkey,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    buildTextFormField(
                                      context,
                                      _shgNameController,
                                      'SHG Name',
                                      "shg_name",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _locationController,
                                      'Location',
                                      "kampala",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _shgFormedController,
                                      'Formed',
                                      "1/3/2019",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _numMemberController,
                                      'No Members',
                                      "19",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _perAttendanceWkController,
                                      '%Attendance per Week',
                                      "15",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _numChildrenController,
                                      'No Children',
                                      "3",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _wkSavingsController,
                                      'Week Savings',
                                      "1500",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _wkSavingPerMemberController,
                                      'Weekly savings per member',
                                      "150",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _totalSavingController,
                                      'Total Savings',
                                      "10500",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _shgFundsController,
                                      'SHG Funds',
                                      "5000",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _amountLoanTakenController,
                                      'Amount of Loan taken',
                                      "500",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _numLoansAccessedController,
                                      'No Loans accessed',
                                      "4",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _loanRepaymentController,
                                      'Loans Repayment',
                                      "400",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _loanSavingRatioController,
                                      'Loan/Savings ratio',
                                      "1:3",
                                      TextInputType.number,
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            isUploading = true;
                                          });
                                          Map<String, dynamic> data = {
                                            'shgName':
                                                _shgNameController.value.text,
                                            'location':
                                                _locationController.value.text,
                                            'shgFormed':
                                                _shgFormedController.value.text,
                                            'numMember': int.parse(
                                                _numMemberController
                                                    .value.text),
                                            'perAttendanceWk': int.parse(
                                                _perAttendanceWkController
                                                    .value.text),
                                            'numChildren': int.parse(
                                                _numChildrenController
                                                    .value.text),
                                            'wkSavings': int.parse(
                                                _wkSavingsController
                                                    .value.text),
                                            'wkSavingPerMember': int.parse(
                                                _wkSavingPerMemberController
                                                    .value.text),
                                            'totalSaving': int.parse(
                                                _totalSavingController
                                                    .value.text),
                                            'shgFunds': int.parse(
                                                _shgFundsController.value.text),
                                            'amountLoanTaken': int.parse(
                                                _amountLoanTakenController
                                                    .value.text),
                                            'numLoansAccessed': int.parse(
                                                _numLoansAccessedController
                                                    .value.text),
                                            'loanRepayment': int.parse(
                                                _loanRepaymentController
                                                    .value.text),
                                            'loanSavingRatio':
                                                _loanSavingRatioController
                                                    .value.text,
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                                  data: data, col: 'shgtable')
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
                              .collection('shgtable')
                              .doc(widget.dataId)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const LinearProgressIndicator();
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {}
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            _shgNameController.text = data['shgName'];
                            _locationController.text = data['location'];
                            _shgFormedController.text = data['shgFormed'];
                            _numMemberController.text =
                                data['numMember'].toString();
                            _perAttendanceWkController.text =
                                data['perAttendanceWk'].toString();
                            _numChildrenController.text =
                                data['numChildren'].toString();
                            _wkSavingsController.text =
                                data['wkSavings'].toString();
                            _wkSavingPerMemberController.text =
                                data['wkSavingPerMember'].toString();
                            _totalSavingController.text =
                                data['totalSaving'].toString();
                            _shgFundsController.text =
                                data['shgFunds'].toString();
                            _amountLoanTakenController.text =
                                data['amountLoanTaken'].toString();
                            _numLoansAccessedController.text =
                                data['numLoansAccessed'].toString();
                            _loanRepaymentController.text =
                                data['loanRepayment'].toString();
                            _loanSavingRatioController.text =
                                data['loanSavingRatio'];
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Update SHG Data',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Form(
                                  key: _formkey,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        buildTextFormField(
                                          context,
                                          _shgNameController,
                                          'SHG Name',
                                          "shg_name",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _locationController,
                                          'Location',
                                          "kampala",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _shgFormedController,
                                          'Formed',
                                          "1/3/2019",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _numMemberController,
                                          'No Members',
                                          "19",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _perAttendanceWkController,
                                          '%Attendance per Week',
                                          "15",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _numChildrenController,
                                          'No Children',
                                          "3",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _wkSavingsController,
                                          'Week Savings',
                                          "1500",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _wkSavingPerMemberController,
                                          'Weekly savings per member',
                                          "150",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _totalSavingController,
                                          'Total Savings',
                                          "10500",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _shgFundsController,
                                          'SHG Funds',
                                          "5000",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _amountLoanTakenController,
                                          'Amount of Loan taken',
                                          "500",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _numLoansAccessedController,
                                          'No Loans accessed',
                                          "4",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _loanRepaymentController,
                                          'Loans Repayment',
                                          "400",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _loanSavingRatioController,
                                          'Loan/Savings ratio',
                                          "1:3",
                                          TextInputType.number,
                                        ),
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
                                                'shgName': _shgNameController
                                                    .value.text,
                                                'location': _locationController
                                                    .value.text,
                                                'shgFormed':
                                                    _shgFormedController
                                                        .value.text,
                                                'numMember': int.parse(
                                                    _numMemberController
                                                        .value.text),
                                                'perAttendanceWk': int.parse(
                                                    _perAttendanceWkController
                                                        .value.text),
                                                'numChildren': int.parse(
                                                    _numChildrenController
                                                        .value.text),
                                                'wkSavings': int.parse(
                                                    _wkSavingsController
                                                        .value.text),
                                                'wkSavingPerMember': int.parse(
                                                    _wkSavingPerMemberController
                                                        .value.text),
                                                'totalSaving': int.parse(
                                                    _totalSavingController
                                                        .value.text),
                                                'shgFunds': int.parse(
                                                    _shgFundsController
                                                        .value.text),
                                                'amountLoanTaken': int.parse(
                                                    _amountLoanTakenController
                                                        .value.text),
                                                'numLoansAccessed': int.parse(
                                                    _numLoansAccessedController
                                                        .value.text),
                                                'loanRepayment': int.parse(
                                                    _loanRepaymentController
                                                        .value.text),
                                                'loanSavingRatio':
                                                    _loanSavingRatioController
                                                        .value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'shgtable')
                                                  .then((result) {
                                                if (result == null) {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(buildSnackBar(
                                                          "Product Updated successfully"));
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
                                        ElevatedButton(
                                          onPressed: () async {
                                            // Navigator.pushReplacement(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             DeletePdt(
                                            //               pdtId: widget.pdtId,
                                            //             )));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).errorColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Delete Data',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
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

  buildTextFormField(BuildContext context, TextEditingController control,
      String label, String hint, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: control,
        style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.green)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(15),
          labelText: label,
          labelStyle:
              TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _shgNameController.dispose();
    _numMemberController.dispose();
    _wkSavingsController.dispose();
    _shgFormedController.dispose();
    _locationController.dispose();
    _perAttendanceWkController.dispose();
    super.dispose();
  }
}
