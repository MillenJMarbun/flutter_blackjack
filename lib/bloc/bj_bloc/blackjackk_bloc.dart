import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blackjack/data/models/blackjack/blackjack_draw_responsemodel.dart';
import 'package:flutter_blackjack/data/models/blackjack/blackjack_response_model.dart';
import 'package:flutter_blackjack/data/services/blackjack_service.dart';
import 'package:flutter_blackjack/presentation/utils/soundEffects.dart';

part 'blackjackk_event.dart';
part 'blackjackk_state.dart';

class BlackjackkBloc extends Bloc<BlackjackkEvent, BlackjackkState> {
  BlackjackkBloc() : super(BlackjackkInitial()) {
    on<BlackjackkEvent>((event, emit) async {
      if (event is ShuffleCardEvent) {
        emit(BlackjackkLoad());
        final shuffleCards = await BJNetwork.ShuffleCards();
        print("Cards here ${shuffleCards}");
        emit(BlackjackkShuffleLoaded(
            BlackJackShuffleResponseModel.fromJson(shuffleCards)));
      }

      if (event is DrawCardEvent) {
        final drawCards = await BJNetwork.DrawCards(
            deck_id: event.deck_id, draw_count: event.draw_count);
        SoundEffect.dealCard();
        print("Drawed Cards here ${drawCards}");
        emit(BlackjackkDrawLoaded(
            BlackJackDrawCardResponseModel.fromJson(drawCards)));
      }

      if (event is BustedEvent) {
        emit(BustedState());
      }

      if (event is StandEvent) {
        emit(StandState());
      }
      if (event is WinEvent) {
        emit(WinState());
      }
      if (event is LoseEvent) {
        emit(LoseState());
      }

      if (event is AddValEvent) {
        emit(BlackjackValueLoaded(event.dealerVal));
      }

      if (event is DrawEvent) {
        emit(DrawState());
      }
    });
  }
}
