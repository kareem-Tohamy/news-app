import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/first.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit_theme/cubit.dart';
import 'package:newsapp/shared/cubit_theme/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';
import 'package:newsapp/styles/Themes.dart';

import 'layout/layout.dart';
void main() {
  DioHelper.init();
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>NewsCubit()..getBusiness()..getSports()..getScience(),),
        BlocProvider(create: (context)=>ThemeCubit(),)

      ],
      child: BlocConsumer<ThemeCubit,ParentThemeAppClass>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            home: first_screen(),
          );
        },
      ),
    );
  }
}
