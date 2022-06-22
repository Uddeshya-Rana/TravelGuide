import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubit_states.dart';
import '../../cubit/app_cubits.dart';
import '../../widgets/app_large_text.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top menu Icons
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  //this contains two icons at the top

                  children: [
                    //item 1
                    InkWell(
                        child: Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black87,
                        ),
                        onTap: () {
                          //always put the the bloc provider inside function body
                          BlocProvider.of<AppCubits>(context).goToWelcomePage();
                        }),

                    Expanded(
                        child:
                        Container()), //for space between items to be flexible

                    //item 2
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(left: 10, right: 10),
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
              const SizedBox(height: 100,),
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: const AppLargeText(text: 'My Page'),
              )
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
