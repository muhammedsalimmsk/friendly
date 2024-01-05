import 'package:flutter/material.dart';
import 'package:friendly_talks/registartions/otpverify2.dart';
import 'package:get/get.dart';
import '../controller/loginController/OTPController.dart';

class Otppage2 extends StatelessWidget {
  Otppage2({super.key});

  final countryController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                height: 590,
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
                      'Please Enter your Number',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: countryController,
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          suffixIcon: Icon(Icons.location_searching_rounded),
                          labelStyle: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          suffixIcon: Icon(Icons.phone_callback),
                          labelStyle: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const OtpVerifyNewUser(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.pink, Colors.pink],
                          ),
                        ),
                        child: const Text(
                          'PROCEED SECURELY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
