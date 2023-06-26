import 'package:arte_ctt_app/src/domain/api/casa_cultura_tungurahua_api.dart';
import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/screens/home/main_screen.dart';
import 'package:arte_ctt_app/src/screens/picture_info/picture_info.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Api.configureDio();
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
        switch (settings.name) {
          case "/":
            return PageTransition(
              child: const Home(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 700),
              settings: settings,
            );
          case "/homePage":
            return PageTransition(
              child: const Home(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 700),
              settings: settings,
            );
          case "/picture_info":
            return PageTransition(
              child: const PictureInfoScreen(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 1000),
              settings: settings,
            );
          default:
            return PageTransition(
              child: const Home(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 700),
              settings: settings,
            );
        }
      },
    );
  }
}
