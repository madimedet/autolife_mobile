part of 'accommodation_bloc.dart';

abstract class AccommodationState{}

class AccommodationInitial extends AccommodationState {}
class AccommodationLoadingState extends AccommodationState {

}


class AccommodationLoadingErrorState extends AccommodationState {
  final String message;
  AccommodationLoadingErrorState({required this.message});
}


class AccommodationLoadingSuccessState extends AccommodationState {
 final List<AccommodationsModel> accommodation;

  AccommodationLoadingSuccessState({required this.accommodation});
}

class CreatingAccomState extends AccommodationState {

}

class CreatingAccomErrorState extends AccommodationState {
  final String message;
  CreatingAccomErrorState({required this.message});
}


class CreatingAccomSuccessState extends AccommodationState {
 final AccommodationsModel accommodation;

 CreatingAccomSuccessState({required this.accommodation});
}