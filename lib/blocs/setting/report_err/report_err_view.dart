// ignore_for_file: implementation_imports
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:base_project/export.dart' as b;

import 'report_err_bloc.dart';
import 'report_err_event.dart';
import 'report_err_state.dart';

// ignore: must_be_immutable
class ReportErrPage extends StatelessWidget {
  ValueNotifier<int> textLenght = ValueNotifier<int>(0);
  ReportErrPage({Key? key}) : super(key: key);
  TextEditingController ctrl = TextEditingController();
  ReportErrBloc? bloc;
  GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReportErrBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<ReportErrBloc>(context);

    return Scaffold(
      key: globalKey,
      appBar: AppBarWidget(title: S.of(context).txt_setting),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocListener<ReportErrBloc, ReportErrState>(
          listener: (context, state) {
            if (state.loadingStatus == b.BlocLoadingStatus.show) {
              EasyLoading.show(status: 'loading...');
            } else if (state.loadingStatus == b.BlocLoadingStatus.hide) {
              EasyLoading.dismiss();
            }
            if (state.errMessage != null && state.errMessage!.isNotEmpty) {
              b.MySnackBar.showSnackBarError(globalKey, state.errMessage!);
              if (state.errMessage == tokenExpiredErr) {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashScreenPage()),
                    (Route<dynamic> route) => false);
              }
            }
            if (state.isSendSuccess == true) {
              ShowToastWidget(context)
                  .showToast(S.of(context).txt_report_success);
              Navigator.pop(context);
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(paddingDefaultLeftRight,
                paddingDefaultTop, paddingDefaultLeftRight, paddingDefaultTop),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    S.of(context).txt_report_err_desc,
                    style: UITextStyle.mulishMediumStyle(),
                  ),
                  SizeBoxHeightWidget(),
                  TextFormField(
                    minLines: 9,
                    maxLines: 9,
                    controller: ctrl,
                    onChanged: onChangeText,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderDefault),
                          borderSide: const BorderSide(width: 1),
                        )),
                  ),
                  SizeBoxHeightWidget(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).txt_report_err_desc1,
                          style: UITextStyle.mulishMediumStyle(
                              fontSize: 12, color: UIColor.dark_text),
                        ),
                      ),
                      ValueListenableBuilder<int>(
                          valueListenable: textLenght,
                          builder: (BuildContext context, int counterValue,
                              Widget? child) {
                            return Text(
                              "${textLenght.value}/300",
                              style: UITextStyle.mulishMediumStyle(
                                  fontSize: 12, color: UIColor.dark_text),
                            );
                          })
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: paddingDefaultTop),
                    child: SizedBox(
                      width: 148,
                      child: PrimaryButton(
                        onPressed: () {
                          _sendReport(ctrl.text, context);
                        },
                        title: S.of(context).txt_send_report.toUpperCase(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onChangeText(String value) {
    textLenght.value = value.length;
  }

  void _sendReport(String text, BuildContext context) {
    if (text.length > 300) {
      ShowToastWidget(context).showToastErr("Vuợt quá 300 ký tự !!");
    } else {
      bloc?.add(SendReportErrEvent(content: text));
    }
  }
}
