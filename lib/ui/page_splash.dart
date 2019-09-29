import 'dart:async';
import 'package:farfromhome/ui/page_forgotpass.dart';
import 'package:farfromhome/ui/page_signup.dart';
import 'package:flutter/material.dart';
import 'package:farfromhome/ui/first_screen.dart';
import 'package:farfromhome/utils/utils.dart';
import 'package:responsive_container/responsive_container.dart';
import '../LocalBindings.dart';
import 'page_home.dart';
import 'page_login.dart';
import 'page_onboarding.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Screen size;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
       navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
     size = Screen(MediaQuery.of(context).size);
    return Scaffold(
      body: ResponsiveContainer(
        widthPercent: 100,
        heightPercent: 100,
        child: Container(
          color: Color(0xfff8f5f0),    // white color
          //color: Color(0xff1869d9),  // blue color
          child: Image.asset(
            'assets/city.gif'         // white gif
            //'assets/gif/city_blue.gif'  // blue gif
            ),
          ),
        ),
    );
  }

  Future navigateFromSplash () async {

    String isOnBoard = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);
      print("isOnBoard  $isOnBoard");
      if(isOnBoard ==null || isOnBoard == "0"){
        //Navigate to OnBoarding Screen.
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen()));
      }
  }
}