// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:flutter/services.dart';
import 'package:loctroi_canlua_external/blocs/home/home_view.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_state.dart';
import 'package:loctroi_canlua_external/blocs/users/login/login_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'splash_screen_bloc.dart';
import 'splash_screen_event.dart';

// ignore: must_be_immutable
class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key);
  SplashScreenBloc? bloc;
  IBLoginRepository loginRepository = di.sl();
  IBCustomerRepository customerRepository = di.sl();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashScreenBloc()
        ..add(InitSplashScreenEvent())
        ..add(LoadDataSplashScreenEvent())
        ..add(SyncDataSplashScreenEvent(context: context)),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<SplashScreenBloc>(context);
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state.redirect == SplashScreenRedirect.home) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false);

          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     RouteGenerater.homeRoute, (Route<dynamic> route) => false);
        } else if (state.redirect == SplashScreenRedirect.login) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false);
        }
      },
      child: Container(
        color: UIColor.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_spash_screen.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  LocTroiAsset.logoSVGNoBG,
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).txt_logan,
                  style: UITextStyle.sfProDisplayStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: UIColor.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
