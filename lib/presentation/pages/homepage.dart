import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: kTextPrimaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: kTextPrimaryColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 20.0)),
            const Icon(
              Icons.location_on,
              color: kErrorColor,
            ),
            const Padding(padding: EdgeInsets.only(right: 10.0)),
            Text(
              'Ita Oniyan, Ondo',
              style: TextStyles.bold(
                color: kPrimaryColor,
                fontSize: 16.0,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 20.0,
              child: Image.asset('images/profile_pic.png'),
            ),
          ],
        ),
      ),
    );
  }
}
