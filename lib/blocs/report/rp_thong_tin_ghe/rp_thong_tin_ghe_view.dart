import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';

import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/text_filed_date_picker.dart';
import 'package:loctroi_canlua_external/widgets/textfield_canlua.dart';

import 'rp_thong_tin_ghe_bloc.dart';
import 'rp_thong_tin_ghe_event.dart';
import 'rp_thong_tin_ghe_state.dart';

class RpThongTinGhePage extends StatefulWidget {
  final SoPhieuFilterModel soPhieu;

  const RpThongTinGhePage({Key? key, required this.soPhieu}) : super(key: key);

  @override
  State<RpThongTinGhePage> createState() => _RpThongTinGhePageState();
}

class _RpThongTinGhePageState extends State<RpThongTinGhePage> {
  RpThongTinGheBloc? bloc;
  final TextEditingController ctrlSoPhuongTien = TextEditingController(),
      ctrlTenChuGhe = TextEditingController(),
      ctrlDtChuGhe = TextEditingController(),
      ctrlCMND = TextEditingController(),
      ctrlNgayCap = TextEditingController(),
      ctrlNoiCap = TextEditingController();
  final globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    if (widget.soPhieu.sophuongtien != null) {
      ctrlSoPhuongTien.text = widget.soPhieu.sophuongtien!;
    }
    if (widget.soPhieu.tenchughe != null) {
      ctrlTenChuGhe.text = widget.soPhieu.tenchughe!;
    }
    if (widget.soPhieu.dienthoaichughe != null) {
      ctrlDtChuGhe.text = widget.soPhieu.dienthoaichughe!;
    }
    if (widget.soPhieu.cmnd != null) {
      ctrlCMND.text = widget.soPhieu.cmnd!;
    }
    if (widget.soPhieu.noicap != null) {
      ctrlNoiCap.text = widget.soPhieu.noicap!;
    }

    if (widget.soPhieu.ngaycap != null) {
      ctrlNgayCap.text = widget.soPhieu.ngaycap != null
          ? DateTimeHelper.formatDateTime(
              widget.soPhieu.ngaycap!, DateFormats.YEAR_MONTH_DAY)
          : "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RpThongTinGheBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<RpThongTinGheBloc>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: globalKey,
        backgroundColor: UIColor.gray_bg_canlua_ext,
        appBar: AppBarWidget(title: S.of(context).txt_thong_tin_phieu_can),
        body: BlocListener<RpThongTinGheBloc, RpThongTinGheState>(
          listener: (context, state) {
            if (state.loadingStatus == BlocLoadingStatus.show &&
                EasyLoading.isShow == false) {
              EasyLoading.show(status: 'loading...');
            } else if (state.loadingStatus == BlocLoadingStatus.hide) {
              EasyLoading.dismiss();
            }
            if (state.errMessage != null && state.errMessage!.isNotEmpty) {
              MySnackBar.showSnackBarError(globalKey, state.errMessage!);
              if (state.errMessage == tokenExpiredErr) {
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
            padding: const EdgeInsets.all(paddingDefaultLeftRight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputCanLuaWidget(
                      ctrl: ctrlSoPhuongTien,
                      hint: S.of(context).txt_so_phuong_tien,
                      label: S.of(context).txt_so_phuong_tien),
                  InputCanLuaWidget(
                      ctrl: ctrlTenChuGhe,
                      hint: S.of(context).txt_input_ten_chu_ghe,
                      label: S.of(context).txt_ten_chu_ghe),
                  InputCanLuaWidget(
                      ctrl: ctrlDtChuGhe,
                      inputType: TextInputType.phone,
                      hint: S.of(context).txt_input_dt_chu_ghe,
                      label: S.of(context).txt_dt_chu_ghe),
                  InputCanLuaWidget(
                      ctrl: ctrlCMND,
                      inputType: TextInputType.number,
                      hint: S.of(context).txt_input_cmnd,
                      label: S.of(context).txt_cmnd),
                  DialogDatePickerWidget(
                      ctrl: ctrlNgayCap,
                      hint: S.of(context).txt_ngay_cap,
                      label: S.of(context).txt_ngay_cap),
                  InputCanLuaWidget(
                      ctrl: ctrlNoiCap,
                      hint: S.of(context).txt_input_noi_cap,
                      label: S.of(context).txt_noi_cap),
                  SizeBoxHeightWidget(),
                  SizeBoxHeightWidget(),
                  PrimaryBtnCLExt(
                    label: S.of(context).txt_save,
                    width: 200,
                    onClick: () {
                      // _codeSent(context);
                      _saveGhe();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveGhe() {
    String sophuongtien = ctrlSoPhuongTien.text,
        tenchughe = ctrlTenChuGhe.text,
        dienthoaichughe = ctrlDtChuGhe.text,
        cmnd = ctrlCMND.text,
        noicap = ctrlNoiCap.text,
        ngaycap = ctrlNgayCap.text;
    if (sophuongtien.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_so_phuong_tien_empty);
    } else if (tenchughe.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_ten_chu_ghe_empty);
    } else if (dienthoaichughe.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_dt_chu_ghe_empty);
    } else {
      if (ngaycap.isNotEmpty) {
        widget.soPhieu.ngaycapstr =
            DateTimeHelper.formatDateTime(ngaycap, DateFormats.dd_MM_YYYY);
        widget.soPhieu.ngaycap = ngaycap ;
      }
      if (cmnd.isNotEmpty) {
        widget.soPhieu.cmnd = cmnd;
      }
      if (noicap.isNotEmpty) {
        widget.soPhieu.noicap = noicap;
      }
      widget.soPhieu.sophuongtien = sophuongtien;
      widget.soPhieu.tenchughe = tenchughe;
      widget.soPhieu.dienthoaichughe = dienthoaichughe;
      bloc?.add(UpdateRpThongTinGheEvent(sophieu: widget.soPhieu));
    }
  }
}
