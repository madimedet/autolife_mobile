part of 'accommodation_bloc.dart';

abstract class AccommodationEvent{}

class GetInfoAccommEvent extends AccommodationEvent{}

class CreateAccommEvent extends AccommodationEvent{
  final String name;

  CreateAccommEvent({required this.name});
}
