import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/components/components.dart';
import '../shared/cubit/Cubit_eng.dart';
import '../shared/cubit/Cubit_eng_States.dart';
import '../shared/cubit_theme/cubit.dart';
class LayoutNewsEng extends StatelessWidget {
  const LayoutNewsEng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit_eng()..getBusiness_eng()..getSports_eng()..getScience_eng(),
      child: BlocConsumer<NewsCubit_eng,ParentNews_engAppClass>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=NewsCubit_eng.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search,),
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());
                    }
                ),
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined,),
                    onPressed: ()
                    {
                      ThemeCubit.get(context).ChangeAppMode();
                    }
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavBar,
              currentIndex: cubit.currentIndex_eng,
              onTap: (value){
                cubit.ChangeIconOfBottomNavBar_Eng(value);
              },
            ),
            body: cubit.screens_English[cubit.currentIndex_eng],
          );
        },
      ),
    );
  }
}
