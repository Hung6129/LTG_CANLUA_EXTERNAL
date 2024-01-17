// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:http/http.dart' as http;
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/can_lua_repository.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';

// ignore_for_file: depend_on_referenced_packages
final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();
  final logger = Logger();
  // final eventBus = EventBus();

  // Core
  // token = await sharedPreferences.read(key: USER_TOKEN);
  // dio.options.headers["x-app-version"] = "x-app-version";
  // dio.options.headers["x-app-id"] = "x-app-id";
  // dio.options.headers["Demo-Header"] = "demo header";
  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    sl.registerLazySingleton(() => sharedPreferences);
  }
  if (!GetIt.I.isRegistered<http.Client>()) {
    sl.registerLazySingleton(() => http.Client());
  }
  if (!GetIt.I.isRegistered<Dio>()) sl.registerLazySingleton(() => dio);
  if (!GetIt.I.isRegistered<Logger>()) sl.registerLazySingleton(() => logger);
  // sl.registerLazySingleton(() => ProductDatabase());
  //sl.registerLazySingleton(() => DataConnectionChecker());

  // Services
  // sl.registerLazySingleton<FilterServices>(() => FilterServices(dio));

  // Repository

  if (!GetIt.I.isRegistered<IBLoginRepository>()) {
    sl.registerLazySingleton<IBLoginRepository>(() => BLoginRepository());
  }

  if (!GetIt.I.isRegistered<IBMasterDataRepository>()) {
    sl.registerLazySingleton<IBMasterDataRepository>(
        () => BMasterDataRepository());
  }

  if (!GetIt.I.isRegistered<IBCustomerRepository>()) {
    sl.registerLazySingleton<IBCustomerRepository>(() => BCustomerRepository());
  }

  if (!GetIt.I.isRegistered<ICanLuaRepository>()) {
    sl.registerLazySingleton<ICanLuaRepository>(() => CanLuaRepository());
  }

  if (!GetIt.I.isRegistered<CLDatabase>()) {
    sl.registerLazySingleton(() => CLDatabase());
  }
  // if (!GetIt.I.isRegistered<IFilterRepository>()) {
  //   sl.registerLazySingleton<IFilterRepository>(() => FilterRepository());
  // }
  // if (!GetIt.I.isRegistered<IScaleWeightRepository>()) {
  //   sl.registerLazySingleton<IScaleWeightRepository>(
  //       () => ScaleWeightRepository());
  // }
}
