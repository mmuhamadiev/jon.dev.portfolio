import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itsolutions.team/app_theme.dart';
import 'package:itsolutions.team/presentation/pages/home/home_page.dart';
import 'package:itsolutions.team/presentation/routes/routes.dart';
import 'package:itsolutions.team/values/values.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  WebViewPlatform.instance = WebWebViewPlatform();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_TITLE,
      //theme: AppTheme.lightThemeData,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
