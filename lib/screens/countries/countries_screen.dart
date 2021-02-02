import 'package:flutter/material.dart';
import 'package:news_app/screens/countries/australia/australia_screen.dart';
import 'package:news_app/screens/countries/canada/canada_screen.dart';
import 'package:news_app/screens/countries/china/china_screen.dart';
import 'package:news_app/screens/countries/egypt/egypt_screen.dart';
import 'package:news_app/screens/countries/germany/germany_screen.dart';
import 'package:news_app/screens/countries/japan/japan_screen.dart';
import 'package:news_app/screens/countries/united_states/united_state_screen.dart';
import 'package:news_app/shared/componentes/componentes.dart';

import 'france/france_screen.dart';

class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    buildCountryItem(
                      function: () {navigateTo(context, EgyptScreen());},
                      title: 'Egypt',
                      shape: Image(image: AssetImage('assets/images/egypt.png'),),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    buildCountryItem(
                      function: () {navigateTo(context, UnitedStatesScreen());},
                      title: 'United States',
                      shape: Image(image: AssetImage('assets/images/united-states.png'),),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    buildCountryItem(
                      function: () {navigateTo(context, GermanyScreen());},
                      title: 'Germany',
                      shape: Image(image: AssetImage('assets/images/germany.png'),),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    buildCountryItem(
                      function: () {navigateTo(context, AustraliaScreen());},
                      title: 'Australia',
                      shape: Image(image: AssetImage('assets/images/australia.png'),),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    buildCountryItem(
                      function: () {navigateTo(context, CanadaScreen());},
                      title: 'Canada',
                      shape: Image(image: AssetImage('assets/images/canada.png'),),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    buildCountryItem(
                      function: () {navigateTo(context, JapanScreen());},
                      title: 'Japan',
                      shape: Image(image: AssetImage('assets/images/japan.png'),),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    buildCountryItem(
                      function: () {navigateTo(context,FranceScreen());},
                      title: 'France',
                      shape: Image(image: AssetImage('assets/images/france.png'),),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    buildCountryItem(
                      function: () {navigateTo(context, ChinaScreen());},
                      title: 'China',
                      shape: Image(image: AssetImage('assets/images/china.png'),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
