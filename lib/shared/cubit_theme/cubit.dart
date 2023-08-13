import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit_theme/states.dart';

class ThemeCubit extends Cubit<ParentThemeAppClass> {
  ThemeCubit() :super(InitialStatesThemeApp());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  void ChangeAppMode()
  {
    isDark=!isDark;
    emit(AppChangeModeState());
  }
}