part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

class CardInitial extends CardState {}

class CardCreatSuccessState extends CardState {
  final CardModel cardModel;

  const CardCreatSuccessState({required this.cardModel});
}

class CardCreateErrorState extends CardState {
  final String message;
  const CardCreateErrorState({required this.message});
}

class CardLoadingState extends CardState {}

class CardLoadingSuccessState extends CardState {
  final List<CardModel> cardModel;
  const CardLoadingSuccessState({required this.cardModel});
}

class CardLoadingErrorState extends CardState {
  final String message;
  const CardLoadingErrorState({required this.message});
}
