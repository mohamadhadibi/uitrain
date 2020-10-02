import 'package:flutter/material.dart';
import 'package:uitrain/challenges/bedroom/bedroom_page.dart';
import 'utils/routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ui Challenge',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  BedroomPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case rout_menu:
            return MaterialPageRoute(
              builder: (BuildContext context) => BedroomPage(),
            );
            break;

          /*case rout_concert:
            return MaterialPageRoute(
              builder: (BuildContext context) => ConcertPage(),
            );
            break;*/

          case rout_bedroom:
            return MaterialPageRoute(
              builder: (BuildContext context) => BedroomPage(),
            );
            break;

          default:
            return _getDefault(context);
            break;
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return _getDefault(context);
      },
    );
  }


  MaterialPageRoute _getDefault(context) {
    return MaterialPageRoute(
      builder: (BuildContext context) => BedroomPage(),
    );
  }
}
