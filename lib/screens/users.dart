import 'package:ucaa_datamgt/index.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _showPassword = false;
  bool _showPassword2 = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(onListen);
    _userNameController.addListener(onListen);
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                const Text(
                  'Add User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 35,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: new EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_back,
                                            size: 25,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                        const Text(
                                          ' Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 8,
                      child: Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CircleAvatar(
                              //   radius: 50,
                              //   child: Image.asset('assets/icon.png'),
                              // ),
                              // SizedBox(height: 5),
                              const Text(
                                'Create Your Account',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 50),
                              TextFormField(
                                controller: _emailController,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark),
                                cursorColor: const Color(0xffffb300),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Color(0xffffb300))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.amber,
                                      )),
                                  // contentPadding: EdgeInsets.all(15),
                                  labelText: ' Email',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  hintText: 'ochen@gmail.com',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  suffixIcon: _emailController.text.isEmpty
                                      ? Container(width: 0)
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () =>
                                              _emailController.clear(),
                                        ),
                                ),
                                autofillHints: const [AutofillHints.email],
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Email';
                                  }
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return 'Please enter correct email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _userNameController,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark),
                                cursorColor: const Color(0xffffb300),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Color(0xffffb300))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.amber,
                                      )),
                                  // contentPadding: EdgeInsets.all(15),
                                  labelText: ' UserName',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  hintText: 'ochenHillary',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  suffixIcon: _userNameController.text.isEmpty
                                      ? Container(width: 0)
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () =>
                                              _userNameController.clear(),
                                        ),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter UserName';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _passController,
                                obscureText: !_showPassword,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark),
                                cursorColor: const Color(0xffffb300),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Color(0xffffb300))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.amber,
                                      )),
                                  prefixIcon: Icon(
                                    Icons.security_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: ' PassWord',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  suffixIcon: IconButton(
                                    icon: _showPassword
                                        ? const Icon(Icons.visibility_off,
                                            color: Colors.grey)
                                        : const Icon(Icons.visibility,
                                            color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _pass2Controller,
                                obscureText: !_showPassword2,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorDark),
                                cursorColor: const Color(0xffffb300),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Color(0xffffb300))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.amber,
                                      )),
                                  prefixIcon: Icon(
                                    Icons.security_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: 'Retype PassWord',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  suffixIcon: IconButton(
                                    icon: _showPassword2
                                        ? const Icon(Icons.visibility_off,
                                            color: Colors.grey)
                                        : const Icon(Icons.visibility,
                                            color: Colors.grey),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword2 = !_showPassword2;
                                      });
                                    },
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  if (value != _passController.text) {
                                    return 'Passwords don\'t match';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              isLoading != true
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (_formkey.currentState!.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          AuthenticationHelper()
                                              .signUp(
                                                  email: _emailController
                                                      .value.text,
                                                  password: _passController
                                                      .value.text,
                                                  userName: _userNameController
                                                      .value.text)
                                              .then((result) {
                                            if (result == null) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Home())); //VerifyEmail
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                              });

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      buildSnackBar(result));
                                            }
                                          });
                                        }
                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        LinearProgressIndicator(
                                            backgroundColor: Theme.of(context)
                                                .backgroundColor,
                                            color:
                                                Theme.of(context).primaryColor),
                                        const SizedBox(height: 5),
                                        Text('Checking Credentials',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ],
                                    ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.removeListener(onListen);
    _userNameController.removeListener(onListen);
    _userNameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
