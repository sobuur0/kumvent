class OnboardingContents {
  final String title;
  final String desc;
  final String image;

  OnboardingContents({
    required this.image,
    this.title = 'Feel the ease of finding an Event \n Center',
    this.desc = "Wherever you are, I'll be there as long as you\n need me.",
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    image: 'images/page1.png',
  ),
  OnboardingContents(
    image: 'images/page2.png',
  ),
  OnboardingContents(
    image: 'images/page3.png',
  ),
];
