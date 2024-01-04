import 'package:portfolio/core.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  TextStyle style({bool isHeader = false, fontSize}) {
    return TextStyle(
      color: isHeader ? Constants.kPrimaryColor : Constants.kWhite,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return ResponsiveRowColumn(
      isPortrait: SizeConfig.isPortrait,
      children: [
        Container(
          height: size.height / 2,
          margin: EdgeInsets.symmetric(horizontal: dynamicPadding(4)),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !SizeConfig.isPortrait
                    ? SizedBox.shrink()
                    : Container(
                        height: size.height,
                        width: dynamicWidth(100),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetConstants.kProfile),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                Row(
                  children: [
                    Text(
                      "Hey, I am ",
                      style: style(fontSize: dynamicTextSize(5)),
                    ),
                    Text(
                      "Baburam Nabik",
                      style:
                          style(isHeader: true, fontSize: dynamicTextSize(5)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "a ",
                      style: style(fontSize: dynamicTextSize(4)),
                    ),
                    Text(
                      "self-taught ",
                      style:
                          style(isHeader: true, fontSize: dynamicTextSize(4)),
                    ),
                    Text(
                      "software developer",
                      style: style(fontSize: dynamicTextSize(4)),
                    ),
                  ],
                ),
                Text(
                  "& designer",
                  style: style(fontSize: dynamicTextSize(4)),
                ),
                SizedBox(height: dynamicWidth(10)),
                Text(
                  "Stick around to see some of my work",
                  style: TextStyle(fontSize: dynamicTextSize(2)),
                ),
                SizedBox(height: dynamicWidth(5)),
                Container(
                  height: dynamicHeight(8),
                  width: dynamicWidth(50),
                  child: OutlinedButton(
                    onPressed: () => provider.scrollTo(1300),
                    child: Text(
                      'See My Work',
                      style: TextStyle(fontSize: dynamicTextSize(1.8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeConfig.isPortrait
            ? SizedBox.shrink()
            : Container(
                height: size.height,
                width: dynamicWidth(100),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetConstants.kProfile),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        // TitleDivider(
        //   title: "PROFILE",
        //   isVerticle: true,
        // )
      ],
    );
  }
}
