import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


import '../../../../../core/usecases/usecase.dart';
import '../../../data/model/card_model.dart';
import '../../../domain/usecase/create_card.dart';
import '../../../domain/usecase/get_card_info.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardCreateBloc extends Bloc<CardEvent, CardState> {
  final GetCardInfo getCardInfo;
  final CreateCard createCard;

  CardCreateBloc(this.getCardInfo, this.createCard) : super(CardInitial()) {
    on<CardEvent>((event, emit) async {
      if (event is PostCreateCardEvent) {
        final newCard = await createCard(NoParams());
        newCard.fold((error) {
          print('errorState createCard $error');
          emit(CardCreateErrorState(message: error.toString()));
        }, (newCard) {
          print('successState $newCard');
          emit(CardCreatSuccessState(cardModel: newCard));
        });
      }
      if (event is GetCardListEvent) {
        emit(CardLoadingState());
        try {
          print('Get CardList');
          final cardList = await getCardInfo(NoParams());
          cardList.fold((error) {
            print(' errorState getCardInfo $error');
            emit(CardLoadingErrorState(message: error.toString()));
          }, (cardList) {
            print('successState CardLoadingSuccessState $cardList');
            emit(
                CardLoadingSuccessState(cardModel: cardList.reversed.toList()));
          });
        } on DioError catch (e) {
          print('errorState $e');
          emit(CardLoadingErrorState(message: e.toString()));
        } catch (e) {
          print('errorState $e');
          emit(CardLoadingErrorState(message: e.toString()));
        }
      }
    });
  }


}
