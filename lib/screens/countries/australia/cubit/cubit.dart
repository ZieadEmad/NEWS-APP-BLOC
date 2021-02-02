



import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/countries/australia/cubit/states.dart';
import 'package:http/http.dart' as http;
class AustraliaCubit extends Cubit<AustraliaStates> {

  AustraliaCubit() : super(AustraliaStateInitial());

  static AustraliaCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(AustraliaStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=au&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(AustraliaStateSuccess());

    } on Exception catch (e) {
      emit(AustraliaStateError(e.toString()));
      print(e.toString());
    }

  }
}