import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/button_canlua_ext.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/text_filed_date_picker.dart';
import 'package:loctroi_canlua_external/widgets/textfield_canlua.dart';

import 'rp_thong_tin_phieu_can_bloc.dart';
import 'rp_thong_tin_phieu_can_event.dart';
import 'rp_thong_tin_phieu_can_state.dart';

class RpThongTinPhieuCanPage extends StatefulWidget {
  final SoPhieuFilterModel soPhieu;

  const RpThongTinPhieuCanPage({Key? key, required this.soPhieu})
      : super(key: key);

  @override
  State<RpThongTinPhieuCanPage> createState() => _RpThongTinPhieuCanPageState();
}

class _RpThongTinPhieuCanPageState extends State<RpThongTinPhieuCanPage> {
  final TextEditingController ctrlKhuRuong = TextEditingController(),
      ctrlNgayCan = TextEditingController(),
      ctrlGiong = TextEditingController(),
      ctrlTieuChuan = TextEditingController(),
      ctrlDonGiaLua = TextEditingController(),
      // ctrlDonGiaThuongDuLuong = TextEditingController(),
      ctrlDienTich = TextEditingController(),
      // ctrlSanLuongCan = TextEditingController(),
      // ctrlSoBao = TextEditingController(),
      ctrlKhoiLuongTruBao = TextEditingController(),
      ctrlKhoiLuongTruTapChat = TextEditingController();
  // ctrlTongKhoiLuong = TextEditingController(),
  // ctrlThanhTien = TextEditingController();
  RpThongTinPhieuCanBloc? bloc;
  final globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    if (widget.soPhieu.tenkhuruong != null) {
      ctrlKhuRuong.text = widget.soPhieu.tenkhuruong!;
    }
    if (widget.soPhieu.ngaycan != null) {
      ctrlNgayCan.text = widget.soPhieu.ngaycan != null
          ? DateTimeHelper.formatDateTime(
              widget.soPhieu.ngaycan!, DateFormats.YEAR_MONTH_DAY)
          : "";
    }
    if (widget.soPhieu.tengiong != null) {
      ctrlGiong.text = widget.soPhieu.tengiong!;
    }
    if (widget.soPhieu.tieuchuan != null) {
      ctrlTieuChuan.text = widget.soPhieu.tieuchuan!;
    }
    if (widget.soPhieu.giachot != null) {
      ctrlDonGiaLua.text =
          widget.soPhieu.giachot != null ? '${widget.soPhieu.giachot!}' : "";
    }
    if (widget.soPhieu.dientichchot != null) {
      ctrlDienTich.text = widget.soPhieu.giachot != null
          ? '${widget.soPhieu.dientichchot!}'
          : "0";
    }
    if (widget.soPhieu.tongkhoiluong_tru_bao != null) {
      ctrlKhoiLuongTruBao.text = widget.soPhieu.giachot != null
          ? '${widget.soPhieu.tongkhoiluong_tru_bao!}'
          : "0";
    }
    if (widget.soPhieu.tongkhoiluong_tru_tapchat != null) {
      ctrlKhoiLuongTruTapChat.text = widget.soPhieu.giachot != null
          ? '${widget.soPhieu.tongkhoiluong_tru_tapchat!}'
          : "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RpThongTinPhieuCanBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<RpThongTinPhieuCanBloc>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: globalKey,
        backgroundColor: UIColor.gray_bg_canlua_ext,
        appBar: AppBarWidget(title: S.of(context).txt_thong_tin_phieu_can),
        body: BlocListener<RpThongTinPhieuCanBloc, RpThongTinPhieuCanState>(
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
                      ctrl: ctrlKhuRuong,
                      hint: S.of(context).txt_khu_ruong,
                      label: S.of(context).txt_khu_ruong),
                  DialogDatePickerWidget(
                      ctrl: ctrlNgayCan,
                      hint: S.of(context).txt_ngay_can,
                      label: S.of(context).txt_ngay_can),
                  InputCanLuaWidget(
                      ctrl: ctrlGiong,
                      hint: S.of(context).txt_input_giong,
                      label: S.of(context).txt_giong),
                  InputCanLuaWidget(
                      ctrl: ctrlTieuChuan,
                      hint: S.of(context).txt_input_tieu_chuan,
                      label: S.of(context).txt_tieu_chuan),
                  InputCanLuaWidget(
                      ctrl: ctrlDonGiaLua,
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isDotDecimal: true,
                      hint: S.of(context).txt_don_gia_lua,
                      label: S.of(context).txt_don_gia_lua),
                  // InputCanLuaWidget(
                  //     ctrl: ctrlDonGiaThuongDuLuong,
                  //     inputType:
                  //         const TextInputType.numberWithOptions(decimal: true),
                  //     isDotDecimal: true,
                  //     hint: S.of(context).txt_don_gia_thuong_du_luong,
                  //     label: S.of(context).txt_don_gia_thuong_du_luong),
                  InputCanLuaWidget(
                      ctrl: ctrlDienTich,
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isDotDecimal: true,
                      unit: "ha",
                      hint: S.of(context).txt_input_dien_tich,
                      label: S.of(context).txt_dien_tich),
                  // InputCanLuaWidget(
                  //     ctrl: ctrlSanLuongCan,
                  //     inputType:
                  //         const TextInputType.numberWithOptions(decimal: true),
                  //     isDotDecimal: true,
                  //     unit: "kg",
                  //     hint: S.of(context).txt_input_san_luong_can,
                  //     label: S.of(context).txt_san_luong_can),
                  // InputCanLuaWidget(
                  //     ctrl: ctrlSoBao,
                  //     inputType: TextInputType.number,
                  //     unit: "bao",
                  //     hint: S.of(context).txt_input_so_bao,
                  //     label: S.of(context).txt_so_bao),
                  InputCanLuaWidget(
                      ctrl: ctrlKhoiLuongTruBao,
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isDotDecimal: true,
                      unit: "kg",
                      hint: S.of(context).txt_input_khoi_luong_tru_bao,
                      label: S.of(context).txt_khoi_luong_tru_bao),
                  InputCanLuaWidget(
                      ctrl: ctrlKhoiLuongTruTapChat,
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isDotDecimal: true,
                      unit: "kg",
                      hint: S.of(context).txt_input_khoi_luong_tru_tap_chat,
                      label: S.of(context).txt_khoi_luong_tru_tap_chat),
                  // InputCanLuaWidget(
                  //     ctrl: ctrlThanhTien,
                  //     inputType:
                  //         const TextInputType.numberWithOptions(decimal: true),
                  //     isDotDecimal: true,
                  //     unit: "đ",
                  //     hint: S.of(context).txt_input_thanh_tien,
                  //     label: S.of(context).txt_thanh_tien),
                  SizeBoxHeightWidget(),
                  SizeBoxHeightWidget(),
                  PrimaryBtnCLExt(
                    label: S.of(context).txt_save,
                    width: 200,
                    onClick: () {
                      // _codeSent(context);
                      // _createPhieuCan(context);
                      updatePhieuCan();
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

  void updatePhieuCan() {
    String khuRuong = ctrlKhuRuong.text,
        ngayCan = ctrlNgayCan.text,
        giong = ctrlGiong.text,
        tieuChuan = ctrlTieuChuan.text,
        donGia = ctrlDonGiaLua.text,
        dienTich = ctrlDienTich.text,
        khoiLuongTruBao = ctrlKhoiLuongTruBao.text,
        khoiLuongTruTapChat = ctrlKhoiLuongTruTapChat.text,
        ngayCanStr = '';
    if (khuRuong.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_ruong_empty);
    } else if (ngayCan.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_ngay_can_empty);
    } else if (giong.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_giong_empty);
    } else if (tieuChuan.isEmpty) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_kl_tieu_chuan_empty);
    } else if (donGia.isEmpty && num.tryParse(donGia) == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_don_gia_empty);
    } else if (dienTich.isEmpty && num.tryParse(dienTich) == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_dien_tich_empty);
    } else if (khoiLuongTruBao.isEmpty &&
        num.tryParse(khoiLuongTruBao) == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_kl_tru_bao_empty);
    } else if (khoiLuongTruTapChat.isEmpty &&
        num.tryParse(khoiLuongTruTapChat) == null) {
      MySnackBar.showSnackBarError(
          globalKey, S.of(context).txt_err_kl_tru_tap_chap_empty);
    } else {
      ngayCanStr =
          DateTimeHelper.formatDateTime(ngayCan, DateFormats.dd_MM_YYYY);
      widget.soPhieu.tenkhuruong = khuRuong;
      widget.soPhieu.ngaycanstr = ngayCanStr;
      widget.soPhieu.ngaycan = ngayCan;

      widget.soPhieu.tengiong = giong;
      widget.soPhieu.tieuchuan = tieuChuan;
      widget.soPhieu.giachot = num.tryParse(donGia);
      widget.soPhieu.dientichchot = num.tryParse(dienTich);
      widget.soPhieu.tongkhoiluong_tru_bao = num.tryParse(khoiLuongTruBao);
      widget.soPhieu.tongkhoiluong_tru_tapchat =
          num.tryParse(khoiLuongTruTapChat);
      bloc?.add(UpdateRpThongTinPhieuCanEvent(sophieu: widget.soPhieu));
    }
  }
}
