import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/blocs/users/forget_password/forget_password_view.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';
import 'package:loctroi_canlua_external/widgets/toast_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'export.dart';

import 'package:base_project/export.dart';

class SmsOTBPage extends StatefulWidget {
  final String sodienthoai, phoneInternational;
  final String? matkhau, hoten;
  final BDiaPhuongEntity? tinh, huyen, xa;
  final bool? isForgotPass;
  const SmsOTBPage({
    Key? key,
    required this.hoten,
    required this.matkhau,
    required this.huyen,
    required this.sodienthoai,
    required this.phoneInternational,
    required this.tinh,
    required this.xa,
    required this.isForgotPass,
  }) : super(key: key);

  @override
  State<SmsOTBPage> createState() => _SmsOTBPageState();
}

class _SmsOTBPageState extends State<SmsOTBPage> {
  SmsOTBBloc? _bloc;

  GlobalKey globalKey = GlobalKey();

  String currentText = "", verificationCodeSentId = "";

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SmsOTBBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  void _codeSent(BuildContext context) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCodeSentId, smsCode: currentText);

    auth.signInWithCredential(credential).then((value) {
      UserCredential user = value;
      if (widget.isForgotPass == true) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ForgetPasswordPage(
                  phonenumber: widget.sodienthoai,
                )));
      } else {
        _bloc?.add(SubmitSmsOTBEvent(
            sodienthoai: widget.sodienthoai,
            matkhau: widget.matkhau!,
            hoten: widget.hoten!,
            tinh: widget.tinh!,
            huyen: widget.huyen!,
            xa: widget.xa!));
      }
      Log.info("OTB SUCCESS", user.toString());
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        MySnackBar.showSnackBarError(globalKey, e.message ?? e.toString());
      } else {
        MySnackBar.showSnackBarError(
            globalKey, S.of(context).txt_err_sms_otb_invalid);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Log.info("_SmsOTBPageState",
        'phoneInternational:${widget.phoneInternational} phoneLocal:${widget.sodienthoai}');
    Future.microtask(() async {
      await auth
          .verifyPhoneNumber(
        phoneNumber: widget.phoneInternational,
        // phoneNumber: '+84336965217',
        verificationCompleted: (PhoneAuthCredential credential) {
          Log.debug("auth.verifyPhoneNumber", "verificationCompleted");
        },
        verificationFailed: (FirebaseAuthException e) {
          Log.debug("auth.verifyPhoneNumber", "verificationFailed");
        },
        codeSent: (String verificationId, int? resendToken) {
          Log.debug("auth.verifyPhoneNumber", "codeSent");
          verificationCodeSentId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Log.debug("auth.verifyPhoneNumber", "codeAutoRetrievalTimeout");
        },
      )
          .catchError((onError) {
        Log.debug("auth.verifyPhoneNumber", "onError");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<SmsOTBBloc>(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: UIColor.gray_bg_canlua_ext,
      appBar: AppBarWidget(title: S.of(context).txt_sms_otb),
      body: GestureDetector(
        onTap: () {},
        child: BlocListener<SmsOTBBloc, SmsOTBState>(
          listener: (context, state) {
            if (state.errMessage != null && state.errMessage!.isNotEmpty) {
              MySnackBar.showSnackBarError(globalKey, state.errMessage!);
            } else if (state.isSuccess != null && state.isSuccess == true) {
              ShowToastWidget(context)
                  .showToast(S.of(context).txt_register_success);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SplashScreenPage()),
                  (Route<dynamic> route) => false);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    CanLuaEXTAssets.imgBGSmsOTB,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(height: kdefaultPadding),
                Padding(
                  padding: const EdgeInsets.all(kdefaultPadding),
                  child: Text(
                    S.of(context).txt_sms_otp_desc,
                    style: UITextStyle.mulishMediumStyle(
                        fontSize: 15, color: UIColor.dark_text, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 42,
                          inactiveFillColor: UIColor.white,
                          fieldWidth: 42,
                          activeFillColor: UIColor.white,
                          selectedFillColor: UIColor.primary),
                      cursorColor: UIColor.white,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (txt) {
                        currentText = txt;
                      },
                      onChanged: (String value) {},
                    )),
                const SizedBox(
                  height: 14,
                ),
                PrimaryBtnCLExt(
                  label: widget.isForgotPass == true
                      ? S.of(context).txt_positive_label
                      : S.of(context).txt_register,
                  width: 200,
                  onClick: () {
                    _codeSent(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
