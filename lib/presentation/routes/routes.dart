import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blackjack/presentation/routes/route_const.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjackScreens.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjack_about_screen.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjack_home_screen.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjack_settings_screen.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/blackjack_strategy_screen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case blackjacScreen:
        return MaterialPageRoute(
          builder: (_) => BlackJacScreen(),
        );
      case blackjackhomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlackJackHome(),
        );
      case blackjackStratScreen:
        return MaterialPageRoute(
          builder: (_) => BlackJackStrategy(),
        );
      case blackjacksettingsScreen:
        return MaterialPageRoute(
          builder: (_) => BJSettings(),
        );
      case blackjackaboutScreen:
        return MaterialPageRoute(
          builder: (_) => AboutScreen(),
        );
      default:
        throw ('This route name does not exit');
    }
  }
}
