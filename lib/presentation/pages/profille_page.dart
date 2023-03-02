import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameball/pages/referral_page.dart';
import 'package:kumvent/models/user_model.dart';
import 'package:kumvent/presentation/pages/history_page.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';
import 'package:kumvent/presentation/widgets/profile_card.dart';
import 'package:kumvent/services/auth_repository.dart';
import 'package:gameball/main.dart' as gameball;

class ProfilePage extends StatefulWidget {
  static String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel currentUser = UserModel();
  final FireBaseAuthHelper _authHelper = FireBaseAuthHelper();

  @override
  void initState() {
    _authHelper.getDetailsFromFirestore().then(
      (value) {
        setState(() {});
        currentUser = UserModel.fromMap(
          value.data(),
        );
      },
    );
    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   setState(() {});
    //   currentUser = UserModel.fromMap(value.data());
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 40.0)),
              Center(
                child: Image.asset(
                  'images/profile_image.png',
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  '${currentUser.fullName}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff061A60),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ProfileCard(
                leadingIcon: Icons.person,
                title: 'Edit profile',
                onPressed: () {},
              ),
              ProfileCard(
                leadingIcon: Icons.history,
                title: 'History',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  );
                },
              ),
              ProfileCard(
                leadingIcon: Icons.history,
                title: 'About App',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReferralPage(),
                    ),
                  );
                },
              ),
              ProfileCard(
                leadingIcon: Icons.payment_outlined,
                title: 'Payment',
                onPressed: () {},
              ),
              ProfileCard(
                leadingIcon: Icons.payment_outlined,
                title: 'Help Center',
                onPressed: () {
                  launchSubmodules(context);
                },
              ),
              ProfileCard(
                leadingIcon: Icons.logout,
                title: 'Logout',
                onPressed: () {
                  _logout();
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              const Center(
                child: Text(
                  'Version 0.4.465',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout() async {
    await _authHelper.logoutUser();
    Fluttertoast.showToast(msg: 'Logout succesfull!!');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
      (route) => false,
    );
  }

  void launchSubmodules(BuildContext context) async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // gameball.main();
  }
}
