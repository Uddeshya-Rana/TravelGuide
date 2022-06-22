
//CHECK STATES

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelguide/cubit/app_cubits.dart';
import 'package:travelguide/pages/navigation_pages/home_page.dart';
import 'package:travelguide/pages/navigation_pages/main_page.dart';
import 'package:travelguide/pages/navigation_pages/nav_routes/details/places_details_page.dart';
import 'package:travelguide/pages/welcome_page.dart';

import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return const WelcomePage();
          }if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }if(state is LoadedState){
            return const MainPage();
          }if(state is DetailState){
            return const PlaceDetailsPage();
          }else{
            return Container();
          }
        },
      )
    );
  }
}
