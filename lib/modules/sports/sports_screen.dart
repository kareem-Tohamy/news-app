
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class sports_screen extends StatelessWidget {
  const sports_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,ParentNewsAppClass>(
      listener: (context,state){},
      builder: (context,state){
        var cubitSportsList=NewsCubit.get(context).sports;

        return ArticleBuild(cubitSportsList,context);
      },
    );
  }
}
