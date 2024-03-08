import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

showSnackBar({String msg = ""}) {
  assert(navigatorKey.currentContext != null, "NavigatorProvider.navigatorKey 未初始化");
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(content: Text(msg)));
}
