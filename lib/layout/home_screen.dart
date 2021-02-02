import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/colors/colors.dart';
import 'package:news_app/shared/componentes/componentes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var currentIndex = HomeCubit.get(context).currentIndex;
        return Scaffold(
          appBar: AppBar(title: Text(HomeCubit.get(context).title[currentIndex])),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 15,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/news_logo.png'),width: 50,height: 45,),
                  label: 'Whats News',
                ),
                BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/newspaper.png'),width: 50,height: 45,),
                  label: 'Head News',
                ),
                BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/earth-globe.png'),width: 50,height: 45,),
                  label: 'Countries News',
                ),
                BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/settings.png'),width: 50,height: 45,),
                  label: 'Settings',
                ),
              ],
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: defaultColor,
              currentIndex: currentIndex,
            ),
          ),
          body: HomeCubit.get(context).widget[currentIndex],
          drawer: buildDrawer(context),
        );
      },
    );
  }
}
