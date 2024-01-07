// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/homepages.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:friendly_talks/registartions/otppage.dart';
import 'package:get/get.dart';

import '../controller/loginController/LoginController.dart';
import '../helper/HelperFunction.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  LoginController loginController =Get.put(LoginController());
  @override
  void initState() {
    getUserLoggedInStatus();
    getUserId();
    print("called from home page");
    loginController.fetchDataFromApi(loginController.apiUrl);
    super.initState();

    Timer(const Duration(seconds: 5), () {
      print(_isSignedIn);
      Get.to(_isSignedIn? Home(languages: ["english"], language: ["malayalam"]):Otppage());
    });
  }

  bool _isSignedIn=false;

  getUserLoggedInStatus()async{
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if(value!=null){
        setState(() {
          _isSignedIn=value;
        });
      }
    });
  }
  getUserId()async{
    await HelperFunction.getUserIdFromSF().then((value) {
      if(value!=null){
        print("userId successfully inited");
        setState(() {
          userId=value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 39, 151),
              Color.fromARGB(255, 176, 39, 128),
              Color.fromARGB(255, 176, 39, 153),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Remove the Image.asset widget

            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/mainimage.jpg',
                            height: 250,
                            width: 250,
                          ),
                        ),
                      ),
                      const Text(
                        'Friendly Talks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
