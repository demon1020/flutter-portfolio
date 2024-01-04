import 'package:portfolio/core.dart';

class WorkSection extends StatefulWidget {
  WorkSection({Key? key}) : super(key: key);

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return ResponsiveRowColumn(
      isPortrait: SizeConfig.isPortrait,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: SizeConfig.screenHeight/2,
          // height: SizeConfig.screenWidth,
          margin: EdgeInsets.all(dynamicPadding(2)),
          padding: EdgeInsets.all(dynamicPadding(2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: "Work"),
              SizedBox(
                height: dynamicHeight(5),
              ),
              Text(
                'Hand-picked Projects \nfor you to see',
                style: TextStyle(
                  fontSize: dynamicTextSize(2),
                ),
              ),
              SizedBox(
                height: dynamicHeight(3),
              ),
              Row(
                children: [
                  customButton((){},Icons.arrow_back_ios_new_rounded),
                  SizedBox(
                    width: dynamicWidth(5),
                  ),
                  Text('${provider.position+1}/${provider.workList.length}',style: TextStyle(fontSize: dynamicTextSize(1.5)),),
                  SizedBox(
                    width: dynamicWidth(5),
                  ),
                  customButton((){},Icons.arrow_forward_ios_rounded),
                ],
              ),
              SizedBox(
                height: dynamicHeight(3),
              ),
              Text(
                provider.workList[provider.position].name,
                style: TextStyle(
                  fontSize: dynamicTextSize(2),
                ),
              ),
              SizedBox(
                height: dynamicHeight(3),
              ),
              TitleWidget(
                  title: provider.workList[provider.position].subtitle, isTitle: false),
              SizedBox(
                height: dynamicHeight(3),
              ),
              Text(
                provider.workList[provider.position].description,
                style: TextStyle(
                  fontSize: dynamicTextSize(1.5),
                ),
              ),
              SizedBox(
                height: dynamicHeight(5),
              ),
              Row(
                children: [
                  SizedBox(
                    height: dynamicHeight(5),
                    width: dynamicWidth(30),
                    child: OutlinedButton(
                      onPressed: () async {
                        // await provider.launchUri(provider.workList[provider.position].link);
                      },
                      child: Text(
                        'View All Projects',
                        style: TextStyle(fontSize: dynamicHeight(1.2)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: dynamicWidth(3),
                  ),
                  SizedBox(
                    height: dynamicHeight(5),
                    width: dynamicWidth(30),
                    child: ElevatedButton(
                      onPressed: () async{
                        await provider.launchUri(provider.workList[provider.position].link);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return Constants.kPrimaryColor.withOpacity(0.5);
                          }
                          return Constants.kPrimaryColor;
                        }),
                      ),
                      child: Text(
                        'View Project',
                        style: TextStyle(color: Constants.kWhite,fontSize: dynamicHeight(1.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: dynamicHeight(5),),
        Container(
          width: SizeConfig.screenHeight/2,
          // height: SizeConfig.screenWidth,
          margin: EdgeInsets.all(dynamicPadding(2)),
          padding: EdgeInsets.all(dynamicPadding(2)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/round_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            fit: StackFit.loose,
            children: [
              Carousal(workList: provider.workList),
            ],
          ),
        ),
      ],
    );
  }
}

class WorkWidget extends StatelessWidget {
  final String workImage;
  final String workDescription;
  final String workLink;

  WorkWidget(
      {super.key,
      required this.workImage,
      required this.workDescription,
      required this.workLink});

  Future<void> _launchUrl() async {
    print("Work Link opened : $workLink");
    if (!await launchUrl(Uri.parse(workLink))) {
      throw Exception('Could not launch $workLink');
    }
  }

  List<Work> workList = [
    Work("BMI CALCULATOR", "BMI Calculator App", PortfolioConstants.kWorkBmi,
        AssetConstants.kWorkBmi, PortfolioConstants.kWorkBmiLink),
    Work(
        "BMI CALCULATOR 1",
        "BMI Calculator App 1",
        PortfolioConstants.kWorkBmi,
        AssetConstants.kWorkBmi,
        PortfolioConstants.kWorkBmiLink),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        // height: double.maxFinite,
        // width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: Colors.white70,
          image: DecorationImage(
            image: AssetImage("assets/images/round_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          fit: StackFit.loose,
          children: [
            Carousal(workList: workList),
          ],
        ),
      ),
    );
  }
}

Widget customButton(Function onPressed, IconData iconData) {
  return SizedBox(
    height: dynamicHeight(4),
    width: dynamicHeight(4),
    child: Card(
      color: Constants.kBackgroundDark2,
      elevation: 1,
      child: IconButton(
        onPressed: () {},
        icon: Icon(iconData),
      ),
    ),
  );
}

class Work {
  String name;
  String subtitle;
  String description;
  String image;
  String link;

  Work(this.name, this.subtitle, this.description, this.image, this.link);
}
