import 'package:ucaa_datamgt/index.dart';
import 'package:ucaa_datamgt/screens/lander.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool isLoading = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(onListen);
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Expanded(flex: 1, child: Text('')),
                    Expanded(
                      flex: 14,
                      child: Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Please Sign In to continue',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 45),
                              TextFormField(
                                controller: _emailController,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color),
                                cursorColor: Colors.green,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  // contentPadding: EdgeInsets.all(15),
                                  labelText: ' Email',
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color),
                                  hintText: 'johndoe@gmail.com',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  suffixIcon: _emailController.text.isEmpty
                                      ? Container(width: 0)
                                      : IconButton(
                                          icon: const Icon(Icons.close,
                                              color: Colors.grey),
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
                                controller: _passController,
                                obscureText: !_showPassword,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color),
                                cursorColor: Colors.green,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  prefixIcon: Icon(
                                    Icons.security_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
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
                                  labelText: ' PassWord',
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
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
                                              .signIn(
                                                  email: _emailController.text,
                                                  password:
                                                      _passController.text)
                                              .then((result) {
                                            if (result == null) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Home()));
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
                                        'Log In',
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
                              const SizedBox(height: 25),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const ResetPassword()),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
                                ),
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
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
