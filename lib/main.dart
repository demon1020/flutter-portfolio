import 'package:device_preview/device_preview.dart';
import 'core.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
        ], child: MyApp()),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context,orientation){
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: Constants.kAppName,
              debugShowCheckedModeBanner: false,
              theme: darkThemeData(context),
              darkTheme: darkThemeData(context),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
