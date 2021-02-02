import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/countries/canada/cubit/state.dart';


import 'package:http/http.dart' as http;

class CanadaCubit extends Cubit<CanadaStates> {

  CanadaCubit() : super(CanadaStateInitial());

  static CanadaCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(CanadaStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=ca&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(CanadaStateSuccess());

    } on Exception catch (e) {
      emit(CanadaStateError(e.toString()));
      print(e.toString());
    }

  }
}