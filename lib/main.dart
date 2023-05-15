import 'package:arte_ctt_app/src/screens/home/main_screen.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: MyHomePage()
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Manrope",
        colorScheme: theme.colorScheme.copyWith(
          primary: Styles.primaryColor,
          onPrimary: Styles.onPrimary,
          primaryContainer: Styles.containerNavButton,
          secondary: Styles.secondary,
        ),
      ),

      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        // ignore: missing_return
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case "/":
              return Home();
            case "/homePage":
              return Home();
            default:
              return Home();
          }
        });
      },
    );
  }
}
