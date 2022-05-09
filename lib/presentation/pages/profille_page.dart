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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(),
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
                  height: 40,
                ),
                ProfileCard(
                  leadingIcon: Icons.person,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'Edit profile',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ProfileCard(
                  leadingIcon: Icons.history,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'History',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ProfileCard(
                  leadingIcon: Icons.feedback_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'About App',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ProfileCard(
                  leadingIcon: Icons.payment_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'Payment',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ProfileCard(
                  leadingIcon: Icons.help,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'Help Center',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ProfileCard(
                  leadingIcon: Icons.logout,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: 'Logout',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
