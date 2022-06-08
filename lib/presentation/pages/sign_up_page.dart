import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/models/user_model.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';
import 'package:kumvent/presentation/widgets/authentication_button.dart';
import 'package:kumvent/presentation/widgets/icon_container.dart';
import 'package:kumvent/presentation/widgets/text_form_list_tile.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = '/signUpPage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isChecked = false;
  late bool _isPasswordVisible = true;

  final FocusNode _focusNode = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late User? user;
  final UserModel _userModel = UserModel();

  final _formKey = GlobalKey<FormState>();

  bool _isloading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Image.asset(
                'images/onboarding_logo.png',
                height: 51.0,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 24.0)),
              Text(
                'Create a New Account',
                textAlign: TextAlign.center,
                style: TextStyles.bold(
                  color: kTextPrimaryColor,
                  fontSize: 20.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
              TextFormListTile(
                text: 'Full Name',
                textController: _fullNameController,
                keyboardType: TextInputType.name,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Kindly enter your name';
                  } else if (text.length < 6) {
                    return 'Your name must defiinitely be more than 6 characters';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormListTile(
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
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              TextFormListTile(
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
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          // ignore: todo
                          //TODO: tell shina to give the correct fontFamily to these texts
                          TextSpan(
                            text: 'I agree to ',
                            style: TextStyles.regular(
                              color: kNeutralColor,
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service ',
                            style: TextStyles.medium(
                              color: kBlueShadeColor,
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyles.regular(
                              color: kNeutralColor,
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyles.medium(
                              color: kBlueShadeColor,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 30.0)),
              AuthenticationButton(
                label: _isloading == true
                    ? '  Setting up your account...'
                    : 'Create an Account',
                icon: _isloading == true
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
                onPressed: () {
                  _focusNode.requestFocus();
                  if (_formKey.currentState!.validate() && _isChecked == true) {
                    setState(() {
                      _isloading = true;
                    });
                    _registerUser(
                      _emailAddressController.text.trim(),
                      _passwordController.text.trim(),
                    );
                  }
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30.0)),
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
                        text: 'Have an account? ',
                        style: TextStyles.medium(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                // ignore: always_specify_types
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SignInPage(),
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

  void _registerUser(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => {
              sendUserDetailsToFirestore(),
              Navigator.of(context).pushAndRemoveUntil(
                (MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                )),
                (route) => false,
              ),
            },
          );

      setState(() {
        _isloading = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString().trim());
      setState(() {
        _isloading = false;
      });
    }
  }

  sendUserDetailsToFirestore() async {
    user = _auth.currentUser;

    _userModel.email = user!.email;
    _userModel.fullName = _fullNameController.text.trim();
    _userModel.uid = user!.uid;

    await _firebaseFirestore
        .collection('users')
        .doc(user!.uid)
        .set(_userModel.toMap());

    Fluttertoast.showToast(
        msg:
            'Yaaayy!!!!\nYour account has been created successfully!!\n Kindly signIn to start a Meaningful Experience');
  }
}
