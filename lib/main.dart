import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'src/ui/router/router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatefulWidget {
  static final globalNavKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final TransitionBuilder botToastBuilder = BotToastInit();
  late final _router = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Comment Management',
      routerDelegate: _router.delegate(
        navigatorObservers: () => [
          BotToastNavigatorObserver(),
        ],
      ),
      routeInformationParser: _router.defaultRouteParser(),
      routeInformationProvider: _router.routeInfoProvider(),
      builder: BotToastInit(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
