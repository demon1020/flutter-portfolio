import 'package:portfolio/core.dart';

class TitleDivider extends StatelessWidget {
  final String title;
  final bool isVerticle;

  const TitleDivider({
    super.key,
    required this.title,
    this.isVerticle = false,
  });

  TextStyle style({bool isHeader = false, fontSize = 30}) {
    return TextStyle(
      color: isHeader ? Constants.kPrimaryColor : Constants.kWhite,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isVerticle
        ? Container(
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Flexible(
            child: VerticalDivider(
              thickness: 1,
              color: Constants.kPrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: VerticalText(title, style(fontSize: 20)),
          ),
          Flexible(
            child: VerticalDivider(
              thickness: 1,
              color: Constants.kPrimaryColor,
            ),
          ),
        ],
      ),
    )
        : Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Flexible(
            child: Divider(
              thickness: 1,
              color: Constants.kPrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(title, style: style(fontSize: 40)),
          ),
          Flexible(
            child: Divider(
              thickness: 1,
              color: Constants.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
