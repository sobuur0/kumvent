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
        backgroundColor: kPrimaryColor,
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Padding(padding: EdgeInsets.only(top: 14.0)),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Let\'s help you find your\nperfect ',
                  style: TextStyles.semiBold(
                    color: kTextPrimaryColor,
                    fontSize: 20.0,
                  ),
                ),
                TextSpan(
                  text: 'Event Center',
                  style: TextStyles.bold(
                    color: kTextPrimaryColor,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 23.0)),
          //Search Container
          Container(
            child: Row(children: []),
          ),
          const Padding(padding: EdgeInsets.only(top: 34.0)),
          _buildTextButtons(
            leftText: 'Most Popular',
            rightText: 'view all',
          ),
          const Padding(padding: EdgeInsets.only(bottom: 16.0)),
          //Available Hotel Horizontal listView
          Container(
            height: 80.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  color: Colors.red,
                  width: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24.0),
          ),
          _buildTextButtons(
            leftText: 'Near you',
            rightText: 'view all',
          ),
        ],
      ),
    );
  }

  Widget _buildTextButtons({
    required String leftText,
    required String rightText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Text(
            leftText,
            style: TextStyles.bold(
              color: kPrimaryColor,
              fontSize: 20.0,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Text(
            rightText,
            style: TextStyles.regular(
              color: kPrimaryColor,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
