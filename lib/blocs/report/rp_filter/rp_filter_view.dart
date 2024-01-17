// ignore_for_file: use_build_context_synchronously

import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/home/home_bloc.dart';
import 'package:loctroi_canlua_external/blocs/home/home_event.dart';
import 'package:loctroi_canlua_external/blocs/home/home_state.dart';
import 'package:loctroi_canlua_external/blocs/report/rp_filter/rp_filter_state.dart';
import 'package:loctroi_canlua_external/blocs/report/rp_thong_tin_ghe/rp_thong_tin_ghe_view.dart';
import 'package:loctroi_canlua_external/blocs/report/rp_thong_tin_phieu_can/rp_thong_tin_phieu_can_view.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_scale_weight/sc_scale_weight_view.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/drop_down_lib_widget.dart';
import 'package:loctroi_canlua_external/widgets/expand_sc_lst_so_phieu_item_view.dart';
import 'package:loctroi_canlua_external/widgets/expand_widget.dart';
import 'package:loctroi_canlua_external/widgets/text_filed_date_picker.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;

import 'rp_filter_bloc.dart';
import 'rp_filter_event.dart';
// import 'rp_filter_state.dart';

// ignore: must_be_immutable
class RpFilterPage extends StatelessWidget {
  final Future<bool> Function() backFunc;
  RpFilterBloc? _bloc;
  HomeBloc homeBloc;
  final GlobalKey navKey, globalKey = GlobalKey();
  bool isTuCan = true;
  final TextEditingController ctrlFromDate = TextEditingController(
          text: DateTimeHelper.getDateStrByDateTime(
              DateTime.now().subtract(const Duration(days: 30)),
              format: DateFormats.YEAR_MONTH_DAY)),
      ctrlToDate = TextEditingController(
          text: DateTimeHelper.getDateStrByDateTime(DateTime.now(),
              format: DateFormats.YEAR_MONTH_DAY));
  RpFilterPage(
      {Key? key,
      required this.backFunc,
      required this.navKey,
      required this.homeBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RpFilterBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<RpFilterBloc>(context);
    var lstDummy = [tuCan, ltCan];
    return Navigator(
        key: navKey,
        onGenerateRoute: (route) => MaterialPageRoute(
            settings: route,
            // builder: (context) => nav == NavScaleWeight.filter
            //     ? ScaleWeightFilterPage()
            //     : SCBangTinhPrePage(
            //         soPhieuCan: soPhieuCan,
            //         maKhuRuong: maKhuRuong,
            //         maND: maND)));
            builder: (context) => Scaffold(
                  key: globalKey,
                  backgroundColor: UIColor.gray_bg_canlua_ext,
                  appBar: AppBarWidget(title: S.of(context).txt_thong_ke),
                  body: MultiBlocListener(
                    listeners: [
                      BlocListener<RpFilterBloc, RpFilterState>(
                        listener: (context, state) {
                          if (state.loadingStatus == BlocLoadingStatus.show &&
                              EasyLoading.isShow == false) {
                            EasyLoading.show(status: 'loading...');
                          } else if (state.loadingStatus ==
                              BlocLoadingStatus.hide) {
                            EasyLoading.dismiss();
                          }
                          if (state.errMessage != null &&
                              state.errMessage!.isNotEmpty) {
                            MySnackBar.showSnackBarError(
                                globalKey, state.errMessage!);
                            if (state.errMessage == tokenExpiredErr) {
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SplashScreenPage()),
                                      (Route<dynamic> route) => false);
                            }
                          }
                        },
                      ),
                      BlocListener<HomeBloc, HomeState>(
                          listener: (context, state) {
                        // Log.debug("RpFilterPage",
                        //     "state.isAutoFilterReport:${state.isAutoFilterReport}");
                        // Log.debug("RpFilterPage",
                        //     "formDate:${DateTimeHelper.getDateStrByDateTime(DateTime.now().subtract(const Duration(days: 30)), format: DateFormats.dd_MM_YYYY)}");
                        // Log.debug("RpFilterPage",
                        //     "toDate:${DateTimeHelper.getDateStrByDateTime(DateTime.now(), format: DateFormats.dd_MM_YYYY)}");
                        if (state.isAutoFilterReport == true) {
                          _bloc?.add(LoadDataRpFilterEvent(
                              formDate: DateTimeHelper.getDateStrByDateTime(
                                  DateTime.now()
                                      .subtract(const Duration(days: 30)),
                                  format: DateFormats.dd_MM_YYYY),
                              toDate: DateTimeHelper.getDateStrByDateTime(
                                  DateTime.now(),
                                  format: DateFormats.dd_MM_YYYY),
                              tuCan: true));
                          homeBloc
                              .add(AutoLoadReportTabHomeEvent(isLoad: false));
                        }
                      })
                    ],
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                          paddingDefaultLeftRight,
                          0,
                          paddingDefaultLeftRight,
                          0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: paddingDefaultTop,
                                bottom: kdefaultPadding * 1.5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: kdefaultPadding / 2),
                                  child: TextFieldDatePickerWidget(
                                    ctrl: ctrlFromDate,
                                    hint: S.of(context).txt_format_day,
                                    label: S.of(context).txt_tu_ngay,
                                  ),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: kdefaultPadding / 2),
                                  child: TextFieldDatePickerWidget(
                                    ctrl: ctrlToDate,
                                    hint: S.of(context).txt_format_day,
                                    label: S.of(context).txt_den_ngay,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropDownLibWidget<String>(
                                    label: S.of(context).txt_du_lieu_can,
                                    lstData: lstDummy,
                                    selectedValue: tuCan,
                                    height: 39,
                                    onChange: (v) {
                                      isTuCan = (v == tuCan);
                                    },
                                    itemAsString: (e) => e!,
                                    onFind: null),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SecondaryButton(
                                    child: const Icon(
                                      Icons.search,
                                      color: UIColor.primary,
                                    ),
                                    onPressed: () {
                                      _onSearch(context);
                                    }),
                              )
                            ],
                          ),
                          BlocBuilder<RpFilterBloc, RpFilterState>(
                            builder: (context, state) {
                              if (state.soPhieus != null &&
                                  state.soPhieus!.isNotEmpty) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                        top: kdefaultPadding * 2),
                                    itemCount: state.soPhieus?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      SoPhieuFilterModel? data =
                                          state.soPhieus?[index];
                                      if (data == null) return Container();
                                      return ExpandWidget(
                                          title: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      kdefaultPadding,
                                                      8,
                                                      kdefaultPadding,
                                                      4),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${S.of(context).txt_so_phieu}:  ${data.sophieucan}',
                                                    style: UITextStyle
                                                        .mulishBoldStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: UIColor
                                                                .green_dark_text),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .only(
                                                        top: kdefaultPadding),
                                                    child:

