import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/call.dart';
import 'package:friendly_talks/coins/recharge.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:friendly_talks/more/more.dart';
import 'package:friendly_talks/moresub/notifications.dart';

class Coins extends StatelessWidget {
  const Coins({
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Athira',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to coin collection page
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CoinCollectionPage()));
                      },
                      child: const Text(
                        ' 900',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Coin Balance
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' ',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the recharge page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Recharge(), // Replace with the actual name of your recharge page
                        ),
                      );
                    },
                    child: const Text('Add Coins'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Debit and Credit Card Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle debit card button press
                    },
                    child: const Text('COIN DEBIT'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle credit card button press
                    },
                    child: const Text('COIN CREDIT'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Money Symbol and Text
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: 1,
          onTap: (int index) {
            switch (index) {
              case 0:
                // Reload the Home page
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
                icon: Icon(Icons.call, size: 32.0), // Increase the icon size
                label: 'Call'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ));
  }
}
