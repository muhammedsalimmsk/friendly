import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:friendly_talks/controller/loginController/OTPController.dart';
import 'package:friendly_talks/helper/HelperFunction.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../../models/user_data/current_user/current_user.dart';

class LoginController extends GetxController {

  final TextEditingController otpController = TextEditingController();
  String apiUrl= "https://friendlytalks.in/admin/api/v1/sendotp.php?token=c97369129e36336e71096aabf2270aba&user_id=$userId";
  OTPController controller=Get.put(OTPController());
  var currentUser = CurrentUser().obs;

  void verifyOTP() {
    // Check if the entered OTP matches the generated OTP
    if (otpController.text == controller.generatedOTP.value) {
      print('OTP matched! Proceed to registration page.');
      fetchDataFromApi(apiUrl).whenComplete(() => Get.to(Home(languages: ["english"], language: ["hsjk"],)));
      // Add your navigation logic to the registration page here using Get.to or Get.off
    } else {
      print('Invalid OTP. Please try again.');
      // Handle the case when the OTPs do not match, you might want to give the user another chance or take appropriate action.
    }
  }

  Future<CurrentUser?> fetchDataFromApi(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print("called");
        // If the server returns a 200 OK response, parse the JS
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        currentUser(CurrentUser.fromJson(jsonResponse));
      } else {
        // If the server d
        // id not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

}
