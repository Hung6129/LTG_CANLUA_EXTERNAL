// ignore_for_file: implementation_imports

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/my_app.dart';
import 'package:loctroi_canlua_external/run_config.dart';
import 'injection_container.dart' as di;

// 1- AppId của cân lúa là CANLUA
// 2- Gọi loginV2 và truyền thêm appId = CANLUA (trong model login)
// 3- Khi gọi API: trong header, ngoài username, token và mobile, truyền thêm appid = CANLUA
void main() async {
  await di.init();
  await runAppConfig();
  await Firebase.initializeApp();
  await PrefHelper.setString(APPID, "CANLUA");
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const CanluaExtApp());
  });
}

Future runAppConfig() async {
  RunConfig.baseUrl = BaseRepository.baseURLCanLuaExternal;
  RunConfig.isDev = false;
}
