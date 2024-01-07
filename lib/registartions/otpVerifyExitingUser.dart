import 'package:flutter/material.dart';
import 'package:friendly_talks/controller/loginController/OTPController.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:get/get.dart';

import '../controller/loginController/LoginController.dart';

class OtpVerifyExitingUser extends StatelessWidget {
  final String mobileNumber;
  const OtpVerifyExitingUser(
      {super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    LoginController loginController=Get.put(LoginController());
    OTPController controller=Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,

          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Flexible(
                child: Image.asset('assets/images/friendly.png',
                    height: 500, width: 500),
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'OTP verification Here',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: loginController.otpController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                             loginController.verifyOTP();
                            },
                            child: const Text('Verify OTP'),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              controller.generateOTP(4);
                              print("from text button");
                              controller.sendOTPToAPI(controller.generatedOTP, mobileNumber);
                            },
                            child: const Text('Resend OTP'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
