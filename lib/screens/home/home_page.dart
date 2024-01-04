import 'package:portfolio/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.scrollController = ScrollController();
    provider.scrollController.addListener(() {
      setState(() {
        isVisible = provider.scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  TextStyle style() {
    return TextStyle(color: Colors.white, fontSize: 20);
  }

  Widget action({Function()? onTap, title}) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.all(dynamicPadding(2)),
        padding: EdgeInsets.all(dynamicPadding(2)),
        child: TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style:
                TextStyle(color: Colors.white, fontSize: dynamicTextSize(1.5)),
          ),
        ),
      ),
    );
  }

  List<Widget> actionsWidgets() {
    final provider = Provider.of<HomeProvider>(context);
    return [
      action(
          title: "Profile", onTap: () => provider.scrollTo(dynamicHeight(0))),
      action(
          title: "Services", onTap: () => provider.scrollTo(dynamicHeight(50))),
      action(title: "Work", onTap: () => provider.scrollTo(dynamicHeight(90))),
      action(
          title: "About", onTap: () => provider.scrollTo(dynamicHeight(145))),
      action(
          title: "Contact", onTap: () => provider.scrollTo(dynamicHeight(190))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    SizeConfig.printValues();
    return SafeArea(
      child: Scaffold(
        appBar: isVisible
            ? SlidingAppBar(
                controller: _controller,
                visible: isVisible,
                child: AppBar(
                  title: FittedBox(
                    child: Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  toolbarHeight: 100,
                  actions: SizeConfig.isPortrait ? [] : actionsWidgets(),
                ),
              )
            : null,
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: dynamicPadding(SizeConfig.isPortrait ? 0.5 : 4)),
          child: ListView(
            controller: provider.scrollController,
            // reverse: true,
            children: [
              Profile(),
              // TitleDivider(title: 'Services'),
              Services(),
              // TitleDivider(title: 'Work'),
              WorkSection(),
              // TitleDivider(title: 'About'),
              About(),
              // TitleDivider(title: 'Contact'),
              Contact(),
            ],
          ),
        ),
      ),
    );
  }
}
