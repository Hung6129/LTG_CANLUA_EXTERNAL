
import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';

class CanluaExtApp extends StatelessWidget {
  const CanluaExtApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// init easy loading
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = UIColor.white
      ..backgroundColor = UIColor.primary
      ..indicatorColor = UIColor.white
      ..textColor = UIColor.white
      ..maskColor = Colors.blue.withOpacity(0.9)
      ..userInteractions = true
      ..dismissOnTap = true;
    return MaterialApp(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: UIColor.primary,
          primaryColor: UIColor.primary,
          secondaryHeaderColor: UIColor.secondary,
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(UIColor.white),
            fillColor: MaterialStateProperty.all(UIColor.primary),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: UITextStyle.mulishBoldStyle(fontSize: 16),
            alignLabelWithHint: true,
            floatingLabelStyle: UITextStyle.mulishBoldStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: UIColor.primary),
            hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                color: UIColor.gray, fontSize: 16),
            border: const OutlineInputBorder(),
          ),
          appBarTheme: const AppBarTheme(
            color: UIColor.primary,
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: UIColor.primary,
            ),
          )),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,

      // home: ScListPhieuCanPage(
      //     backFunc: () async {
      //       return true;
      //     },
      // navKey: GlobalKey()),
      // home: RpFilterPage(
      //     backFunc: () async {
      //       return true;
      //     },
      //     navKey: GlobalKey()),
      home: SplashScreenPage(),
    );
  }
}