                                                        ///Nếu IDENCT bằng null ==> số phiếu này là số phiếu offline ==> show nong dan
                                                        Text(
                                                      '${S.of(context).txt_ngay_can}:  ${data.ngaycan ?? data.ngaycoghe}',
                                                      style: UITextStyle
                                                          .mulishMediumStyle(
                                                              fontSize: 12,
                                                              color: UIColor
                                                                  .gray_80),
                                                    ),
                                                  ),
                                                ],
                                              )),

                                          ///Nếu IDENCT bằng null ==> số phiếu này là số phiếu offline
                                          expand: ExpandSCLstSoPhieuItemView(
                                              keyValuesGhe: isTuCan == false &&
                                                      data.vctm_ghe != null
                                                  ? data.vctm_ghe!
                                                      .keyValueGhe(context)
                                                  : data.keyValueGhe(context),
                                              isShowEditThuMuaGhe: isTuCan,
                                              isShowEditGhe: isTuCan,
                                              openDialogGhe: () {
                                                _navToGhe(data, context);
                                              },
                                              openDialogThuMua: () {
                                                _navToThuMua(data, context);
                                              },
                                              onDelete: () {},
                                              keyValuesThuMua: isTuCan ==
                                                          false &&
                                                      data.vctm_ghe != null
                                                  ? data.vctm_ghe!
                                                      .keyValueThuMua(context)
                                                  : data
                                                      .keyValueThuMua(context)),
                                          onClickButtonBottom: () {
                                            _onNavToScaleWeight(context, data);
                                          },
                                          txtTitleButtonBottom: S
                                              .of(context)
                                              .txt_chi_tiet_can_lua);
                                    });
                              } else {
                                return Container();
                              }
                            },
                          )
                        ]),
                      ),
                    ),
                  ),
                )));
  }

  _navToGhe(SoPhieuFilterModel soPhieuFilterModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RpThongTinGhePage(
                soPhieu: soPhieuFilterModel,
              )),
    ).then((isRefesh) {
      if (isRefesh == true) {
        _onSearch(context);
      }
    });
  }

  _navToThuMua(SoPhieuFilterModel soPhieuFilterModel, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RpThongTinPhieuCanPage(
                soPhieu: soPhieuFilterModel,
              )),
    ).then((isRefesh) {
      if (isRefesh == true) {
        _onSearch(context);
      }
    });
  }

  _onSearch(BuildContext context) {
    {
      if (ctrlToDate.text.isEmpty || ctrlFromDate.text.isEmpty) {
        MySnackBar.showSnackBarError(
            globalKey, S.of(context).txt_err_ngay_can_empty);
      } else {
        _bloc?.add(LoadDataRpFilterEvent(
            formDate: DateTimeHelper.formatDateTime(
                ctrlFromDate.text, DateFormats.dd_MM_YYYY),
            toDate: DateTimeHelper.formatDateTime(
                ctrlToDate.text, DateFormats.dd_MM_YYYY),
            tuCan: isTuCan));
      }
    }
  }

  _onNavToScaleWeight(BuildContext context, SoPhieuFilterModel data) async {
    // ignore: todo
    // *TODO START Tính toán ID CAN LUA
    // get lúc nav ==> đảm bảo trong 1 phiên làm việc offline ko lỗi
    final CLDatabase db = di.sl();
    String? idCanLua;
    List<BagRiceEntity> lstBagsLocal =
        await db.getAllBagRiceBySoPhieu(data.sophieucan!);
    // if (isTuCan == true && lstBagsLocal.isEmpty) {
    //   lstBagsLocal = await canLuaRepository.getBagRices(
    //       data.sophieucan!, !isTuCan, isTuCan);
    // }
    if (lstBagsLocal.isNotEmpty) {
      var lstDummy = lstBagsLocal
          .where((element) =>
              element.id_canlua != null && element.id_canlua!.isNotEmpty)
          .toList();
      idCanLua = lstDummy.isNotEmpty ? lstDummy.first.id_canlua : null;
    }
    // ignore: todo
    // *TODO END Tính toán ID CAN LUA
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ScScaleWeightPage(
              soPhieu: data, idCanLua: idCanLua, isLocTroiCan: !isTuCan)),
    );
  }
}
