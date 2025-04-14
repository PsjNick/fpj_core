import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:oktoast/oktoast.dart';

class FpjWidgetApp extends StatelessWidget {
  final Widget? home;
  final Size? size;
  final String title;
  final String? initialRoute;
  final List<GetPage>? getPages;
  final Map<String, Widget Function(BuildContext)> routes;

  final Color? scaffoldBackgroundColor;
  final AppBarTheme? appBarTheme;
  final List<NavigatorObserver>? navigatorObservers;
  final ValueChanged<Routing?>? routingCallback;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final Iterable<Locale>? supportedLocales;

  const FpjWidgetApp({
    this.home,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.supportedLocales,
    this.size,
    this.initialRoute,
    this.getPages,
    this.title = "",
    this.scaffoldBackgroundColor,
    this.appBarTheme,
    this.navigatorObservers,
    this.routingCallback,
    this.routes = const <String, WidgetBuilder>{},
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: size ?? ScreenUtil.defaultSize,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return OKToast(
          child: GetMaterialApp(
            routingCallback: routingCallback,
            navigatorObservers: [
              defaultLifecycleObserver,
              ...(navigatorObservers ?? []),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: supportedLocales ??
                [
                  Locale('zh', 'CN'),
                  Locale('en', 'US'),
                ],
            theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: scaffoldBackgroundColor,
              appBarTheme: appBarTheme,
            ),
            title: title,
            debugShowCheckedModeBanner: false,
            routes: routes,
            getPages: getPages,
            initialRoute: initialRoute,
            home: home,
            onInit: onInit,
            onReady: onReady,
            onDispose: onDispose,
          ),
        );
      },
    );
  }
}
