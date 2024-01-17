import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/users/login/login_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart'; 
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/toast_widget.dart';

import 'forget_password_bloc.dart';
import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordPage extends StatefulWidget {
  final String phonenumber;

  const ForgetPasswordPage({Key? key, required this.phonenumber})
      : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey globalKey = GlobalKey();

  ForgetPasswordBloc? _bloc;

  final TextEditingController ctrlPass1 = TextEditingController(),
      ctrlPass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ForgetPasswordBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<ForgetPasswordBloc>(context);

    return BaseScaffold(
      globalKey: globalKey,
      appBar: AppBarWidget(title: S.of(context).txt_title_forgot_pass),
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state.loadingStatus == BlocLoadingStatus.show &&
              EasyLoading.isShow == false) {
            EasyLoading.show(status: 'loading...');
          } else if (state.loadingStatus == BlocLoadingStatus.hide) {
            EasyLoading.dismiss();
          }
          if (state.errMessage != null && state.errMessage!.isNotEmpty) {
            MySnackBar.showSnackBarError(globalKey, state.errMessage!);
          }
          if (state.isSuccess == true) {
            ShowToastWidget(context).showToast("Đổi mật khẩu thành công !!");
            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false);
          }
        },
        child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
          builder: (context, state) {
            return Padding(
              padding: paddingDefaultScreen,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(LocTroiAsset.logo),
                    ),
                    TextFormField(
                      controller: ctrlPass1,
                      obscureText: state.hidePassword1 ?? true,
                      keyboardType: TextInputType.text,
                      style: UITextStyle.mulishMediumStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: UIColor.gray_90),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 0, right: 10),
                        hintText: S.of(context).txt_password,
                        labelText: S.of(context).txt_password,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _showHidePass1();
                          },
                          child: Icon(
                            state.hidePassword1 == false
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
                            fontSize: 16, color: UIColor.secondary_dark),
                        alignLabelWithHint: true,
                        hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                            color: UIColor.secondary_dark),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlPass2,
                      obscureText: state.hidePassword2 ?? true,
                      keyboardType: TextInputType.text,
                      style: UITextStyle.mulishMediumStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: UIColor.gray_90),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 5, left: 0, right: 10),
                        hintText: S.of(context).txt_re_password,
                        labelText: S.of(context).txt_re_password,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: UIColor.gray_80),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _showHidePass2();
                          },
                          child: Icon(
                            state.hidePassword2 == false
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
                            fontSize: 16, color: UIColor.secondary_dark),
                        alignLabelWithHint: true,
                        hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                            color: UIColor.secondary_dark),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 42,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: PrimaryButton(
                          enabled:
                              state.loadingStatus != BlocLoadingStatus.show,
                          onPressed: () {
                            state.loadingStatus != BlocLoadingStatus.show
                                ? _submit(context)
                                : null;
                          },
                          borderRadius: 38,
                          widget: Text(
                            S.of(context).txt_positive_label,
                            style: UITextStyle.mulishMediumStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: UIColor.white),
                          ),
                        )),
                  ]),
            );
          },
        ),
      ),
    );
  }

  void _showHidePass2() {
    _bloc?.add(ShowPass2ForgetPasswordEvent());
  }

  void _showHidePass1() {
    _bloc?.add(ShowPass1ForgetPasswordEvent());
  }

  _submit(BuildContext context) {
    String pass1 = ctrlPass1.text, pass2 = ctrlPass2.text;
    if (pass1 != pass2) {
      ShowToastWidget(context).showToastErr("Mật khẩu không trùng nhau");
    } else {
      _bloc?.add(
          SubmitForgetPasswordEvent(phone: widget.phonenumber, pass: pass1));
    }
  }
}
