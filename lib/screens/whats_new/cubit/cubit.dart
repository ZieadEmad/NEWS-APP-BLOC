import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/whats_new/cubit/states.dart';
import 'package:http/http.dart' as http;
class WhatsNewCubit extends Cubit<WhatsNewStates> {

  WhatsNewCubit() : super(WhatsNewStateInitial());

  static WhatsNewCubit get(context) => BlocProvider.of(context);


  var news = [] ;

  // getNews() {
  //   emit(WhatsNewStateLoading());
  //   DioHelper.postData(
  //     path: 'top-headlines?sources=bbc-news&apiKey=0ab84482c0034ebe914a7ff43ab6f72e',
  //   ).then((value) {
  //     emit(WhatsNewStateSuccess());
  //     api = value.data['articles'] ;
  //     print(value.data.toString());
  //   }).catchError((e) {
  //     emit(WhatsNewStateError(e.toString()));
  //     print(e.toString());
  //   });
  // }

   getNews() async{
    emit(WhatsNewStateLoading());
    try {
        http.Response response = await http.get('https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0ab84482c0034ebe914a7ff43ab6f72e');
       var api = json.decode(response.body);
         news = api['articles'] as List;
         print('al nateeeeeeeeeeeeeeg');
        print(news.toString());
        emit(WhatsNewStateSuccess());

    } on Exception catch (e) {
      emit(WhatsNewStateError(e.toString()));
      print(e.toString());
    }

 }
}