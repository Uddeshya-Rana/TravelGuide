
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelguide/constants/app_colors.dart';
import 'package:travelguide/constants/image_files.dart';
import 'package:travelguide/cubit/app_cubit_states.dart';
import 'package:travelguide/cubit/app_cubits.dart';
import 'package:travelguide/travel_data/places_data.dart';
import 'package:travelguide/widgets/app_large_text.dart';
import 'package:travelguide/widgets/app_text.dart';

import '../../widgets/designs/circle_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// TickerProviderStateMixin added for using Tab Bar Controller
class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this); //length means 3 items and vsync with this means to sync the controller with the build method

    return Scaffold(
      backgroundColor: Colors.white,

      body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state){
            if( state is LoadedState){
              return Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Top menu Icons
                  Container(
                    padding: const EdgeInsets.only( top:70, left: 20),
                    child: Row( //this contains two icons at the top

                      children: [
                        //item 1
                        InkWell(
                            child: Icon(Icons.menu, size: 30, color: Colors.black87,),
                            onTap: (){ //always put the the bloc provider inside function body
                              BlocProvider.of<AppCubits>(context).goToWelcomePage();
                            }
                        ),

                        Expanded(child: Container()), //for space between items to be flexible

                        //item 2
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(left: 10,right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        )
                      ],

                    ),
                  ),

                  //to create a flexible gap between containers
                  //Expanded(flex : 1, child: Container()),

                  //to create a fixed gap between containers
                  const SizedBox(height: 20,),

                  //Discover text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const AppLargeText(text: 'Discover'),
                  ),

                  const SizedBox(height: 20,),

                  //Tab Bar (Text)
                  Container(
                    child: Align(
                      //to align the tab bar to the start i.e. with our other top containers
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        //set label padding manually to make alignment work bcz by default labels have max padding
                          labelPadding: const EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController, // --controller is required
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.black26,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label, //indicator for current tab
                          indicator: CircleTabIndicator(color: appThemeColor, radius: 4),
                          tabs: const [
                            Tab(text: "Places"),
                            Tab(text: "Inspiration",),
                            Tab(text: "Emotions",),
                          ]
                      ),
                    ),
                  ),

                  //Tab Bar View (Images,Inspirations,Emotions)  --controller is required
                  Container(
                    margin: const EdgeInsets.only(top:10,bottom: 20),
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(

                        controller: _tabController,
                        children: [
                          //Places(Images)
                          ListView.builder(

                              itemCount: allPlaces.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index){

                                  return InkWell(
                                    onTap: (){
                                      //print('tapped!! $index');
                                      BlocProvider.of<AppCubits>(context).getPlace(allPlaces[index]);
                                      },
                                     child: Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        width: 200,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage(allPlaces[index].img),//NetworkImage("http://mark.bslmeiyu.com//uploads/"+placesInfo[index].img),
                                            fit : BoxFit.cover,
                                          ),

                                        )

                                  ),
                                   );


                              } //itemBuilder

                          ),
                          //Inspirations
                          const Text('Be Inspired.'),
                          //Emotions
                          const Text('Emotions are your raw energy'),


                        ]
                    ),
                  ),

                  const SizedBox(height: 20,),

                  //Explore more and icon
                  Container(
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppLargeText(text: "Explore more", size: 22,),
                        AppText(text: "See all", textColor: appThemeColor, ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),

                  //Activities list view
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: double.maxFinite,

                    child: ListView.builder(
                        itemCount: activities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //images of activities
                              Container(
                                  margin: const EdgeInsets.only(right: 50),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(activities.values.elementAt(index)),
                                      fit : BoxFit.cover,
                                    ),

                                  )

                              ),
                              //text description for activities
                              Container(
                                margin: const EdgeInsets.only(right: 50),
                                padding: const EdgeInsets.only(top:10,),
                                child: AppText(text: activities.keys.elementAt(index), textColor: appThemeColorWithOpacity,),
                              ),
                            ],
                          );
                        }
                    ),

                  )


                ],
              );
            }
            else
              {
                return Container();
              }
          }
      )

    );
  }
}
