import 'package:base_project/export.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init()) {
    on<InitHomeEvent>(_init);
    on<SeleteTabHomeEvent>(_selectTab);
    on<AutoLoadReportTabHomeEvent>(_autoLoadReport);
  }
  void _init(InitHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.init());
  }

  //! select tab in homepage
  void _selectTab(SeleteTabHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.setIndexTab(state: state, index: event.indexTab));
  }

  //! auto load report
  void _autoLoadReport(
      AutoLoadReportTabHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.setAutoLoadReport(
        state: state, isAutoFilterReport: event.isLoad));
  }
}
