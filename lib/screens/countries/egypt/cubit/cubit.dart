import 'dart:convert';
import 'package:news_app/screens/countries/egypt/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class EgyptCubit extends Cubit<EgyptStates> {

  EgyptCubit() : super(EgyptStateInitial());

  static EgyptCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(EgyptStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=eg&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(EgyptStateSuccess());

    } on Exception catch (e) {
      emit(EgyptStateError(e.toString()));
      print(e.toString());
    }

  }
}