import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/countries/germany/cubit/states.dart';

class GermanyCubit extends Cubit<GermanyStates> {

  GermanyCubit() : super(GermanyStateInitial());

  static GermanyCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(GermanyStateLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=de&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(GermanyStateSuccess());

    } on Exception catch (e) {
      emit(GermanyStateError(e.toString()));
      print(e.toString());
    }

  }
}