import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/blocs/report/rp_filter/rp_filter_view.dart';
import 'package:loctroi_canlua_external/blocs/scale_weight/sc_list_phieu_can/sc_list_phieu_can_view.dart';
import 'package:loctroi_canlua_external/blocs/setting/setting/setting_view.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final navigatorKeySetting = GlobalKey<NavigatorState>(),
      navigatorKeyScaleWeight = GlobalKey<NavigatorState>(),
      navigatorKeyReport = GlobalKey<NavigatorState>();

  final navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey globalKey = GlobalKey();
  HomeBloc? bloc;

  TabController? tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    _pageController = PageController(initialPage: 1, keepPage: true);
  }

  void _changeTab(int value) {
    bloc!.add(SeleteTabHomeEvent(indexTab: value));
    _pageController!.jumpToPage(value);
    tabController!.animateTo(value);
  }

  //! Xừ lý back
  ///* Nếu ở tab nào sẽ back tab đó
  ///* Nếu canpop == false sẽ tắt app
  Future<bool> onWillPop() {
    int tabSelected =
        globalKey.currentContext!.read<HomeBloc>().state.indexTab ?? 0;

    GlobalKey? keyBack;
    if (tabSelected == tabScale) {
      keyBack = navigatorKeyScaleWeight;
    } else if (tabSelected == tabReport) {
      keyBack = navigatorKeyReport;
    } else {
      keyBack = globalKey;
    }
    if (Navigator.of(keyBack.currentContext ?? context, rootNavigator: false)
        .canPop()) {
      Navigator.of(keyBack.currentContext ?? context, rootNavigator: false)
          .pop();
    } else {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()
        ..add(InitHomeEvent())
        ..add(SeleteTabHomeEvent(indexTab: tabController?.index ?? 1)),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<HomeBloc>(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: globalKey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _changeTab,
          children: [
            KeepAliveWidget(SettingPage(backFunc: onWillPop)),
            KeepAliveWidget(ScListPhieuCanPage(
              navKey: navigatorKeyScaleWeight,
              backFunc: onWillPop,
              changeTab: _changeTab,
            )),
            KeepAliveWidget(RpFilterPage(
              navKey: navigatorKeyReport,
              backFunc: onWillPop,
              homeBloc: bloc!,
            ))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return TabBar(
                tabs: [
                  Tab(
                      icon: const Icon(Icons.settings),
                      child: Text(
                        'Cài đặt',
                        style: UITextStyle.mulishMediumStyle(
                            color: state.indexTab == 0
                                ? Theme.of(context).primaryColor
                                : null),
                      )),
                  // if (LocTroiHelper.is3CungFromChotGia == false)
                  Tab(
                    icon: const Icon(Icons.calculate),
                    // text: 'Cân lúa',
                    child: Text(
                      'Cân lúa',
                      style: UITextStyle.mulishMediumStyle(
                          color: state.indexTab == 1
                              ? Theme.of(context).primaryColor
                              : null),
                    ),
                  ),
                  Tab(
                    icon: const Icon(Icons.bar_chart),
                    child: Text(
                      'Thống kê',
                      style: UITextStyle.mulishMediumStyle(
                          color: state.indexTab == 2
                              ? Theme.of(context).primaryColor
                              : null),
                    ),
                  ),
                ],
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: UIColor.gray_80,
                onTap: _changeTab,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Theme.of(context).primaryColor,
                controller: tabController,
                indicator: UnderlineTabIndicator(
                  insets: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 70.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 3),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
