import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'configs/app_route.dart';
import 'configs/app_theme.dart';

void main() {
  // runApp(DevicePreview(
  //   builder: (_) => const MyApp(),
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
      theme: getApplicationTheme(),
      title: "IKN-UIKIT",
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
    );
  }
}
