import 'package:flutter/material.dart';
import 'package:kumvent/presentation/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 8.0)),
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
                const Text(
                  'Sulaimon Aminat',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff061A60),
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
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                const Text(
                  'Version 0.4.465',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
