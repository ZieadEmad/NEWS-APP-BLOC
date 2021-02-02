import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/screens/login/cubit/cubit.dart';
import 'package:news_app/screens/sign_up/cubit/cubit.dart';
import 'package:news_app/screens/welcome/welcome_screen.dart';
import 'package:news_app/shared/network/local/local.dart';

import 'layout/home_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  var widget;

  await initpref().then((value)
  {
    if (getToken() != null && getToken().length > 0)
    {
      widget = HomeScreen() ;
    }
    else
    {
      widget = WelcomeScreen() ;
    }
  });


  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  var widget;

  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => SignUpCubit(),
        ),

        BlocProvider(
          create: (context) => LoginCubit(),
        ),

        BlocProvider(
          create: (context) => HomeCubit(),
        ),

      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: widget,
      ),
    );
  }
}


