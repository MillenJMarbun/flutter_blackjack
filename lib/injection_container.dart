import 'package:flutter_blackjack/bloc/bj_bloc/blackjackk_bloc.dart';
import 'package:flutter_blackjack/presentation/screens/blackjack/bloc/set_balance_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => BlackjackkBloc());
  sl.registerFactory(() => SetBalanceBloc());
}
