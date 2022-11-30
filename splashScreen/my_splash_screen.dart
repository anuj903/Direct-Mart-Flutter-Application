import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:users_dm/authScreens/auth_screen.dart';
import 'package:users_dm/sellersScreens/home_screen.dart';



class MySplashScreen extends StatefulWidget
{

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  splashScreenTimer(){
    Timer(const Duration(seconds: 4),() async
    {
      // user is already logged in
      if (FirebaseAuth.instance.currentUser != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> HomeScreen()));
      }
      // user is NOT already logged in
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> AuthScreen()));
      }


    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                Colors.pinkAccent,
                Colors.purpleAccent
              ],
              begin:  FractionalOffset(0.0,0.0),
              end: FractionalOffset(1.0,0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,

            )
        ),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Image.asset("images/welcome.png"
                ),
              ),

              const SizedBox(height: 10,),

              const Text(
                  "Direct Mart Users App",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              
            ],
          ),
        ),
      ),

    );
  }
}

    