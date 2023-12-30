// ignore: avoid_web_libraries_in_flutter

// ignore: avoid_web_libraries_in_flutter

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/call.dart';
import 'package:friendly_talks/calling/calling.dart';
import 'package:friendly_talks/coins/coins.dart';
import 'package:friendly_talks/coins/recharge.dart';
import 'package:friendly_talks/more/more.dart';
import 'package:friendly_talks/moresub/listnerspage.dart';
import 'package:friendly_talks/moresub/notifications.dart';
import 'package:friendly_talks/moresub/profile.dart';
import 'package:friendly_talks/talkinglist/friendly.dart';
import 'package:friendly_talks/talkinglist/professional.dart';

class Home extends StatelessWidget {
  final List<String> languages;

  const Home({
    super.key,
    required this.languages,
    required List<String> language,
  });

  BuildContext? get builderContext => null;

  // ignore: unused_element
  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    Null Function() param3,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/friendly.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 5.0),
                    const Text(
                      'Friendly Talks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle language filter selection here
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'malayalam',
                  child: buildLanguageMenuItem('Malayalam'),
                ),
                PopupMenuItem<String>(
                  value: 'english',
                  child: buildLanguageMenuItem('English'),
                ),
                PopupMenuItem<String>(
                  value: 'hindi',
                  child: buildLanguageMenuItem('Hindi'),
                ),
                PopupMenuItem<String>(
                  value: 'tamil',
                  child: buildLanguageMenuItem('Tamil'),
                ),
              ],
              icon: const Icon(Icons.language),
              // Set the language icon here
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              // Profile Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/photo.jpg'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Athira',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

// Decrease the height of the SizedBox
              const SizedBox(
                  height:
                      5), // Adjust the height value according to your preference

// Image Slider Section
              CarouselSlider(
                items: [
                  Image.asset('assets/images/slide.jpg'),
                  Image.asset('assets/images/slide.jpg'),
                  Image.asset('assets/images/slide.jpg'),
                ],
                options: CarouselOptions(
                  height: 130.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 16.0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 40.0, // Adjusted the height
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.3, // Adjusted the viewportFraction
                    reverse: true,
                  ),
                  items: [
                    _buildLanguageBox('English'),
                    _buildLanguageBox('malayalam'),
                    _buildLanguageBox('Tamil'),
                    _buildLanguageBox('Telgu'),
                    _buildLanguageBox('Hindi'),
                    // Add more language boxes as needed
                  ],
                ),
              ),

              // Adjust the height value according to your preference

// Language Selection Section

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to FriendlyListenersPage when "Friendly Listeners" is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Friendly(),
                            ),
                          );
                        },
                        child: _buildCategoryBox(
                          'Friendly Listeners',
                          'assets/images/friendly.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to ProfessionalListenersPage when "Professional Listeners" is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Professional(),
                            ),
                          );
                        },
                        child: _buildCategoryBox(
                          'Professional Listeners',
                          'assets/images/friendly.png', // Add the path to your professional listeners icon
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Buttons for Coins and Top-up
              // Buttons for Coins and Top-up
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Coins(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: _buildCoinsButton(
                                context), // Separate method/widget for Coins button
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Recharge(),
                              ),
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: _buildTopUpButton(
                                context), // Separate method/widget for Top-up Now button
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Call History Section
              Center(
                child: Container(
                  width: 370,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to ListnersPage when the first item is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListnersPage(
                                listenerName: null,
                                imagePath: '',
                              ),
                            ),
                          );
                        },
                        child: _buildCallHistoryTile(
                          'Athira',
                          'assets/images/photo.jpg',
                          'Coins: 200/min | Rating: 4.5',
                          online: true,
                          context: context,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to ListnersPage when the second item is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListnersPage(
                                listenerName: null,
                                imagePath: '',
                              ),
                            ),
                          );
                        },
                        child: _buildCallHistoryTile(
                          'Rithu mohan',
                          'assets/images/photo.jpg',
                          'Coins: 150/min | Rating: 4.2',
                          online: true,
                          context: context,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to ListnersPage when the third item is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListnersPage(
                                listenerName: null,
                                imagePath: '',
                              ),
                            ),
                          );
                        },
                        child: _buildCallHistoryTile(
                          'Sithara',
                          'assets/images/photo.jpg',
                          'Coins: 200/min | Rating: 3.5',
                          online: false,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (int index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ),
                ),
              );
              break;

            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Coins(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Call(),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Notifications(),
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const More(),
                ),
              );
              break;

            // ... rest of your cases
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Coins'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

Widget _buildLanguageBox(String language, {bool specialDecoration = false}) {
  return Container(
    decoration: BoxDecoration(
      color: specialDecoration ? Colors.blue : Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: specialDecoration
          ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]
          : [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
    ),
    child: Center(
      child: Text(
        language,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ),
  );
}

class SlideCheckbox extends StatelessWidget {
  final ValueChanged<bool>? onChanged;

  const SlideCheckbox({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(true);
        }
      },
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.8, 0.0),
        ).animate(CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1.0),
          curve: Curves.easeInOut,
        )),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.check,
                size: 16,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Modify the _buildLanguageSlide method to return a widget suitable for the slider

Widget _buildCategoryBox(String title, String imagePath) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    width: 170, // Adjust the width of the category boxes
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}

// ignore: unused_element
Widget _buildCallHistoryTile(String name, String imagePath, String subtitle,
    {required bool online, required BuildContext context}) {
  String statusText = online ? 'In Call' : 'Offline';

  return ListTile(
    leading: const CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage('assets/images/photo.jpg'),
    ),
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          statusText,
          style: TextStyle(
            fontSize: 14,
            color: online ? Colors.green : Colors.red,
          ),
        ),
      ],
    ),
    trailing: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Calling(
              personName: 'Athira',
              profileImageUrl: 'assets/images/photo.jpg',
              channelName: 'test',
            ),
          ),
        );

        // Handle call icon tap
      },
      child: Icon(
        Icons.call,
        color: online ? Colors.green : Colors.red,
      ),
    ),
  );
}

// ignore: unused_element
void _handleCallIconTap(BuildContext context) {
  if (kDebugMode) {
    print("Handling call icon tap");
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Calling(
        personName: 'Athira',
        profileImageUrl: 'assets/images/photo.jpg ',
        channelName: 'test',
      ),
    ),
  );
}

Widget buildLanguageMenuItem(String language) {
  return Row(
    children: [
      Checkbox(
        value: true, // Adjust based on your logic
        onChanged: (bool? value) {
          // Handle checkbox state change if needed
        },
      ),
      Text(language),
    ],
  );
}

Widget _buildCoinsButton(BuildContext context) {
  return _buildActionButton(
    'Coins',
    Icons.monetization_on,
    Colors.white,
    () {
      // Navigate to Recharge screen when Coins button is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Coins(),
        ),
      );
    },
  );
}

Widget _buildTopUpButton(BuildContext context) {
  return _buildActionButton(
    'Top-up Now',
    Icons.credit_card,
    Colors.white,
    () {
      // Navigate to Recharge screen when Top-up Now button is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Recharge(),
        ),
      );
    },
  );
}

Widget _buildActionButton(
    String label, IconData icon, Color color, Null Function() onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(label),
      ],
    ),
  );
}
