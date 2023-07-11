import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_carentes_app/core/index.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'consts.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainRouterBindings().dependencies();
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      return runApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehavior(),
          initialRoute: MainRouter.homeRouter.home,
          theme: CoreTheme.themeDataDefault,
          darkTheme: CoreTheme.themeDataDark,
          themeMode: CoreTheme.getThemeMode(),
          getPages: MainRouter.routes(),
          defaultTransition: Transition.cupertino,
        ),
      );
    },
  );
}
