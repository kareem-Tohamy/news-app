
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class Business_screen extends StatelessWidget {
  const Business_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,ParentNewsAppClass>(
      listener: (context,state){},
      builder: (context,state){
        var cubitBusinessList=NewsCubit.get(context).business;

        return ArticleBuild(cubitBusinessList,context);
      },
    );
  }
}
