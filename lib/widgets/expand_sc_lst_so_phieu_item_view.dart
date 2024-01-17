// ignore_for_file: implementation_imports

import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/key_value_model.dart';
import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

class ExpandSCLstSoPhieuItemView extends StatefulWidget {
  final List<KeyValueModel> keyValuesGhe, keyValuesThuMua;
  final Function openDialogGhe, openDialogThuMua, onDelete;
  final bool? showDividerTop;
  final bool? isShowEditThuMuaGhe;
  final bool? isShowEditGhe;
  final bool? isDel;
  final EdgeInsetsGeometry? padding;
  const ExpandSCLstSoPhieuItemView(
      {Key? key,
      required this.keyValuesGhe,
      required this.keyValuesThuMua,
      required this.openDialogGhe,
      this.showDividerTop = true,
      this.isShowEditThuMuaGhe = true,
      this.isShowEditGhe = false,
      this.padding,
      this.isDel = false,
      required this.onDelete,
      required this.openDialogThuMua})
      : super(key: key);

  @override
  State<ExpandSCLstSoPhieuItemView> createState() =>
      _ExpandSCLstSoPhieuItemViewState();
}

class _ExpandSCLstSoPhieuItemViewState extends State<ExpandSCLstSoPhieuItemView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length:  2  );
  }

  @override
  Widget build(BuildContext context) { 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.showDividerTop == true)
          const Divider(
            color: UIColor.gray_bg_canlua,
            thickness: 2,
            height: 3,
          ),
        Padding(
            padding: widget.padding ??
                const EdgeInsets.only(
                    top: paddingDefaultLeftRight,
                    left: paddingDefaultLeftRight,
                    right: paddingDefaultLeftRight),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 34, bottom: 10),
                  child: AnimatedBuilder(
                    animation: _tabController!.animation!,
                    builder: (BuildContext context, snapshot) {
                      return Transform.rotate(
                        angle: 0,
                        child: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, -1),
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            ),
                            width: double.maxFinite,
                            child: tabViewWidget(
                                data: widget.keyValuesThuMua,
                                isGhe: false,
                                isShowEditThuMuaGhe: widget.isShowEditThuMuaGhe,
                                onClickEdit: () {
                                  widget.openDialogThuMua();
                                }),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, -1),
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: Colors.white,
                              ),
                              width: double.maxFinite,
                              child: tabViewWidget(
                                  data: widget.keyValuesGhe,
                                  isGhe: true,
                                  isShowEditThuMuaGhe: widget.isShowEditGhe,
                                  onClickEdit: () {
                                    widget.openDialogGhe();
                                  }))
                        ][_tabController!.animation!.value.round()],
                      );
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: widget.padding == null
                          ? MediaQuery.of(context).size.width -
                              paddingDefaultLeftRight * 2 -
                              30
                          : MediaQuery.of(context).size.width -
                              paddingDefaultLeftRight * 2 -
                              4,
                      height: 35,
                      child: TabBar(
                          controller: _tabController,
                          labelColor: UIColor.green_dark_text,
                          unselectedLabelColor: UIColor.gray_80,
                          labelStyle: UITextStyle.mulishMediumStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          indicator: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 0,
                                offset: const Offset(0, -1),
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(S.of(context).txt_chi_tiet_thu_mua),
                              ),
                            ),
                         
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child:  Text( widget.keyValuesGhe.isNotEmpty ?S.of(context).txt_thong_tin_ghe:""),
                                ),
                              )
                          ]),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }

  Widget tabViewWidget(
      {required List<KeyValueModel> data,
      required Function onClickEdit,
      required bool isGhe,
      bool? isShowEditThuMuaGhe}) {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 65,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(kdefaultPadding),
                decoration: BoxDecoration(
                  color: Color(colors[index]),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].key,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: UITextStyle.mulishMediumStyle(
                            fontSize: 12, color: UIColor.gray_80),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(data[index].vaule,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: UITextStyle.mulishMediumStyle(
                                  color: UIColor.green_dark_text)),
                        ),
                      ),
                    ]),
              );
            }),
        if (isShowEditThuMuaGhe == true)
          TextButton(
            onPressed: () {
              onClickEdit();
            },
            child: Text(
              isGhe
                  ? S.of(context).txt_sua_thong_tin_ghe
                  : S.of(context).txt_sua_chi_tiet_thu_mua,
              style: UITextStyle.mulishMediumStyle(
                  color: UIColor.primary,
                  textDecoration: TextDecoration.underline),
            ),
          )
      ],
    );
  }
}
