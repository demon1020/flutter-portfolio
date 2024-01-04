import 'package:portfolio/core.dart';

class VerticalText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const VerticalText(this.text, this.style);

  @override
  Widget build(BuildContext context) {
    return Wrap(crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 10,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text.split("").map((string) => Text(string, style: style)).toList(),
    );
  }
}