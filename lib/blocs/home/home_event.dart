abstract class HomeEvent {}

class InitHomeEvent extends HomeEvent {}

class SeleteTabHomeEvent extends HomeEvent {
  int indexTab;
  SeleteTabHomeEvent({
    required this.indexTab,
  });
}

class AutoLoadReportTabHomeEvent extends HomeEvent {
  bool isLoad;
  AutoLoadReportTabHomeEvent({
    required this.isLoad,
  });
}
