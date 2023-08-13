import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Business_eng_screen.dart';
import 'package:newsapp/Science_eng_screen.dart';
import 'package:newsapp/Sports_eng_screen.dart';
import 'package:newsapp/layout/layout_eng.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'Cubit_eng_States.dart';
import '../../layout/layout.dart';

class NewsCubit_eng extends Cubit<ParentNews_engAppClass> {
  NewsCubit_eng() :super(InitialStatesNews_engApp());

  static NewsCubit_eng get(context) => BlocProvider.of(context);

  void EnglishNews(context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>LayoutNews())
    );
    emit(English_News_state());
  }
  int currentIndex_eng=0;

  List <BottomNavigationBarItem>  bottomNavBar=[
    const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined),
        label: 'Science'
    ),
  ];
  List<Widget> screens_English=
  [
    BusinessEngScreen(),
    SportsEngScreen(),
    ScienceEngScreen(),
  ];
  void ChangeIconOfBottomNavBar_Eng(value){
    currentIndex_eng=value;
    emit(BottomNavBarStatesNewsEngApp());
  }
  List<dynamic> businessEng=[];
  void getBusiness_eng()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'business',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      businessEng=value.data['articles'];
      print(businessEng[0]['title']);
      emit(NewGetBusinessSuccessStates_Eng());

    }).catchError((error){
      print(error.toString());
      emit(NewGetBusinessErrorStates_Eng(error));
    });
  }

  List<dynamic> sportsEng=[];
  void getSports_eng()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'sports',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      sportsEng=value.data['articles'];
      print(sportsEng[0]['title']);
      emit(NewGetSportsSuccessStates_Eng());

    }).catchError((error){
      print(error.toString());
      emit(NewGetSportsErrorStates_Eng(error));
    });
  }

  List<dynamic> scienceEng=[];
  void getScience_eng()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'science',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      scienceEng=value.data['articles'];
      print(scienceEng[0]['title']);
      emit(NewGetScienceSuccessStates_Eng());

    }).catchError((error){
      print(error.toString());
      emit(NewGetScienceErrorStates_Eng(error));
    });
  }
}