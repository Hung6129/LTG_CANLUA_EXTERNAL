import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';

abstract class ScScaleWeightEvent {}

class InitEvent extends ScScaleWeightEvent {}

class ShowBottomScScaleWeightEvent extends ScScaleWeightEvent {}

class SaveWeightScScaleWeightEvent extends ScScaleWeightEvent {
  ScaleWeightRequestModel request;
  BuildContext context;
  SaveWeightScScaleWeightEvent({
    required this.request,
    required this.context,
  });
}

class SetWeightScScaleWeightEvent extends ScScaleWeightEvent {
  double weight;
  SetWeightScScaleWeightEvent({
    required this.weight,
  });
}

class InitLstBagEvent extends ScScaleWeightEvent {
  String soPhieuCan;
  bool? isLocTroiCan;
  InitLstBagEvent({
    required this.soPhieuCan,
    required this.isLocTroiCan,
  });
}

class SelectScScaleWeightEvent extends ScScaleWeightEvent {
  BagRiceEntity bag;
  bool isChecked;
  SelectScScaleWeightEvent({
    required this.bag,
    required this.isChecked,
  });
}

class DelScScaleWeightEvent extends ScScaleWeightEvent {
  List<BagRiceEntity> bagRemove;
  String soPhieuCan, idCanLua;
  DelScScaleWeightEvent(
      {required this.bagRemove,
      required this.soPhieuCan,
      required this.idCanLua});
}
