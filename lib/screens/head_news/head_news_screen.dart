import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/head_news/cubit/cubit.dart';
import 'package:news_app/screens/head_news/cubit/states.dart';
import 'package:news_app/shared/componentes/componentes.dart';

class HeadNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HeadNewCubit()..getNews(),
      child: BlocConsumer<HeadNewCubit,HeadNewStates>(
        listener: (context,state){
          if (state is HeadNewStateLoading) {
            print('WhatsNewStateLoading');
            return buildProgress(
                context: context,
                text: "please Wait until get news.. "
            );
          }
          if (state is HeadNewStateSuccess) {
            print('WhatsNewStateSuccess');
          }
          if (state is HeadNewStateError) {
            print('WhatsNewStateError');
            Navigator.pop(context);
            return buildProgress(
              context: context,
              text: "${state.error.toString()}",
              error: true ,
            );
          }

        },
        builder: (context,state) {
          List news = HeadNewCubit
              .get(context)
              .news;
          if (news.length != 0) {
            return Scaffold(
              body: ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    child: Column(
                      children: [
                        headNewRow(
                            news[position]['author'], news[position]['title'],
                            news[position]['urlToImage']),
                        drawLine(),
                      ],
                    ),
                  );
                },

                itemCount: news.length,
              ),
            );
          }

          else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
