import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screens/widget_tree.dart';
import 'AuthService/auth_service.dart';
import 'Settings/settings.dart';
import 'Screens/Home/item_description.dart';
import 'Screens/Home/CE_description.dart';
import 'Screens/Home/PC_Description.dart';
import 'Screens/Home/image_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: MainColors.primaryColor,
          scaffoldBackgroundColor: MainColors.primaryColor,
          canvasColor: MainColors.primaryColor),
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return ImageSlider();
        },
        child: SystemUI(),
      ),
      routes: {
        ItemDescription.routeName: (BuildContext context) => ItemDescription(),
        Description.dir: (BuildContext context) => Description(),
        PeopleDescription.rouName: (BuildContext context) => PeopleDescription(),
      },
    );
  }
}

class SystemUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: WidgetTree(
          authAction: AuthService(),
        ),
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: MainColors.primaryColor,
            systemNavigationBarIconBrightness: Brightness.dark));
  }
}
