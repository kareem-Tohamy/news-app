import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/cubit_theme/cubit.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class LayoutNews extends StatelessWidget {
  const LayoutNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,ParentNewsAppClass>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'أخبارك'
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
            currentIndex: cubit.currentIndex,
            onTap: (value){
              cubit.ChangeIconOfBottomNavBar(value);
            },
          ),
          body: cubit.screens_Arabic[cubit.currentIndex],
        );
      },
    );
  }
}
