import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_scale_weight/sc_scale_weight_bloc.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_scale_weight/sc_scale_weight_event.dart'; 
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';
import 'package:loctroi_canlua_external/widgets/textfield_canlua.dart';

class BottomInputScaleWeight extends StatelessWidget {
  BottomInputScaleWeight({
    Key? key,
    required this.ctrlManualInputText,
    required this.focusNode,
    required this.onSave,
    required this.bloc,
  }) : super(key: key);

  final TextEditingController ctrlManualInputText;
  final FocusNode focusNode;
  final FocusNode focusNode1 = FocusNode();
  final void Function() onSave;
  final ScScaleWeightBloc? bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: paddingDefaultTop),
      padding: paddingDefaultScreen,
      decoration: const BoxDecoration(
        color: UIColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(children: [
        SizeBoxHeightWidget(
          height: kdefaultPadding * 2,
        ),
        Text(
          S.of(context).txt_nhap_trong_luong_bao_lua,
          style: UITextStyle.robotoMediumSmallStyle(fontSize: 16),
        ),
        InputCanLuaWidget(
            ctrl: ctrlManualInputText,
            autofocus: true,
            focusNode: focusNode,
            inputAction: TextInputAction.next,
            hint: S.of(context).txt_0kg,
            isDotDecimal: true,
            inputType: const TextInputType.numberWithOptions(decimal: true),
            label: S.of(context).txt_weight),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: SecondaryButton(
                  onPressed: () {
                    bloc?.add(ShowBottomScScaleWeightEvent());
                  },
                  title: S.of(context).btn_close,
                ),
              ),
              SizeBoxWidthWidget(width: kdefaultPadding * 3),
              SizedBox(
                width: 120,
                child: PrimaryButton(
                  fixedHeight: 40,

                  onPressed: () {
                    onSave();
                    ctrlManualInputText.clear();
                    focusNode.requestFocus();
                  },
                  widget: Text(
                    S.of(context).txt_bao_tiep,
                    style: UITextStyle.sfProDisplayStyleS14W600(
                        color: UIColor.white, fontSize: 16),
                  ),
                  // title: positiveLabel,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
    // return BlocProvider<ScScaleWeightBloc>.value(
    //   value: bloc!,
    //   child: BlocListener<ScScaleWeightBloc, ScScaleWeightState>(
    //     listener: (context, state) {

    //     },
    //     child:
    //   ),
    // );
  }
}
