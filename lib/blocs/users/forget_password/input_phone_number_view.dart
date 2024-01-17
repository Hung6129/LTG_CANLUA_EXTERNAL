import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loctroi_canlua_external/blocs/users/sms_otb/sms_otb_view.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/loctroi_helper.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';

class InputPhonenumberView extends StatefulWidget {
  const InputPhonenumberView({Key? key}) : super(key: key);

  @override
  State<InputPhonenumberView> createState() => _InputPhonenumberViewState();
}

class _InputPhonenumberViewState extends State<InputPhonenumberView> {
  final TextEditingController ctrlSdt = TextEditingController();

  final GlobalKey globalKey = GlobalKey();

  String numberPhone = '';

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      globalKey: globalKey,
      appBar: AppBarWidget(title: S.of(context).txt_title_forgot_pass),
      body: SingleChildScrollView(
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
                S.of(context).txt_send_otb_decs,
                style: UITextStyle.mulishMediumStyle(
                    fontSize: 15, color: UIColor.dark_text, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(kdefaultPadding * 3, 0,
                  kdefaultPadding * 3, kdefaultPadding * 2),
              child: Column(
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: UIColor.gray_80, width: 0.5)),
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
            ),
            PrimaryBtnCLExt(
              label: S.of(context).txt_send_otb,
              width: 200,
              onClick: () {
                _navToSMSOTB(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navToSMSOTB(BuildContext context) {
    String sdt = ctrlSdt.text;
    if (sdt.length > 8 && sdt.length < 11) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SmsOTBPage(
                  hoten: null,
                  huyen: null,
                  matkhau: null,
                  sodienthoai: converLocalPhone(sdt, numberPhone),
                  phoneInternational: converInternalPhone(sdt, numberPhone),
                  isForgotPass: true,
                  tinh: null,
                  xa: null,
                )),
      );
    } else {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_sdt_empty);
    }
  }
}
