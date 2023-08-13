import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/layout.dart';
import 'package:newsapp/layout/layout_eng.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'Cubit_eng_States.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<ParentNewsAppClass>
{
  NewsCubit():super(InitialStatesNewsApp());

  static NewsCubit get(context)=>BlocProvider.of(context);
  
  void ArabicNews(context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>LayoutNews())
    );
    emit(ArabicNewsState());
  }
  void EnglishNews(context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>LayoutNewsEng())
    );
    emit(EnglishNewsstate());
  }

  int currentIndex=0;

  List <BottomNavigationBarItem>  bottomNavBar=[
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'بيزنس'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'رياضة'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'علوم'
    ),
  ];
  List<Widget> screens_Arabic=
  [
    Business_screen(),
    sports_screen(),
    science_screen(),
  ];
  void ChangeIconOfBottomNavBar(value){
    currentIndex=value;
    emit(BottomNavBarStatesNewsApp());
  }

  List<dynamic> business=[];
  void getBusiness()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessSuccessStates());

    }).catchError((error){
      print(error.toString());
      emit(NewGetBusinessErrorStates(error));
    });
  }

  List<dynamic> sports=[];
  void getSports()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewGetSportsSuccessStates());

    }).catchError((error){
      print(error.toString());
      emit(NewGetSportsErrorStates(error));
    });
  }

  List<dynamic> science=[];
  void getScience()
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewGetScienceSuccessStates());

    }).catchError((error){
      print(error.toString());
      emit(NewGetScienceErrorStates(error));
    });
  }

  List<dynamic> search=[];
  void getSearch(String value)
  {
    //emit(NewsGetBusinessLoadingStates());

    DioHelper.getDate(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'b1c6ece567bf45f2b82c3fc2736abb78',
      },
    ).then((value) {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewGetSearchSuccessStates());

    }).catchError((error){
      print(error.toString());
      emit(NewGetSearchErrorStates(error));
    });
  }

}