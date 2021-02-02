import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/countries/france/cubit/cubit.dart';
import 'package:news_app/screens/countries/france/cubit/states.dart';
import 'package:news_app/shared/componentes/componentes.dart';



class FranceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FranceCubit()..getNews(),
      child: BlocConsumer<FranceCubit, FranceStates>(
        listener: (context,state){},
        builder: (context,state){
          var News = FranceCubit.get(context).news;
          return Scaffold(
            appBar: AppBar(
              title: Text('France News'),
            ),
            body: ConditionalBuilder(
              condition: News.length != 0 ,
              builder: (context) => Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      itemBuilder: (context, index) =>
                          buildNewsItems(News[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 25.0,
                      ),
                      itemCount: News.length,
                    ),
                  ),
                ],
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
