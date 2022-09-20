import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/constants/pref_key.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/models/onboarding_contents.dart';
import 'package:kumvent/services/shared_prefs.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static String routeName = '/onboard';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;
  static const Duration _duration = Duration(milliseconds: 700);

  SharedPrefs prefs = SharedPrefs();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/onboarding_logo.png',
                    height: 51.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: _currentPage + 1 == contents.length ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextButton(
                        onPressed: () => _pageController.animateToPage(
                          contents.length - 1,
                          duration: _duration,
                          curve: Curves.easeInOut,
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyles.medium(
                            color: kNeutralColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20.0)),
            SizedBox(
              height: size.height * 0.75,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 390,
                          width: 380,
                          decoration: const BoxDecoration(
                            color: Color(0xffF3F5FC),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 110,
                              backgroundColor: const Color(0xffD1D8F2),
                              child: Center(
                                child: Image.asset(
                                  contents[index].image,
                                  height: 165,
                                  width: 165,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        contents[index].title,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.7,
                        style: TextStyles.bold(
                          color: kLeadingIconColor,
                          fontSize: 24,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 15.0)),
                      Text(
                        contents[index].desc,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                        style: TextStyles.medium(
                          color: kTextPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index),
                  ),
                ),
                _currentPage + 1 == contents.length
                    ? ElevatedButton(
                        onPressed: () {
                          prefs.setBool(PrefKey.kOnboardingKey, true);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                          Curves.easeIn;
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyles.bold(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.east),
                          radius: 20,
                          backgroundColor: kPrimaryColor,
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? kPrimaryColor
            : const Color(0xFF0D34BF).withOpacity(0.15),
      ),
      margin: const EdgeInsets.only(right: 3),
      height: 5,
      width: _currentPage == index ? 25 : 15,
    );
  }
}
