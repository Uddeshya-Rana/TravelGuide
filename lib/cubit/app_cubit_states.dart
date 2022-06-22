import 'package:equatable/equatable.dart';
import 'package:travelguide/travel_data/places_model.dart';


abstract class CubitStates extends Equatable{}

//every class that extends cubit states must have a initial state
class InitialState extends CubitStates{
  //late int x;
  @override
  // There is no change in state or data initially so the props is empty( no data passed)
  List<Object?> get props => [];

}

//Welcome state shows Welcome page upon initialization
class WelcomeState extends CubitStates{
  @override
  // no data passed
  List<Object> get props => [];

}

//in case data not fetched return circular loading screen
class LoadingState extends CubitStates{
  @override
  List<Object> get props => [];

}

class LoadedState extends CubitStates{

  //LoadedState(this.places);
  //final List<DataModel> places;
  @override
  List<Object> get props => [];
  // the data is of all the places
  //List<Object> get props => [places];

}

class DetailState extends CubitStates{

  DetailState(this.place);
  final Place place;
  @override
  // the data is of a particular place
  List<Object> get props => [place];

}

