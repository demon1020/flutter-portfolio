import 'package:portfolio/core.dart';

class HomeProvider extends ChangeNotifier{
  int position = 0;
  late final ScrollController scrollController;

  void scrollTo(double pos) async{
    scrollController.position.animateTo(pos, duration: Duration(seconds: 2), curve: Curves.decelerate);
    notifyListeners();
  }

  changeWork(int pos){
    position = pos;
    notifyListeners();
  }

  List<Work> workList = [
    Work("BMI CALCULATOR", "BMI Calculator App", PortfolioConstants.kWorkBmi,
        AssetConstants.kWorkBmi, PortfolioConstants.kWorkBmiLink),
    Work(
        "Chat GPT Assistant",
        "Chat GPT Assistant AI integrated in the app",
        PortfolioConstants.kWorkChatGpt,
        AssetConstants.kWorkChatGpt,
        PortfolioConstants.kWorkChatGptLink),
  ];

  Future<void> launchUri(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'my.mail@example.com',
    );
    String  url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print( 'Could not launch $url');
    }
  }

}