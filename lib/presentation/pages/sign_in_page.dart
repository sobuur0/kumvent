import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/forgot_password.dart';
import 'package:kumvent/presentation/pages/home.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/presentation/widgets/authentication_button.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isPasswordVisible = true;

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Image.asset(
                'images/onboarding_logo.png',
                height: 51.0,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              Text(
                'Let\'s Sign you in.',
                textAlign: TextAlign.center,
                style: TextStyles.bold(
                  color: kTextPrimaryColor,
                  fontSize: 20.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 14.0)),
              Text(
                'Welcome back. You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyles.medium(
                  color: kTextPrimaryColor,
                  fontSize: 14.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 60.0)),
              TextFormListTile(
                key: const ValueKey('emailText'),
                text: 'Email Address',
                textController: _emailAddressController,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Kindly enter your email address';
                  } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(text)) {
                    return 'Kindly Enter a valid email address';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              TextFormListTile(
                key: const ValueKey('passwordText'),
                text: 'Password',
                textController: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: _isPasswordVisible,
                validator: (text) {
                  if (text!.isEmpty || text.length < 6) {
                    return 'Password must be more than 6 characters';
                  }
                  return null;
                },
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    !_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: const Color(0xFF1A2731).withOpacity(0.6),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 8.0)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ForgotPasswordPage(),
                    ),
                  );
                },
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.end,
                  style: TextStyles.medium(
                    color: const Color(0xFF636262),
                    fontSize: 12.0,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 22.0)),
              AuthenticationButton(
                key: const ValueKey('signInBtn'),
                label: _isLoading == true
                    ? '  Signing In... Please Wait'
                    : 'LogIn',
                icon: _isLoading == true
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
                onPressed: () {
                  _focusNode.requestFocus();
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    _signInUser(
                      _emailAddressController.text.trim(),
                      _passwordController.text.trim(),
                    );
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 46.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black.withOpacity(0.7),
                      endIndent: 30.0,
                    ),
                  ),
                  const Text('Or'),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black.withOpacity(0.7),
                      indent: 30.0,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContainer(
                    height: 56.0,
                    width: 56.0,
                    color: kIconContainerColor,
                    borderRadius: 10.0,
                    borderColor: kIconContainerColor,
                    borderWidth: 0.0,
                    onTap: () {},
                    child: const Icon(
                      Icons.apple,
                      size: 35.0,
                    ),
                  ),
                  IconContainer(
                    height: 56.0,
                    width: 56.0,
                    color: kIconContainerColor,
                    borderRadius: 10.0,
                    borderColor: kIconContainerColor,
                    borderWidth: 0.0,
                    onTap: () {},
                    child: const Icon(
                      Icons.facebook,
                      size: 35.0,
                      color: Color(0xFF039BE5),
                    ),
                  ),
                  IconContainer(
                    height: 56.0,
                    width: 56.0,
                    color: kIconContainerColor,
                    borderRadius: 10.0,
                    borderColor: kIconContainerColor,
                    borderWidth: 0.0,
                    onTap: () {},
                    child: const Image(
                      image: AssetImage('images/google.png'),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30.0)),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyles.medium(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        text: 'SignUp',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                // ignore: always_specify_types
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SignUpPage(),
                                ),
                              ),
                        style: TextStyles.semiBold(
                          color: kBlueShadeColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(
          msg: 'You have succesfully signed into your account!!');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString().trim());
      setState(() {
        _isLoading = false;
      });
    }
  }
}
