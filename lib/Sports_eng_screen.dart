import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';

import 'shared/cubit/Cubit_eng.dart';
import 'shared/cubit/Cubit_eng_States.dart';
class SportsEngScreen extends StatelessWidget {
  const SportsEngScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit_eng,ParentNews_engAppClass>(
      listener: (context,state){},
      builder: (context,state){
        var cubitBusinessList=NewsCubit_eng.get(context).sportsEng;

        return ArticleBuild(cubitBusinessList,context);
      },
    );
  }
}
