import 'package:flutter/material.dart';
import 'package:kumvent/constants/app_styles.dart';
import 'package:kumvent/constants/colours.dart';
import 'package:kumvent/presentation/pages/sign_up_page.dart';
import 'package:kumvent/models/onboarding_contents.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static String routeName = '/onboard';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  SignUpPage.routeName,
                ),
                child: Text('Skip Tour',
                    style: TextStyles.medium(
                        color: kLeadingIconColor, fontSize: 16)),
              ),
            ),
            SizedBox(
              height: size.height * 0.8,
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
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      Text(
                        contents[index].title,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.7,
                        style: TextStyles.bold(
                            color: kLeadingIconColor, fontSize: 24),
                      ),
                      Text(
                        contents[index].desc,
                        style: TextStyles.medium(
                            color: kLeadingIconColor, fontSize: 16),
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
                          Navigator.pushNamed(
                            context,
                            SignUpPage.routeName,
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
                          primary: kPrimaryColor,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
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
            ? kPrimaryColor //Color(0xff0D34BF)
            : const Color(0xff0D34BF).withOpacity(0.15),
      ),
      margin: const EdgeInsets.only(right: 3),
      height: 5,
      width: _currentPage == index ? 25 : 15,
    );
  }
}
