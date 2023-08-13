import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,ParentNewsAppClass>(
        listener: (context,state){},
        builder: (context,state)
        {
          var list=NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                  ),
                ),
                Expanded(child: ArticleBuild(list, context))
              ],
            ),
          );
        },
      );
  }
}
