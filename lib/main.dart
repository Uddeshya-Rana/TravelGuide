import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelguide/cubit/app_cubit_check_states.dart';


import 'package:travelguide/cubit/app_cubits.dart';void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const WelcomePage(),
      home: BlocProvider<AppCubits>(
          create: (context)=> AppCubits(), //To create and hold cubit
          child: AppCubitLogics(), //checks and returns state
      )
    );
  }
}


