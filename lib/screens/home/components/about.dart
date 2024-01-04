import 'package:portfolio/core.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Container(
      margin: EdgeInsets.all(dynamicPadding(2)),
      padding: EdgeInsets.all(dynamicPadding(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "About"),
          SizedBox(height: dynamicHeight(3),),

          Text(
            'Get a closer look at who I am',
            style: TextStyle(
              fontSize: dynamicTextSize(2),
            ),
          ),
          SizedBox(height: dynamicHeight(3)),

          TitleWidget(title: "Skills & Tools",isTitle: false),
          SizedBox(height: dynamicHeight(2),),
          Container(child: Text('Flutter, Dart, Java, HTML, Javascript, Node JS, Mongo DB, My SQL, Firebase',style: TextStyle(fontSize: dynamicTextSize(1.3)),),),
          SizedBox(height: dynamicHeight(3),),

          TitleWidget(title: "Who am I",isTitle: false),
          SizedBox(height: dynamicHeight(2),),
          Container(child: Text(PortfolioConstants.kWhoIAm,textAlign: TextAlign.justify,style: TextStyle(fontSize: dynamicTextSize(1.3)),),),
          SizedBox(height: dynamicHeight(2),),

          FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: dynamicHeight(5),
                  width: dynamicWidth(30),
                  child: ElevatedButton(
                    onPressed: ()=> provider.scrollTo(2350),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Constants.kPrimaryColor.withOpacity(0.5);
                        }
                        return Constants.kPrimaryColor;
                      }),
                    ),
                    child: Text(
                      'Get In Touch',
                      style: TextStyle(color: Constants.kWhite,fontSize: dynamicHeight(1.2)),
                    ),
                  ),
                ),
                SizedBox(width: dynamicWidth(2),),
                SizedBox(
                  height: dynamicHeight(5),
                  width: dynamicWidth(30),
                  child: OutlinedButton(
                    onPressed: () async{
                      await _launchUrl(PortfolioConstants.kResume);
                    },
                    child: Text('Download CV',style: TextStyle(fontSize: dynamicHeight(1.2)),),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
