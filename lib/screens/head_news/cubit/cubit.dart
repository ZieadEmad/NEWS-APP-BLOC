import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/head_news/cubit/states.dart';
import 'package:http/http.dart' as http;
class HeadNewCubit extends Cubit<HeadNewStates> {

  HeadNewCubit() : super(HeadNewStateInitial());

  static HeadNewCubit get(context) => BlocProvider.of(context);
  var news = [] ;
  getNews() async{
    emit(HeadNewStateLoading());
    try {
      http.Response response = await http.get('https://newsapi.org/v2/top-headlines?q=trump&apiKey=0ab84482c0034ebe914a7ff43ab6f72e');
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print('al nateeeeeeeeeeeeeeg');
      print(news.toString());
      emit(HeadNewStateSuccess());

    } on Exception catch (e) {
      emit(HeadNewStateError(e.toString()));
      print(e.toString());
    }

  }
}