
// This page will be our carousel slider

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelguide/constants/app_colors.dart';
import 'package:travelguide/constants/image_files.dart';
import 'package:travelguide/cubit/app_cubits.dart';
import 'package:travelguide/widgets/app_large_text.dart';
import 'package:travelguide/widgets/app_text.dart';
import 'package:travelguide/widgets/app_responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: welcomePageImages.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite, //takes max width of container
              height: double.maxFinite, //takes max height of container
              decoration: BoxDecoration(
                //our background image
                image: DecorationImage(
                    image: AssetImage(
                      welcomePageImages[index]
                    ),
                    fit: BoxFit.cover,
                )

              ),
              child: Container(
            
                margin: const EdgeInsets.only(top: 100,left: 20, right: 20),
                //Row for horizontal alignment of its children
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Column for vertical alignment inside horizontal row
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const SizedBox(height: 20,), //to create a gap again
                        const AppText(text: "Discover Mountains",size: 30,textColor:Colors.grey),
                        const SizedBox(height: 20,), //to create a gap
                        Container(
                          width: 250,
                          child: const AppText(
                              text: "Mountain hikes give you an incredible sense of freedom and adventure along with a good endurance test.",
                              textColor: Colors.black54,
                              size: 14,
                          ),
                        ),
                        const SizedBox(height: 20,), //to create a gap again
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubits>(context).getAllPlaces();
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children: const [
                                ResponsiveButton(width: 100,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      //Creating dots on top left of screen
                      children: List.generate(3, (indexDots){
                        return Container(
                          width: 8,
                          margin: const EdgeInsets.only(bottom: 2), //space between the dots
                          height: index == indexDots ? 25:8 , //if index of list is equal to index of item builder then make it longer
                          decoration: BoxDecoration(
                            color: index == indexDots ? appThemeColor : appThemeColorWithOpacity,
                            borderRadius: BorderRadius.circular(8) //radius = width to make it circular
                          ),
                        );
                      }),

                    ),
                  ],
                ),

              ),
            );
      }),
    );
  }
}
