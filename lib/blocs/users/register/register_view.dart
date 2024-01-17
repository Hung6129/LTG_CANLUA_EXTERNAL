import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loctroi_canlua_external/blocs/users/sms_otb/sms_otb_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/constants/loctroi_helper.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';
import 'package:loctroi_canlua_external/widgets/drop_down_lib_widget.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/textfield_canlua.dart';

import 'register_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final TextEditingController ctrlSdt = TextEditingController(),
      ctrlPass = TextEditingController(),
      ctrlRePass = TextEditingController(),
      ctrlHoTen = TextEditingController();
  // ctrlTinh = TextEditingController(),
  // ctrlHuyen = TextEditingController(),
  // ctrlXa = TextEditingController();
  RegisterBloc? _bloc;
  String? numberPhone;
  GlobalKey globalKey = GlobalKey();
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterBloc()
        ..add(InitEvent())
        ..add(GetTinhRegisterEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: UIColor.gray_bg_canlua_ext,
      appBar: AppBarWidget(title: S.of(context).txt_register),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.loadingStatus == BlocLoadingStatus.show) {
              EasyLoading.show(status: 'loading...');
            } else if (state.loadingStatus != BlocLoadingStatus.show) {
              EasyLoading.dismiss();
            }
            if (state.errMessage != null && state.errMessage!.isNotEmpty) {
              MySnackBar.showSnackBarError(globalKey, state.errMessage!);
              // if (state.errMessage == tokenExpiredErr) {
              //   Navigator.of(context).pushNamedAndRemoveUntil(
              //       splashRoute, (Route<dynamic> route) => false);
              // }
            }
          },
          child: Padding(
            padding: paddingDefaultScreen,
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).txt_phonenumber,
                                style: UITextStyle.mulishBoldStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                    color: UIColor.secondary_dark),
                              ),
                              IntlPhoneField(
                                autovalidateMode: AutovalidateMode.disabled,
                                disableLengthCheck: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: UIColor.gray_80, width: 0.5)),
                                ),
                                initialCountryCode: 'VN',
                                controller: ctrlSdt,
                                onChanged: (phone) {
                                  // print(phone.completeNumber);
                                  numberPhone = phone.completeNumber;
                                },
                              ),
                            ],
                          ),
                          // InputCanLuaTypeUserWidget(
                          //   ctrl: ctrlSdt,
                          //   inputType: TextInputType.phone,
                          //   hint: S.of(context).txt_phonenumber,
                          //   label: S.of(context).txt_input_phonenumber,
                          //   inputAction: TextInputAction.next,
                          // ),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          InputCanLuaTypeUserWidget(
                            ctrl: ctrlPass,
                            configPass: ConfigEditextPassword(
                              isShowPassword: state.hidePassword == false,
                              suffixIconShowPassClick: () {
                                _bloc?.add(ShowHidePassRegisterEvent());
                              },
                            ),
                            hint: "* * * * * * * * ",
                            label: S.of(context).txt_password,
                            inputType: TextInputType.visiblePassword,
                            inputAction: TextInputAction.next,
                          ),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          InputCanLuaTypeUserWidget(
                            ctrl: ctrlRePass,
                            inputType: TextInputType.visiblePassword,
                            configPass: ConfigEditextPassword(
                                isShowPassword: state.hideRePassword == false,
                                suffixIconShowPassClick: () {
                                  _bloc?.add(ShowHideRePassRegisterEvent());
                                }),
                            hint: "* * * * * * * * ",
                            label: S.of(context).txt_re_password,
                            inputAction: TextInputAction.next,
                          ),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          InputCanLuaTypeUserWidget(
                            ctrl: ctrlHoTen,
                            hint: S.of(context).txt_input_ho_ten,
                            inputAction: TextInputAction.done,
                            label: S.of(context).txt_ho_ten,
                          ),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          DropDownLibUserTypeWidget<BDiaPhuongEntity>(
                            lstData: state.lstTinh ?? [],
                            // hint: S.of(context).txt_ma_ghe,
                            onChange: _selectTinh,
                            selectedValue: state.tinhSelected,
                            label: S.of(context).txt_tinh,
                            itemAsString: (e) => e?.tenkhac ?? "",
                            onFind: null,
                          ),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          DropDownLibUserTypeWidget<BDiaPhuongEntity>(
                              lstData: state.lstHuyen ?? [],
                              // hint: S.of(context).txt_ma_ghe,
                              onChange: _selectHuyen,
                              selectedValue: state.huyenSelected,
                              label: S.of(context).txt_huyen,
                              itemAsString: (e) => e?.tenkhac ?? "",
                              onFind: null),
                          SizeBoxHeightWidget(),
                          SizeBoxHeightWidget(),
                          DropDownLibUserTypeWidget<BDiaPhuongEntity>(
                              lstData: state.lstXa ?? [],
                              // hint: S.of(context).txt_ma_ghe,
                              onChange: _selectXa,
                              selectedValue: state.xaSelected,
                              label: S.of(context).txt_xa,
                              itemAsString: (e) => e?.tenkhac ?? "",
                              onFind: null),
                        ]),
                      );
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(paddingDefaultLeftRight),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return PrimaryBtnCLExt(
                            label: S.of(context).txt_tiep_theo,
                            onClick: () {
                              _navSmsOTB(context, state);
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navSmsOTB(BuildContext context, RegisterState state) {
    String pass = ctrlPass.text,
        rePass = ctrlRePass.text,
        hoten = ctrlHoTen.text,
        sdt = ctrlSdt.text;

    // if (sdt.isEmpty || sdt.length < 8) {
    if (numberPhone == null ||
        numberPhone?.isEmpty == true ||
        numberPhone!.length < 8) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_sdt_empty);
    } else if (pass.isEmpty || rePass.isEmpty) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_pass_empty);
    } else if (pass != rePass) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_repass_wrong);
    } else if (hoten.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_hoten_empty);
    } else if (state.tinhSelected == null || state.tinhSelected?.madp == null) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_tinh_empty);
    } else if (state.huyenSelected == null ||
        state.huyenSelected?.madp == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_huyen_empty);
    } else if (state.xaSelected == null || state.xaSelected?.madp == null) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_xa_empty);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SmsOTBPage(
                  hoten: hoten,
                  huyen: state.huyenSelected!,
                  matkhau: pass,
                  sodienthoai: converLocalPhone(sdt, numberPhone!),
                  phoneInternational: converInternalPhone(sdt, numberPhone!),
                  isForgotPass: false,
                  tinh: state.tinhSelected!,
                  xa: state.xaSelected!,
                )),
      );
    }
  }

  _selectTinh(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectTinhRegisterEvent(tinh: p1));
      _bloc?.add(GetHuyenRegisterEvent(idTinh: p1.madp!));
    }
  }

  _selectHuyen(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectHuyenRegisterEvent(huyen: p1));
      _bloc?.add(GetXaRegisterEvent(idHuyen: p1.madp!));
    }
  }

  _selectXa(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectXaRegisterEvent(xa: p1));
    }
  }
}
