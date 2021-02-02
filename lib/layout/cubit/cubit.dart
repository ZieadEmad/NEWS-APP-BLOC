import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/screens/countries/countries_screen.dart';
import 'package:news_app/screens/head_news/head_news_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/screens/whats_new/whats_new_screen.dart';

class HomeCubit extends Cubit<HomeStates> {

HomeCubit() : super(HomeStateInitial());

static HomeCubit get(context) => BlocProvider.of(context);

var widget = [
  WhatsNewScreen(),
  HeadNewsScreen(),
  CountriesScreen(),
  SettingsScreen(),
];

var title = [
  'Whats News',
  'Head News',
  'All Countries',
  'Settings',
];

int currentIndex = 0 ;

changeIndex(index){
  currentIndex = index ;
  emit(HomeStateIndex());
}

}