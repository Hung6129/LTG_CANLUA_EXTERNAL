abstract class RpFilterEvent {}

class InitEvent extends RpFilterEvent {}

class LoadDataRpFilterEvent extends RpFilterEvent {
  String formDate, toDate;
  bool tuCan;
  LoadDataRpFilterEvent({
    required this.toDate,
    required this.formDate,
    required this.tuCan,
  });
}
