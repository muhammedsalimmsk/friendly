// Import required packages
// Import required packages
import 'dart:convert';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:friendly_talks/controller/loginController/OTPController.dart';
import 'package:friendly_talks/registartions/otpverify2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:friendly_talks/api.dart';
import 'package:friendly_talks/registartions/login.dart';
import 'package:friendly_talks/registartions/otppage2.dart';
import 'package:friendly_talks/registartions/otpverify.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data/user_data/user_data.dart';

class Otppage extends StatefulWidget {
  Otppage({
    super.key,
  });

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  // Function to save API key to SharedPreferences
  Future<void> saveApiKeyToPrefs(String apiKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('API_KEY', apiKey);
  }

  // Function to fetch API key from SharedPreferences
  Future<String?> getApiKeyFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('API_KEY');
  }

  // Function to fetch data using the stored API key
  Future<UserData?> fetchData(
      BuildContext context, String country, String mobileNumber) async {
    try {
      // Fetch API key from SharedPreferences
      final apiKey = await getApiKeyFromPrefs();

      final url =
          'https://friendlytalks.in/admin/api/v1/index.php?token=$API_KEY';
      final response = await http.get(Uri.parse(url));
      final countrycode=country.substring(1);
      final compinedMobile="$countrycode$mobileNumber";

      if (response.statusCode == 200) {
        // final data = response.body;
        final data= UserData.fromJson(json.decode(response.body));
        if (data.hasMobileNumber(compinedMobile)) {
          print(compinedMobile);
          Get.to(Otpverify(mobileNumber: mobileNumber, countrycode: country));
          print("Mobile number exists in the UserData model.");
        } else {
          controller.generateOTP(4);
          await controller.sendOTPToAPI(controller.generatedOTP.value, compinedMobile);
          Get.to(const OtpVerifyNewUser());
          print("Mobile number does not exist in the UserData model.");
        }
        return data;
        // print('Data from API: $data');
        // Check if the entered mobile number is present in the API response

      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }


  }

  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  OTPController controller=Get.put(OTPController());
  final countryPicker = const  FlCountryCodePicker();

  CountryCode? countryCode;

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
          child: Form(
            key: _formKey,
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
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap:()async{
                              final code=
                              await countryPicker.showPicker(context: context);
                              setState(() {
                                countryCode=code;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  child:countryCode!=null
                                      ? countryCode!.flagImage()
                                      :null,),
                                SizedBox(width: 10,),
                                Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 16,
                                  vertical: 6),
                                  decoration:BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    countryCode?.dialCode??"+1",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:const EdgeInsets.symmetric(horizontal: 10),
                            width: 200,
                            child: TextFormField(
                              validator: (val){
                                if(val==null||val.length <10){
                                  return "please enter valid phone number";
                                }
                                else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              decoration: const InputDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            fetchData(context, countryCode!.dialCode,
                                phoneController.text);
                          }
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
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Login(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Login using Password',
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>  Otppage2(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Don't have an Account? Register Here.",
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ],
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
      ),
    );
  }








}
