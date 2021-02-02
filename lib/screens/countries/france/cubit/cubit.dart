import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/countries/france/cubit/states.dart';

class FranceCubit extends Cubit<FranceStates> {

  FranceCubit() : super(FranceStateInitial());

  static FranceCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(FranceStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=fr&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(FranceStateSuccess());

    } on Exception catch (e) {
      emit(FranceStateError(e.toString()));
      print(e.toString());
    }

  }
}