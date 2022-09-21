import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blackjack/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutter_blackjack/injection_container.dart';
import 'package:flutter_blackjack/presentation/routes/routes.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjack_home_screen.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/bloc/set_balance_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blackjack/injection_container.dart' as di;
import 'package:provider/provider.dart';
import 'dart:io' show HttpClient, Platform;

void main() {
  di.init();
  runApp(MyApp());
}

Alice alice = Alice(
  showNotification: true,
  showInspectorOnShake: true,
  darkTheme: false,
  maxCallsCount: 1000,
);

class MyApp extends StatelessWidget {
  final blackJackBloc = sl<BlackjackkBloc>();
  final setBalanceBloc = sl<SetBalanceBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => blackJackBloc),
        BlocProvider(create: (_) => setBalanceBloc),
      ],
      child: MaterialApp(
          onGenerateRoute: Routes().onGenerateRoute,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: alice.getNavigatorKey(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ).copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          home: BlackJackHome()),
    );
  }
}
