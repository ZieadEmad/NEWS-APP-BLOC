import 'package:flutter/material.dart';
import 'package:news_app/screens/welcome/welcome_screen.dart';
import 'package:news_app/shared/componentes/componentes.dart';
import 'package:news_app/shared/network/local/local.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: AppBar(title: Text('Settings'),),
      drawer: buildDrawer(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              buildOneCardSettings(
                title: 'Account Settings',
                fisrtText: 'Account Security',
                firstHeroTag: '1',
                firstFunction: (){},

                secondText: 'Email Notifications',
                secondHeroTag: '2',
                secondFunction: (){},
                thirdText: 'Push Notifications',
                thirdHeroTag: '3',
                thirdFunction: (){},
              ),
              buildOneCardSettings(
                title: 'Support',
                fisrtText: 'About App',
                firstHeroTag: '4',
                firstFunction: (){},

                secondText: 'Frequently asked questions',
                secondHeroTag: '5',
                secondFunction: (){},
                thirdText: 'Contact Us',
                thirdHeroTag: '6',
                thirdFunction: (){},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          defaultButton(
            text: 'Logout',
            function: () {
              removeToken();
              navigateAndFinish(context, WelcomeScreen());
            },
            background: Colors.red,
            toUpper: true,
            width: 160,
          ),
        ],
      ),
    );
  }
}
