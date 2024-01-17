import 'package:flutter/material.dart';

abstract class SplashScreenEvent {}

class InitSplashScreenEvent extends SplashScreenEvent {}

class LoadDataSplashScreenEvent extends SplashScreenEvent {}

class SyncDataSplashScreenEvent extends SplashScreenEvent {
  BuildContext context;
  SyncDataSplashScreenEvent({
    required this.context,
  });
}
