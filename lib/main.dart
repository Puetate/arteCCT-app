import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/screens/home/main_screen.dart';
import 'package:arte_ctt_app/src/screens/picture_info/picture_info.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => RadioProvider(),
    child: const MyApp(),
  ));
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
        return MaterialPageRoute(
            builder: (BuildContext context) {
              switch (settings.name) {
                case "/":
                  return const Home();
                case "/homePage":
                  return const Home();
                case "/picture_info":
                  return const PictureInfoScreen();
                default:
                  return const Home();
              }
            },
            settings: settings);
      },
    );
  }
}
