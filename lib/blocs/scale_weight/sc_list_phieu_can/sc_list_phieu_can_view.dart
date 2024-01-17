// ignore_for_file:todo, use_build_context_synchronously, must_be_immutable

import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/blocs/home/home_bloc.dart';
import 'package:loctroi_canlua_external/blocs/home/home_event.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_create_phieu_can/sc_create_phieu_can_view.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_scale_weight/sc_scale_weight_view.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/key_value_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/models/suffix_icon_model.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';

import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/widgets/expand_widget.dart';

import 'sc_list_phieu_can_bloc.dart';
import 'sc_list_phieu_can_event.dart';
import 'sc_list_phieu_can_state.dart';

class ScListPhieuCanPage extends StatelessWidget {
  final GlobalKey globalKey = GlobalKey();
  final Future<bool> Function() backFunc;
  final GlobalKey navKey;
  ScListPhieuCanBloc? _bloc;
  Function(int) changeTab;

  ScListPhieuCanPage({
    Key? key,
    required this.backFunc,
    required this.navKey,
    required this.changeTab,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ScListPhieuCanBloc()
        ..add(InitScListPhieuCanState())
        ..add(LoadDataScListPhieuCanEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  void _navToCreateSpreadsheets(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScCreatePhieuCanPage()),
    ).then((isReload) {
      if (isReload == true) {
        _bloc?.add(InitScListPhieuCanState());
        _bloc?.add(LoadDataScListPhieuCanEvent());
      }
    });
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<ScListPhieuCanBloc>(context);
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
                  backgroundColor: UIColor.gray_bg_canlua,
                  appBar: AppBarWidget(
                      title: S.of(context).txt_title_tao_bang_tinh,
                      lstSuff: [
                        SuffixIconModel(
                            svgIcon: SvgPicture.asset(
                              CanLuaEXTAssets.icAddRound,
                            ),
                            calback: () {
                              _navToCreateSpreadsheets(context);
                            }),
                      ]),
                  body:
                      //  BlocListener<SCBangTinhBloc, SCBangTinhState>(
                      //   listener: (context, state) {
                      //     //  Navigator.of(context).pushNamed
                      //     if (state.loadingStatus == BlocLoadingStatus.show) {
                      //       EasyLoading.show(status: 'loading...');
                      //     } else if (state.loadingStatus != BlocLoadingStatus.show) {
                      //       EasyLoading.dismiss();
                      //     }
                      //     if (state.isShowListBag == true) {
                      //       Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ScaleWeightPage(
                      //                 soPhieuCan: soPhieuCan,
                      //                 maKhuRuong: maKhuRuong,
                      //                 is3Ccan: is3Ccan,
                      //                 maGhe: maGhe,
                      //                 maND: maND,
                      //                 lstBag: state.bagRices ?? [])),
                      //       );
                      //     }
                      //     if (state.errMessage != null && state.errMessage!.isNotEmpty) {
                      //       MySnackBar.showSnackBarError(globalKey, state.errMessage!);
                      //       if (state.errMessage == tokenExpiredErr) {
                      //         if (LocTroiHelper.is3CungFromChotGia == true) {
                      //           // Navigator.of(context);
                      //         } else {
                      //           Navigator.of(context, rootNavigator: true)
                      //               .pushNamedAndRemoveUntil(
                      //                   splashRoute, (Route<dynamic> route) => false);
                      //         }
                      //       }
                      //     }
                      //   },
                      // child:
                      BlocBuilder<ScListPhieuCanBloc, ScListPhieuCanState>(
                    builder: (context, state) {
                      if (state.soPhieu == null) {
                        return Padding(
                          padding:
                              const EdgeInsets.all(paddingDefaultLeftRight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                CanLuaEXTAssets.imgBGScaleWeight,
                                width: MediaQuery.of(context).size.width,
                              ),
                              // Text(
                              //   "Danh sách trống!",
                              //   style: UITextStyle.mulishMediumStyle(color: UIColor.dark_text),
                              // ),
                              Text(
                                "Bấm vào nút (+) để bắt đầu cân.",
                                style: UITextStyle.mulishMediumStyle(
                                    color: UIColor.dark_text),
                              ),
                            ],
                          ),
                        );
                      } else {
                        List<KeyValueModel> data =
                            state.soPhieu!.initKeyValuePhieuTuCan(context);
                        return Padding(
                          padding:
                              const EdgeInsets.all(paddingDefaultLeftRight),
                          child: SingleChildScrollView(
                            child: ExpandWidget(
                                initialExpanded: true,
                                title: Padding(
                                    padding:
                                        const EdgeInsets.all(kdefaultPadding),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${S.of(context).txt_so_phieu}:  ${state.soPhieu?.sophieucan}',
                                          style: UITextStyle.mulishBoldStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: UIColor.green_dark_text),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: kdefaultPadding,
                                          ),
                                          child:

                                              ///Nếu IDENCT bằng null ==> số phiếu này là số phiếu offline ==> show nong dan
                                              Text(
                                            '${S.of(context).txt_ngay_can}:  ${state.soPhieu?.ngaycan}',
                                            style:
                                                UITextStyle.mulishMediumStyle(
                                                    fontSize: 12,
                                                    color: UIColor.gray_80),
                                          ),
                                        ),
                                      ],
                                    )),
                                expand: Padding(
                                  padding:
                                      const EdgeInsets.all(kdefaultPadding),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: 65,
                                      ),
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          padding: const EdgeInsets.all(
                                              kdefaultPadding),
                                          decoration: BoxDecoration(
                                            color: Color(colors[index]),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].key,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: UITextStyle
                                                      .mulishMediumStyle(
                                                          fontSize: 12,
                                                          color:
                                                              UIColor.gray_80),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                        data[index].vaule,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: UITextStyle
                                                            .mulishMediumStyle(
                                                                color: UIColor
                                                                    .green_dark_text)),
                                                  ),
                                                ),
                                              ]),
                                        );
                                      }),
                                ),
                                onClickButtonBottom: () {
                                  _onNavToScaleWeight(context, state.soPhieu);
                                },
                                txtTitleButtonBottom:
                                    S.of(context).txt_chi_tiet_can_lua),
                          ),
                        );
                      }
                    },
                  ),
                )));
  }

  _onNavToScaleWeight(BuildContext context, SoPhieuFilterModel? soPhieu) async {
    if (soPhieu != null) {
      // *TODO START Tính toán ID CAN LUA
      // get lúc nav ==> đảm bảo trong 1 phiên làm việc offline ko lỗi
      final CLDatabase db = di.sl();
      String? idCanLua;
      List<BagRiceEntity> lstBagsLocal =
          await db.getAllBagRiceBySoPhieu(soPhieu.sophieucan!);

      if (lstBagsLocal.isNotEmpty) {
        var lstDummy = lstBagsLocal
            .where((element) =>
                element.id_canlua != null && element.id_canlua!.isNotEmpty)
            .toList();
        idCanLua = lstDummy.isNotEmpty ? lstDummy.first.id_canlua : null;
      }
      // *TODO END Tính toán ID CAN LUA
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ScScaleWeightPage(soPhieu: soPhieu, idCanLua: idCanLua)),
      ).then((value) {
        context.read<HomeBloc>().add(AutoLoadReportTabHomeEvent(isLoad: true));
        changeTab(2);
      });
    }
  }
}
