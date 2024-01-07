import 'dart:math';
import 'package:friendly_talks/registartions/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  RxString generatedOTP = ''.obs;
  RxBool isLoading = false.obs;


  void verifyOTP() {
    // Check if the entered OTP matches the generated OTP
    if (otpController.text == generatedOTP.value) {
      print('OTP matched! Proceed to registration page.');
      Get.to(RegisterNewUser());
      // Add your navigation logic to the registration page here using Get.to or Get.off
    } else {
      print('Invalid OTP. Please try again.');
      // Handle the case when the OTPs do not match, you might want to give the user another chance or take appropriate action.
    }
  }

  String generateOTP(int length) {
    const chars = '0123456789';
    final random = Random();
    String otp = '';

    for (int i = 0; i < length; i++) {
      otp += chars[random.nextInt(chars.length)];
    }
    generatedOTP.value = otp;
    return otp;
  }

  Future<void> sendOTPToAPI(otpCode, phoneNumber) async {
    try {
      isLoading(true);
      // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint
      final apiUrl =
          'https://friendlytalks.in/admin/api/v1/newotp.php?token=c97369129e36336e71096aabf2270aba&mobile=$phoneNumber&otp=$otpCode';

      // Replace 'YOUR_API_KEY' with any authentication header or key if required by your API
      // final headers = {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer YOUR_API_KEY',
      // };

      // Replace 'otp' with the query parameter expected by your API
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        print('OTP sent to API successfully!');
        // Handle the API response if needed
      } else {
        print('Failed to send OTP to API. Status code: ${response.statusCode}');
        // Handle the error
      }
    } catch (e) {
      print('Error sending OTP to API: $e');
      // Handle the error
    } finally {
      isLoading(false);
    }
  }
}
