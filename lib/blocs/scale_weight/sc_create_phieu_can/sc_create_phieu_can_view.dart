import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';
import 'package:loctroi_canlua_external/widgets/drop_down_lib_widget.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/text_filed_date_picker.dart';
import 'package:loctroi_canlua_external/widgets/textfield_canlua.dart';

import 'sc_create_phieu_can_bloc.dart';
import 'sc_create_phieu_can_event.dart';
import 'sc_create_phieu_can_state.dart';

// ignore: must_be_immutable
class ScCreatePhieuCanPage extends StatelessWidget {
  final TextEditingController ctrlKhuRuong = TextEditingController(),
      ctrlNgayCan = TextEditingController(),
      ctrlSoPhieu = TextEditingController(),
      ctrlGhiChu = TextEditingController();
  final GlobalKey globalKey = GlobalKey();
  ScCreatePhieuCanBloc? _bloc;
  ScCreatePhieuCanPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ScCreatePhieuCanBloc()
        ..add(InitEvent())
        ..add(GetTinhScCreatePhieuCanEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<ScCreatePhieuCanBloc>(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: globalKey,
        backgroundColor: UIColor.gray_bg_canlua_ext,
        appBar: AppBarWidget(title: S.of(context).txt_title_tao_bang_tinh),
        body: BlocListener<ScCreatePhieuCanBloc, ScCreatePhieuCanState>(
          listener: (context, state) {
            if (state.loadingStatus == BlocLoadingStatus.show) {
              EasyLoading.show(status: 'loading...');
            } else if (state.loadingStatus == BlocLoadingStatus.hide) {
              EasyLoading.dismiss();
            }
            if (state.errMessage != null && state.errMessage!.isNotEmpty) {
              MySnackBar.showSnackBarError(globalKey, state.errMessage!);
              if (state.errMessage == tokenExpiredErr) {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     splashRoute, (Route<dynamic> route) => false);
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashScreenPage()),
                    (Route<dynamic> route) => false);
              }
            }
            if (state.isSuccess == true) {
              Navigator.pop(context, true);
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                paddingDefaultLeftRight, 0, paddingDefaultLeftRight, 0),
            child: SingleChildScrollView(
              child: BlocBuilder<ScCreatePhieuCanBloc, ScCreatePhieuCanState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InputCanLuaWidget(
                          ctrl: ctrlKhuRuong,
                          hint: S.of(context).txt_khu_ruong,
                          label: S.of(context).txt_khu_ruong),
                      DialogDatePickerWidget(
                          ctrl: ctrlNgayCan,
                          hint: S.of(context).txt_ngay_can,
                          label: S.of(context).txt_ngay_can),
                      InputCanLuaWidget(
                          ctrl: ctrlSoPhieu,
                          hint: S.of(context).txt_so_phieu,
                          label: S.of(context).txt_so_phieu),
                      SizeBoxHeightWidget(
                        height: kdefaultPadding * 2,
                      ),
                      SizedBox(
                        height: 50,
                        child: DropDownLibWidget<BDiaPhuongEntity>(
                            label: S.of(context).txt_tinh,
                            lstData: state.lstTinh ?? [],
                            // hint: S.of(context).txt_ma_ghe,
                            onChange: _selectTinh,
                            selectedValue: state.tinhSelected,
                            itemAsString: (e) => e?.tenkhac ?? "",
                            onFind: null),
                      ),
                      SizeBoxHeightWidget(
                        height: kdefaultPadding * 2,
                      ),
                      SizedBox(
                        height: 50,
                        child: DropDownLibWidget<BDiaPhuongEntity>(
                            label: S.of(context).txt_huyen,
                            onChange: _selectHuyen,
                            lstData: state.lstHuyen ?? [],
                            selectedValue: state.huyenSelected,
                            itemAsString: (e) => e?.tenkhac ?? "",
                            onFind: null),
                      ),
                      SizeBoxHeightWidget(
                        height: kdefaultPadding * 2,
                      ),
                      SizedBox(
                        height: 50,
                        child: DropDownLibWidget<BDiaPhuongEntity>(
                            label: S.of(context).txt_xa,
                            lstData: state.lstXa ?? [],
                            
                            // hint: S.of(context).txt_ma_ghe,
                            onChange: _selectXa,
                            selectedValue: state.xaSelected,
                            itemAsString: (e) => e?.tenkhac ?? "",
                            onFind: null),
                      ),
                      InputCanLuaWidget(
                        ctrl: ctrlGhiChu,
                        hint: S.of(context).txt_ghi_chu,
                        label: S.of(context).txt_ghi_chu,
                        maxLine: 3,
                      ),
                      SizeBoxHeightWidget(),
                      SizeBoxHeightWidget(),
                      PrimaryBtnCLExt(
                        label: S.of(context).txt_tiep_theo,
                        width: 200,
                        onClick: () {
                          _createPhieuCan(context, state);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _selectTinh(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectTinhScCreatePhieuCanEvent(tinh: p1));
      _bloc?.add(GetHuyenScCreatePhieuCanEvent(idTinh: p1.madp!));
    }
  }

  _selectHuyen(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectHuyenScCreatePhieuCanEvent(huyen: p1));
      _bloc?.add(GetXaScCreatePhieuCanEvent(idHuyen: p1.madp!));
    }
  }

  _selectXa(BDiaPhuongEntity? p1) {
    if (p1 != null) {
      _bloc?.add(SelectXaScCreatePhieuCanEvent(xa: p1));
    }
  }

  _createPhieuCan(BuildContext context, ScCreatePhieuCanState state) {
    String khuRuong = ctrlKhuRuong.text,
        ngayCan = ctrlNgayCan.text,
        soPhieu = ctrlSoPhieu.text,
        ghiChu = ctrlGhiChu.text;
    if (khuRuong.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_ruong_empty);
    } else if (ngayCan.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_ngay_can_empty);
    } else if (soPhieu.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_so_phieu_empty);
    } else if (state.tinhSelected == null || state.tinhSelected?.madp == null) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_tinh_empty);
    } else if (state.huyenSelected == null ||
        state.huyenSelected?.madp == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_huyen_empty);
    } else if (state.xaSelected == null || state.xaSelected?.madp == null) {
      MySnackBar.showSnackBarError(globalKey, S.of(context).txt_err_xa_empty);
    } else {
      _bloc?.add(CreateCreatePhieuCanEvent(
          ghiChu: ghiChu,
          huyen: state.huyenSelected!,
          tinh: state.tinhSelected!,
          xa: state.xaSelected!,
          khuRuong: khuRuong,
          ngayCan: ngayCan,
          ngaycanstr: ngayCan.isNotEmpty
              ? DateTimeHelper.formatDateTime(ngayCan, DateFormats.dd_MM_YYYY)
              : "",
          soPhieu: soPhieu));
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const ScScaleWeightPage()),
    // );
  }
}
