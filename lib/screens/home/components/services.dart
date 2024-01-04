import 'package:portfolio/core.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(dynamicPadding(2)),
      padding: EdgeInsets.all(dynamicPadding(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Services",),
          SizedBox(height: dynamicHeight(5),),
          ResponsiveRowColumn(
            isPortrait: SizeConfig.isPortrait,
            children: [
              // TitleDivider(
              //   title: "SERVICES",
              //   isVerticle: true,
              // ),

              ServiceCard(title: PortfolioConstants.kServiceSmmTitle,description: PortfolioConstants.kServiceSmmDescription,),
              ServiceCard(title: PortfolioConstants.kServiceAppDevTitle,description: PortfolioConstants.kServiceAppDevDescription,),
              ServiceCard(title: PortfolioConstants.kServiceDesignerTitle,description: PortfolioConstants.kServiceDesignerDescription,),
            ],
          ),
        ],
      ),
    );
  }
}
