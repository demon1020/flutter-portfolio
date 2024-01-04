import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/core.dart';

class Carousal extends StatefulWidget {
  final List<Work> workList;
  Carousal({Key? key, required this.workList}) : super(key: key);

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(autoPlay: true,onPageChanged: (pos,reason){
          setState(() {
            provider.changeWork(pos);
          });
        }),
        items: widget.workList
            .map(
              (item) => Image.asset(
                item.image,
                fit: BoxFit.contain,
                width: double.maxFinite,
                height: double.infinity,
              ),
            )
            .toList(),
      ),
    );
  }
}
