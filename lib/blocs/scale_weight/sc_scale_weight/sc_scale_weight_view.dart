import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_scale_weight/bottom_input_scale_weight.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/models/suffix_icon_model.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/toast_widget.dart';
import 'sc_scale_weight_bloc.dart';
import 'sc_scale_weight_event.dart';
import 'sc_scale_weight_state.dart';

// ignore: must_be_immutable
class ScScaleWeightPage extends StatefulWidget {
  final SoPhieuFilterModel soPhieu;
  final bool? isLocTroiCan;
  String? idCanLua;
  ScScaleWeightPage(
      {Key? key, required this.soPhieu, this.idCanLua, this.isLocTroiCan})
      : super(key: key);

  @override
  State<ScScaleWeightPage> createState() => _ScScaleWeightPageState();
}

class _ScScaleWeightPageState extends State<ScScaleWeightPage> {
  final ScrollController _lstViewBagController =
      ScrollController(initialScrollOffset: 110);
  final TextEditingController ctrlManualInputText = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();
  ScScaleWeightBloc? _bloc;
  @override
  void initState() {
    super.initState();
    //!-----nếu ko có id cân lúa sẽ tạo guid-----
    String guid = const Uuid().v1();
    widget.idCanLua = widget.idCanLua ?? guid;
    //!-----nếu ko có id cân lúa sẽ tạo guid-----
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   _lstViewBagController.animateTo(380,
    //       duration: const Duration(milliseconds: 10), curve: Curves.ease);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ScScaleWeightBloc()
        ..add(InitEvent())
        ..add(InitLstBagEvent(
            soPhieuCan: widget.soPhieu.sophieucan!,
            isLocTroiCan: widget.isLocTroiCan)),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<ScScaleWeightBloc>(context);

    return Scaffold(
      key: globalKey,
      backgroundColor: UIColor.gray_bg_canlua_ext,
      appBar: AppBarWidget(
          title: S.of(context).txt_can_lua,
          lstSuff: widget.isLocTroiCan == true
              ? []
              : [
                  // SuffixIconModel(
                  //     svgIcon: SvgPicture.asset(
                  //       CanLuaEXTAssets.icInfo,
                  //       color: UIColor.white,
                  //     ),
                  //     calback: () {
                  //       // _removeChooseItem(context);
                  //     }),
                  SuffixIconModel(
                      svgIcon: SvgPicture.asset(
                        CanLuaEXTAssets.icTrash,
                      ),
                      calback: () {
                        _removeChooseItem(context);
                      }),
                ]),
      body: BlocListener<ScScaleWeightBloc, ScScaleWeightState>(
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

          //! nếu bắt được sự kiện scroll bottom (khi set thành công danh sách các bao lúa) và clean text input đi và re-focus lại
          if (state.isScrollBottom == true) {
            // print(_lstViewBagController.position.maxScrollExtent);
            _lstViewBagController.animateTo(
                _lstViewBagController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
          }
        },
        child: BlocBuilder<ScScaleWeightBloc, ScScaleWeightState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _lstViewBagController,
                    child: Column(children: [
                      if (state.bags != null && state.bags!.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              paddingDefaultLeftRight,
                              0,
                              paddingDefaultLeftRight,
                              0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            // reverse: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: state.bags?.length,
                            padding:
                                const EdgeInsets.only(top: paddingDefaultTop),
                            itemBuilder: (context, index) {
                              BagRiceEntity? bagRiceEntity = state.bags?[index];
                              return GestureDetector(
                                  onTap: () {
                                    _checkBag(!bagRiceEntity!.isChecked,
                                        bagRiceEntity);
                                  },
                                  child: Column(children: [
                                    Expanded(
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                          Positioned.fill(
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 2),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            CanLuaEXTAssets
                                                                .imgBao),
                                                        //fit: BoxFit.cover
                                                        fit: BoxFit.fill),
                                                  ),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          // "${bagRiceEntity?.weight!.toStringAsFixed(1)}",
                                                          FormatHelper
                                                              .numberToDoubleStr1(
                                                                  bagRiceEntity!
                                                                      .weight),
                                                          style: UITextStyle
                                                              .mulishMediumStyle(
                                                                  fontSize: 16),
                                                        ),
                                                        SizeBoxHeightWidget(),
                                                        Text(
                                                            S
                                                                .of(context)
                                                                .txt_kg,
                                                            style: UITextStyle
                                                                .mulishMediumStyle(
                                                                    fontSize:
                                                                        16)),
                                                      ]))),
                                          if (widget.isLocTroiCan != true)
                                            Positioned(
                                                top: -0,
                                                child: Center(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 14,
                                                        height: 14,
                                                        color: UIColor.white,
                                                        child: Checkbox(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0)),
                                                            value: bagRiceEntity
                                                                .isChecked,
                                                            onChanged: (value) {
                                                              _checkBag(value,
                                                                  bagRiceEntity);
                                                            }))))
                                        ])),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          (index + 1)
                                              .toString()
                                              .padLeft(3, '0'),
                                          style: UITextStyle.mulishMediumStyle(
                                              color: UIColor.green_dark_text),
                                        ))
                                  ]));
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 125),
                          ),
                        ),
                      ] else ...[
                        Container(
                          height: MediaQuery.of(context).size.height - 200,
                          alignment: Alignment.center,
                          child: Text(
                            S.of(context).txt_du_lieu_can_rong,
                            style: UITextStyle.mulishBoldStyle(
                                color: UIColor.green_dark_text,
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SecondaryButton(
                              // fixedHeight: 40,
                              padding: const EdgeInsets.all(12),
                              onPressed: () {
                                _finishScaleWeight(state);
                              },
                              title: S.of(context).txt_hoan_thanh_can_lua,
                            ),
                          ),
                          if (widget.isLocTroiCan != true)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PrimaryButton(
                                // fixedHeight: 40,
                                padding: const EdgeInsets.all(12),
                                onPressed: () {
                                  _onScale(state);
                                },
                                title: S.of(context).txt_continue_scale_sort,
                              ),
                            ),
                        ],
                      ),
                    ]),
                  ),
                ),
                if (state.isShowInputBottom == true)
                  BottomInputScaleWeight(
                      ctrlManualInputText: ctrlManualInputText,
                      bloc: _bloc,
                      onSave: _onSave,
                      focusNode: focusNode)
              ],
            );
          },
        ),
      ),
    );
  }

  _checkBag(bool? value, BagRiceEntity? bagRiceEntity) {
    if (bagRiceEntity != null) {
      _bloc?.add(
          SelectScScaleWeightEvent(bag: bagRiceEntity, isChecked: value!));
    }
  }

  _removeChooseItem(BuildContext context) {
    List<BagRiceEntity> bags =
        context.read<ScScaleWeightBloc>().state.bags ?? [];
    List<BagRiceEntity> bagsRemove = bags
        .where((element) => element.isChecked == true)
        // .map((e) => e.idLocalDB ?? 0)
        .toList();
    if (bagsRemove.isEmpty) {
      ShowToastWidget(context)
          .showToastErr(S.of(context).txt_not_choose_item_remove);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
                content: S.of(context).txt_warning_remove_scale,
                onConfirm: () {
                  _bloc?.add(DelScScaleWeightEvent(
                      bagRemove: bagsRemove,
                      soPhieuCan: widget.soPhieu.sophieucan!,
                      idCanLua: widget.idCanLua!));
                  Navigator.of(context).pop();
                });
          });
    }
  }

  void _onScale(ScScaleWeightState state) {
    _bloc?.add(ShowBottomScScaleWeightEvent());
  }

  void _onSave() {
    var rawWeightText = ctrlManualInputText.text;
    rawWeightText = rawWeightText.replaceAll(' ', '').trim();
    double weight = double.tryParse(rawWeightText) ?? 0;
    if (weight > 0) {
      _bloc?.add(SaveWeightScScaleWeightEvent(
          context: context,
          request: ScaleWeightRequestModel(
              id_canlua: widget.idCanLua,
              soPhieuCan: widget.soPhieu.sophieucan!,
              data: [DataBean(weight: weight)])));
    } else {
      MySnackBar.showSnackBarError(globalKey, 'Khối lượng phải lớn hơn 0');
    }
  }

  void _finishScaleWeight(ScScaleWeightState state) {
    Navigator.pop(context, EnumActionBack.openTabReport);
  }
}
