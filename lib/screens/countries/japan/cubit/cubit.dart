import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/countries/japan/cubit/states.dart';

class JapanCubit extends Cubit<JapanStates> {

  JapanCubit() : super(JapanStateInitial());

  static JapanCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(JapanStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=jp&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(JapanStateSuccess());

    } on Exception catch (e) {
      emit(JapanStateError(e.toString()));
      print(e.toString());
    }

  }
}