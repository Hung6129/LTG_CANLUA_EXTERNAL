// ignore_for_file: implementation_imports

import 'package:base_project/export.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';

class ExpandWidget extends StatelessWidget {
  final ExpandableController ctrl = ExpandableController();
  final Widget title;
  final String? subTile;
  final Widget expand;
  final String txtTitleButtonBottom;
  final Function onClickButtonBottom;
  final bool? initialExpanded;
  ExpandWidget(
      {Key? key,
      required this.title,
      this.subTile,
      this.initialExpanded,
      required this.expand,
      required this.onClickButtonBottom,
      required this.txtTitleButtonBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isShowButton =
        ValueNotifier<bool>(initialExpanded ?? false);
    ctrl.expanded = initialExpanded ?? false;
    ctrl.addListener(
      () {
        isShowButton.value = ctrl.value;
      },
    );
    return ExpandableNotifier(
        controller: ctrl,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: paddingDefaultLeftRight),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: title,
                      collapsed: Container(),
                      expanded: expand,
                      builder: (_, collapsed, expanded) {
                        return Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: isShowButton,
                builder:
                    (BuildContext context, bool counterValue, Widget? child) {
                  return isShowButton.value == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: paddingDefaultLeftRight),
                              child: SizedBox(
                                  height: 42,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: PrimaryButton(
                                    onPressed: () {
                                      onClickButtonBottom();
                                    },
                                    borderRadius: 38,
                                    widget: Text(
                                      txtTitleButtonBottom,
                                      style: UITextStyle.mulishMediumStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: UIColor.white),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      : Container();
                })
          ],
        ));
  }
}
