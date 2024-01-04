import 'package:portfolio/core.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;

  const ServiceCard({Key? key, required this.title, required this.description})
      : super(key: key);

  TextStyle style({bool isHeader = false, fontSize}) {
    return TextStyle(
      color: isHeader ? Constants.kPrimaryColor : Constants.kWhite,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(40),
      width: dynamicHeight(40),
      margin: EdgeInsets.all(dynamicPadding(2)),
      padding: EdgeInsets.all(dynamicPadding(2)),
      decoration: BoxDecoration(
        color: Constants.kBackgroundDark2.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: style(isHeader: true, fontSize: dynamicTextSize(3)),
              textAlign: TextAlign.center),
          SizedBox(
            height: dynamicHeight(3),
          ),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: style(fontSize: dynamicTextSize(2)),
          ),
        ],
      ),
    );
  }
}
