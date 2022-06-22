
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelguide/constants/app_colors.dart';
import 'package:travelguide/constants/image_files.dart';
import 'package:travelguide/cubit/app_cubits.dart';
import 'package:travelguide/widgets/app_large_text.dart';
import 'package:travelguide/widgets/app_responsive_button.dart';
import 'package:travelguide/widgets/app_text.dart';
import 'package:travelguide/widgets/app_buttons.dart';

import '../../../../cubit/app_cubit_states.dart';

class PlaceDetailsPage extends StatefulWidget {
  const PlaceDetailsPage({Key? key}) : super(key: key);

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {

  var selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
            builder: (context, state){
              DetailState detail = state as DetailState;

                return Scaffold(
                  body: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    //The contents of this page overlaps over one another so using stack
                    child: Stack(
                      //arrange children inside the children widget in order of stack.
                      // The one written first in children is one at the bottom
                      //the children at the top of the stack overlaps those at bottom
                      children: [

                        //-- image
                        Positioned(
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.maxFinite,
                              height: 350,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(state.place.img),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            )
                        ),

                        //-- icon button(top left)
                        Positioned(
                          left: 20,
                          top: 50,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  BlocProvider.of<AppCubits>(context).goHome();
                                },
                                color: Colors.white,
                                icon: const Icon(Icons.menu),
                              ),
                            ],
                          ),
                        ),

                        //--details with rows and columns (Place, rating, people and description)
                        Positioned(
                            top: 300,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, right: 20,top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,

                              //white slide
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Row-- Place with price
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppLargeText(text: state.place.name, textColor: Colors.black.withOpacity(0.7),),
                                      AppLargeText(text: '₹ ${state.place.price}', textColor: appThemeColor,)
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  //Row-- location
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: appThemeColorWithOpacity,),
                                      const SizedBox(width: 5,),
                                      AppText(text: state.place.location, textColor: appThemeColorWithOpacity,),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  //Row-- rating in stars
                                  Row(
                                    children: [
                                      Wrap(
                                          children: List.generate(5, (index){
                                            if(index<state.place.stars) {
                                              return const Icon(Icons.star, color: Colors.yellow);
                                            }else{
                                              return const Icon(Icons.star, color: Colors.grey);
                                            }
                                          })
                                      ),
                                      const SizedBox(width: 10),
                                      AppText(text: state.place.stars.toString(), textColor: appThemeColorWithOpacity,),
                                    ],
                                  ),
                                  const SizedBox(height: 25,),
                                  //-- people
                                  AppLargeText(text: "People", textColor: Colors.black.withOpacity(0.7), size: 22,),
                                  const SizedBox(height: 5,),
                                  AppText(text: "Number of people in your group", textColor: appThemeColorWithOpacity,),
                                  const SizedBox(height: 10,),
                                  //-- no. of people selector
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      return InkWell(
                                        onTap: (){
                                          setState((){
                                            selectedIndex=index;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(right: 7.0),
                                          child: AppSelectorButton(
                                            color: selectedIndex == index ? Colors.white: Colors.black,
                                            backGroundColor: selectedIndex == index ? Colors.black.withOpacity(0.7):appThemeColorWithOpacity,
                                            borderColor: selectedIndex == index ? Colors.black.withOpacity(0.7):appThemeColorWithOpacity,
                                            size: 60,
                                            text: (index+1).toString(),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 20,),
                                  //Text--description of place
                                  AppLargeText(text: "Description", textColor: Colors.black.withOpacity(0.7), size: 22,),
                                  const SizedBox(height: 10,),
                                  AppText(text: state.place.description,
                                    textColor: Colors.black.withOpacity(0.6),
                                  )

                                ],
                              ),

                            )
                        ),

                        //--bottom buttons
                        Positioned(
                          //position from bottom =20, left=20, right=20
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Row(
                            children: [
                              //add to favourite button
                              AppSelectorButton(
                                color: Colors.black.withOpacity(0.7),
                                backGroundColor: Colors.white,
                                borderColor: Colors.black.withOpacity(0.7),
                                size: 60,
                                isIcon: true,
                                icon: Icons.favorite_border,

                              ),
                              const SizedBox(width: 20,),
                              //book trip
                              const ResponsiveButton(
                                isResponsive: true,
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );

            });

  }
  }
