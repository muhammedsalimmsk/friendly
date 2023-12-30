import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/call.dart';
import 'package:friendly_talks/coins/coins.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:friendly_talks/more/more.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
            onPressed: () {
              // Navigate back to the home screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ), // Replace with your home screen widget
                ),
              );
            },
          ),
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
              icon: const Icon(Icons.language), // Set the language icon here
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 20),
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
              child: TextButton(
                onPressed: () {
                  // Handle the onPressed event
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.delete, // Replace with the desired icon
                      color: Colors.purple,
                    ),
                    SizedBox(
                        width: 5.0), // Add some spacing between icon and text
                    Text(
                      'Clear All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification with image
                  _buildNotificationWithImage(
                    'Jasmine is online now!',
                    'Click to talk now',
                    '3 days 18 hrs 51 mins',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                  // Notification with image
                  _buildNotificationWithImage(
                    'Nidha is online now',
                    'click to talk now',
                    '7 days 7hrs 12 min',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                  // Notification with image
                  _buildNotificationWithImage(
                    'Haii are you free now! Rithu waiting for your call ..',
                    'Haii are you free now! Rithu waiting for your call ..',
                    '1 days 6 hrs 46 mins',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                  // Notification with image
                  _buildNotificationWithImage(
                    'Athira is Online Now !',
                    'Click to Talk Now',
                    '1 days 4hrs 46 mins',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                  const Divider(),
                  // Notification with image
                  _buildNotificationWithImage(
                    'Anjaly  is Online Now !',
                    'Click to Talk Now',
                    '1 days 8 hrs 46 mins',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                  const Divider(),
                  // Notification with image
                  _buildNotificationWithImage(
                    'pooja is Online Now !',
                    'Click to Talk Now',
                    '9 days 6 hrs 46 mins',
                    'assets/images/friendly.png',
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        onTap: (int index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [], // Provide the necessary data if needed
                    language: [], // Provide the necessary data if needed
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
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Coins'),
          BottomNavigationBarItem(
              icon: Icon(Icons.call, size: 32.0), label: 'Call'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  // Helper method to build a notification with an image
  Widget _buildNotificationWithImage(
    String title,
    String subtitle,
    String time,
    String imagePath,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
