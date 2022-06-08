import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kumvent/models/user_model.dart';
import 'package:kumvent/presentation/pages/favorites_page.dart';
import 'package:kumvent/presentation/pages/sign_in_page.dart';
import 'package:kumvent/presentation/widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel currentUser = UserModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => currentUser = UserModel.fromMap(value.data()));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Center(
              child: Image.asset(
                'images/profile_image.png',
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              height: 20,
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
              height: 56.0,
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
                    builder: (context) => const FavoritesPage(),
                  ),
                );
              },
            ),
            ProfileCard(
              leadingIcon: Icons.feedback_outlined,
              title: 'About App',
              onPressed: () {},
            ),
            ProfileCard(
              leadingIcon: Icons.payment_outlined,
              title: 'Payment',
              onPressed: () {},
            ),
            ProfileCard(
              leadingIcon: Icons.help,
              title: 'Help Center',
              onPressed: () {},
            ),
            ProfileCard(
              leadingIcon: Icons.logout,
              title: 'Logout',
              onPressed: () {
                _logoutUser();
                Fluttertoast.showToast(
                    msg: 'You have successfully been logged out');
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8.0)),
            const Center(
              child: Text(
                'Version 0.4.465',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          ],
        ),
      ),
    );
  }

  Future<void> _logoutUser() async {
    await _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }
}
