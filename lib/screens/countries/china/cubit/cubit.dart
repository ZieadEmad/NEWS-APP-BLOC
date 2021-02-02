import 'dart:convert';
import 'package:news_app/screens/countries/china/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class ChinaCubit extends Cubit<ChinaStates> {

  ChinaCubit() : super(ChinaStateInitial());

  static ChinaCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(ChinaStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=cn&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(ChinaStateSuccess());

    } on Exception catch (e) {
      emit(ChinaStateError(e.toString()));
      print(e.toString());
    }

  }
}