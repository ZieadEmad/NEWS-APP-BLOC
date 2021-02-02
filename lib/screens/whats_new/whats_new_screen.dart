import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/whats_new/cubit/cubit.dart';
import 'package:news_app/screens/whats_new/cubit/states.dart';
import 'package:news_app/shared/componentes/componentes.dart';

class WhatsNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WhatsNewCubit()..getNews(),
      child: BlocConsumer<WhatsNewCubit,WhatsNewStates>(
        listener: (context,state){

          if (state is WhatsNewStateLoading) {
            print('WhatsNewStateLoading');
            return buildProgress(
                context: context,
                text: "please Wait until get news.. "
            );
          }
          if (state is WhatsNewStateSuccess) {
            print('WhatsNewStateSuccess');
          }
          if (state is WhatsNewStateError) {
            print('WhatsNewStateError');
            Navigator.pop(context);
            return buildProgress(
              context: context,
              text: "${state.error.toString()}",
              error: true ,
            );
          }

        },
        builder: (context,state){
          List news = WhatsNewCubit.get(context).news;
          if(news.length != 0 ){
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.28,
                      padding: EdgeInsets.only(top: 4),
                      child: Stack(
                        children: [
                          Image.network(
                            '${news[6]['urlToImage']}',
                            width:MediaQuery.of(context).size.width ,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 6,right: 6),
                                  child: Text('${news[6]['title']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12 , left: 20 , right: 20 ),
                                  child: Text('${news[6]['description']}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.grey.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16,top: 16),
                            child: Text(
                              'Top Stories' ,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // for title (top stories)

                          Padding(
                            padding: EdgeInsets.only(top: 8 ,left: 4 ,right: 10),
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  headNewRow('${news[4]['author']}', '${news[4]['title']}', '${news[4]['urlToImage']}'),
                                  drawLine(),
                                  headNewRow('${news[3]['author']}', '${news[3]['title']}', '${news[3]['urlToImage']}'),
                                  drawLine(),
                                  headNewRow('${news[2]['author']}', '${news[2]['title']}', '${news[2]['urlToImage']}'),
                                ],
                              ),
                            ),
                          ), // for 3 rows

                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8 ,left: 16 , top: 8),
                                  child: Text(
                                    'Recent Update' ,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                ),
                                buildRecentCard(Colors.orange,'${news[5]['urlToImage']}','${news[5]['title']}',context,'15 min'),
                                SizedBox(height: 8,),
                                buildRecentCard(Colors.orange,'${news[7]['urlToImage']}','${news[7]['title']}',context,'15 min'),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ), // for title(recent) & 2 cards
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          }

          else{
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
