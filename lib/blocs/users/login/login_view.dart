// ignore_for_file: implementation_imports

import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/blocs/users/forget_password/input_phone_number_view.dart';
import 'package:loctroi_canlua_external/blocs/users/register/register_view.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:flutter/services.dart';

import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey globalKey = GlobalKey();
  LoginBloc? _bloc;
  final TextEditingController userCtrl = TextEditingController(),
      passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc()..add(InitLoginEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  _showHidePass() {
    _bloc?.add(ShowHidePassLoginEvent());
  }

  _submitLogin() {
    _bloc?.add(SubmitLoginEvent(userCtrl.text, passCtrl.text));
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //     (Route<dynamic> route) => false);
  }

  _forgetPass() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const InputPhonenumberView()));
  }

  void _onNavRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: UIColor.gray,
    ));
    return Scaffold(
      backgroundColor: UIColor.gray_bg_canlua_ext,
      key: globalKey,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.errMessage != null && state.errMessage!.isNotEmpty) {
            MySnackBar.showSnackBarError(globalKey, state.errMessage!);
          } else if (state.isSuccess != null && state.isSuccess == true) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SplashScreenPage()),
                (Route<dynamic> route) => false);
          }
          if (state.password != null && state.username != null) {
            if (state.password!.isNotEmpty && state.username!.isNotEmpty) {
              passCtrl.text = state.password!;
              userCtrl.text = state.username!;
            }
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(kdefaultPadding),
            decoration: const BoxDecoration(
                // color: Colors.white,
                ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.fromLTRB(
                    kdefaultPadding, 0, kdefaultPadding, 0),
                child: Form(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(kScreenPadding),
                          child: Text(
                            S.of(context).text_welcome_login,
                            style: UITextStyle.interMediumStyle(
                                color: UIColor.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset(LocTroiAsset.logo),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormFieldWidget(
                            ctrl: userCtrl,
                            hintLabel: S.of(context).txt_account_phonenumber,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return TextFormField(
                              controller: passCtrl,
                              obscureText: state.hidePassword ?? true,
                              keyboardType: TextInputType.text,
                              style: UITextStyle.mulishMediumStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: UIColor.gray_90),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 5, left: 0, right: 10),
                                hintText: S.of(context).txt_password,
                                labelText: S.of(context).txt_password,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UIColor.gray_80),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UIColor.gray_80),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UIColor.gray_80),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _showHidePass();
                                  },
                                  child: Icon(
                                    state.hidePassword == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: UIColor.gray,
                                  ),
                                ),
                                floatingLabelStyle: UITextStyle.mulishBoldStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: UIColor.primary),
                                labelStyle: UITextStyle.mulishBoldStyle(
                                    fontSize: 16,
                                    color: UIColor.secondary_dark),
                                alignLabelWithHint: true,
                                hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                                    color: UIColor.secondary_dark),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: UITextStyle.robotoMediumSmallStyle(
                                    fontSize: 14,
                                    color: UIColor.blue_hyperlink),
                              ),
                              onPressed: _onNavRegister,
                              child: Text(S.of(context).txt_register),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: UITextStyle.robotoMediumSmallStyle(
                                    fontSize: 14,
                                    color: UIColor.blue_hyperlink),
                              ),
                              onPressed: _forgetPass,
                              child: Text(S.of(context).txt_forget_pass),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                            height: 42,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return PrimaryButton(
                                  enabled: state.loadingStatus !=
                                      BlocLoadingStatus.show,
                                  onPressed: () {
                                    state.loadingStatus !=
                                            BlocLoadingStatus.show
                                        ? _submitLogin()
                                        : null;
                                  },
                                  borderRadius: 38,
                                  widget: Text(
                                    S.of(context).btn_login,
                                    style: UITextStyle.mulishMediumStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: UIColor.white),
                                  ),
                                );
                              },
                            )),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
