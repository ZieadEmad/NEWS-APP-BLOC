import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/countries/united_states/cubit/states.dart';

class UnitedStatesCubit extends Cubit<UnitedStatesStates> {

  UnitedStatesCubit() : super(UnitedStatesInitial());

  static UnitedStatesCubit get(context) => BlocProvider.of(context);
  var news = [] ;

  getNews() async{
    emit(UnitedStatesLoading());
    try {
      http.Response response = await http.get(
          'http://newsapi.org/v2/top-headlines?country=us&apiKey=0ab84482c0034ebe914a7ff43ab6f72e'
      );
      var api = json.decode(response.body);
      news = api['articles'] as List;
      print(news.toString());
      emit(UnitedStatesSuccess());

    } on Exception catch (e) {
      emit(UnitedStatesError(e.toString()));
      print(e.toString());
    }

  }
}