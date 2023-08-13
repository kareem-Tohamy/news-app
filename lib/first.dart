import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/Cubit_eng.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
class first_screen extends StatelessWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,ParentNewsAppClass>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('من فضلك اختر اللغة',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: (){
                        cubit.ArabicNews(context);
                      },
                      child: Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                        ),
                        child: const Center(child: const Text('العربية',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: (){
                        cubit.EnglishNews(context);
                      },
                      child: Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue,
                        ),
                        child: const Center(child: Text('الإنجليزية',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        } ,
      ),
    );
  }
}
