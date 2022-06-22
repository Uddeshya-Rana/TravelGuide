
import 'package:bloc/bloc.dart';
import 'package:travelguide/cubit/app_cubit_states.dart';
import '../travel_data/places_model.dart';

class AppCubits extends Cubit<CubitStates>{

  AppCubits() : super(InitialState()){
    emit(WelcomeState());
  }


  getAllPlaces() {
    try{
      //emit(LoadingState());
      emit(LoadedState());
    }catch(e){

    }
  }

  getPlace(Place place){
    try {
      //emit(LoadingState());
      emit(DetailState(place));
    } on Exception catch (e) {
      print(e);
    }
  }

  goHome(){
    emit(LoadedState());
  }

  goToWelcomePage(){
    emit(WelcomeState());
  }

}

//-----CODE WITH API DATA------
/*
import 'package:bloc/bloc.dart';
import 'package:travelguide/backend_services/models/data_model.dart';
import 'package:travelguide/cubit/app_cubit_states.dart';

import '../backend_services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{

  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  Future<void> getAllPlaces() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }

  getPlace(DataModel place){
    try {
      emit(LoadingState());
      print(place.name);
      print(place.description);
      emit(DetailState(place));
    } on Exception catch (e) {
      print(e);
    }
  }

  goHome(){
    emit(LoadedState(places));
  }
}
*/

