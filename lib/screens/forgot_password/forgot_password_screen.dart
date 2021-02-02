import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/login/login_screen.dart';
import 'package:news_app/screens/sign_up/sign_up_screen.dart';
import 'package:news_app/shared/componentes/componentes.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgotPasswordScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
final auth = FirebaseAuth.instance ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password'),),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  child: logo(),
                ),
              ),

              SizedBox(
                height: 80,
              ),
              defaultTextBox(
                type: TextInputType.emailAddress,
                title: 'Your Email',
                hint: 'ziead@gmail.com',
                controller: emailController ,
              ),

              SizedBox(height: 20),
              // defaultTextBox(
              //   type: TextInputType.emailAddress,
              //   title: 'Password',
              //   hint: '************',
              //   controller: passController ,
              //   isPassword: true ,
              //
              // ),

              SizedBox(
                height: 65,
              ),
              defaultButton(
                function: (){
                  String email = emailController.text ;
                //  String pass = passController.text ;
                  if(email.isEmpty)
                  {
                    showToast(text: 'please enter a valid data', error:  true );
                    return ;
                  }
                  //cubit
                  auth.sendPasswordResetEmail(email: email);
                },
                text: 'Forget Password',
                toUpper: true ,
              ),

              SizedBox(
                height: 15,
              ),

               defaultButton(
                  function: () {
                    launch(
                      'https://news-app-ac4e7.firebaseapp.com/__/auth/action?mode=action&oobCode=code',
                    );
                    navigateAndFinish(context, LoginScreen());
                  },
                  text: "New Password",
                ),



            ],
          ),
        ),
      ),
    );
  }
}
