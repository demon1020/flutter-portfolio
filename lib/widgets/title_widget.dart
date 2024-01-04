import 'package:portfolio/core.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool isTitle;
  const TitleWidget({
    super.key, required this.title, this.isTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          SizedBox(
            width: isTitle ? dynamicWidth(10) : dynamicWidth(5),
            child: Divider(
              thickness: 3,
              color: Constants.kPrimaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: dynamicPadding(1)),
            child: Text(
              title,
              style: TextStyle(
                fontSize: isTitle ? dynamicTextSize(1.8) : dynamicTextSize(1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
