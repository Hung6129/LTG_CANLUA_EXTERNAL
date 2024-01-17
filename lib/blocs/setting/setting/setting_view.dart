import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loctroi_canlua_external/blocs/setting/report_err/report_err_view.dart';
import 'package:loctroi_canlua_external/blocs/setting/setting/dialog_view/dialog_app_info.dart';
import 'package:loctroi_canlua_external/blocs/splash_screen/splash_screen_view.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/app_bar_widget.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';

import 'setting_bloc.dart';
import 'setting_event.dart';
import 'setting_state.dart';

const int indexReport = 0,
    indexInfo = 1,
    indexFanPage = 2,
    indexSync = 3,
    indexLogout = 4;

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  Future<bool> Function() backFunc;
  SettingBloc? _bloc;
  SettingPage({Key? key, required this.backFunc}) : super(key: key);
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    _bloc = BlocProvider.of<SettingBloc>(context);

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: (context) => Scaffold(
          backgroundColor: UIColor.gray_bg_canlua,
          key: globalKey,
          appBar: AppBarWidget(
            title: S.of(context).txt_setting,
            backFunc: backFunc,
          ),
          body: BlocListener<SettingBloc, SettingState>(
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
                      MaterialPageRoute(
                          builder: (context) => SplashScreenPage()),
                      (Route<dynamic> route) => false);
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(paddingDefaultLeftRight,
                  paddingDefaultTop, paddingDefaultLeftRight, 0),
              child: Column(
                children: [
                  BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Container(
                            width: 62,
                            height: 62,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    CanLuaEXTAssets.imgAvatar,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          SizeBoxWidthWidget(),
                          SizeBoxWidthWidget(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${state.loginRepsonseModel?.fullName}",
                                style: UITextStyle.mulishMediumStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizeBoxHeightWidget(),
                              SizeBoxHeightWidget(),
                              Text(
                                "${state.loginRepsonseModel?.userName}",
                                style: UITextStyle.mulishMediumStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  SizeBoxHeightWidget(),
                  const Divider(
                    color: UIColor.black,
                  ),
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      color: UIColor.gray_40,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(context: context, index: index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem({required BuildContext context, required int index}) {
    String title = "";
    String icon = "";
    Widget? leadingIcon;
    switch (index) {
      case indexReport:
        title = S.of(context).txt_report_err;
        icon = CanLuaEXTAssets.icReport;
        break;
      case indexInfo:
        title = S.of(context).txt_infomation;
        icon = CanLuaEXTAssets.icInfo;
        break;
      case indexFanPage:
        title = S.of(context).txt_fanpage;
        icon = CanLuaEXTAssets.icFB;
        break;
      case indexSync:
        title = S.of(context).txt_sync_data;
        icon = CanLuaEXTAssets.icReport;
        break;
      case indexLogout:
        title = S.of(context).txt_logout;
        icon = CanLuaEXTAssets.icReport;
        break;
    }
    if (index == indexLogout) {
      leadingIcon = const CircleAvatar(
          radius: 12,
          backgroundColor: UIColor.primary,
          child: Icon(
            Icons.logout,
            size: 11,
            color: UIColor.white,
          ));
    } else if (index == indexSync) {
      leadingIcon = const CircleAvatar(
          radius: 12,
          backgroundColor: UIColor.primary,
          child: Icon(
            Icons.sync,
            size: 11,
            color: UIColor.white,
          ));
    } else {
      leadingIcon = SvgPicture.asset(icon);
    }
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return ListTile(
          title: Text(title),
          leading: leadingIcon,
          onTap: () {
            if (index == indexReport) {
              onReportErr(context);
            } else if (index == indexInfo) {
              onViewAppInfo(context, "${state.versionCode}");
            } else if (index == indexLogout) {
              logout(context);
            } else if (index == indexSync) {
              syncData(context);
            } else if (index == indexFanPage) {
              onViewFanPage(context);
            } else {
              onViewFanPage(context);
            }
          },
          trailing: SvgPicture.asset(CanLuaEXTAssets.icRight),
        );
      },
    );
  }

  onReportErr(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportErrPage()),
    );
  }

  onViewFanPage(BuildContext context) async {
    // var url = 'https://loctroi.vn/';
    // if (!await launchUrl(Uri.parse(url))) {
    //   ShowToastWidget(context)
    //       .showToastErr('Không thể mở trang web, vui lòng thử lại sau');
    // }
  }

  onViewAppInfo(BuildContext context, String versionCode) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogAppInfo(versionCode: versionCode);
      },
    );
  }

  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
              content: "Xác nhận đăng xuất",
              onConfirm: () async {
                await PrefHelper.setString(TOKEN_LOGIN, "");
                await PrefHelper.setString(EMAIL, "");
                await PrefHelper.setString(FULLNAME, "");
                await PrefHelper.setString(EMAIL, "");

                await PrefHelper.setInt(USER_TYPE, 99);
                CLDatabase db = di.sl();
                await db.deleteEverything();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SplashScreenPage()),
                    (Route<dynamic> route) => false);
              },
            ));
  }

  void syncData(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
              content: "Xác nhận đồng bộ dữ liệu",
              onConfirm: () async {
                _bloc?.add(SyncDataSettingEvent());
                Navigator.of(context).pop();
              },
            ));
  }
}
