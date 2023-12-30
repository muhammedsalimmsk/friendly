import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/call.dart';
import 'package:friendly_talks/calling/callhistory.dart';
import 'package:friendly_talks/coins/coins.dart';
import 'package:friendly_talks/coins/payment.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:friendly_talks/moresub/notifications.dart';
import 'package:friendly_talks/moresub/privacypolice.dart';
import 'package:friendly_talks/moresub/profile.dart';
import 'package:friendly_talks/moresub/refundpolicy.dart';
import 'package:friendly_talks/moresub/settings.dart';
import 'package:friendly_talks/moresub/termconditions.dart';
import 'package:friendly_talks/registartions/otppage.dart';

class More extends StatelessWidget {
  const More({super.key});

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
            // Menu Items
            buildMenuItem('Dashboard', icon: Icons.dashboard, onTap: () {
              // Navigate to Dashboard screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                    languages: [],
                    language: [],
                  ),
                ),
              );
            }),
            buildMenuItem('Profile', icon: Icons.person, onTap: () {
              // Navigate to Profile screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Profile(),
                ),
              );
            }),
            buildMenuItem('Notifications', icon: Icons.notifications,
                onTap: () {
              // Navigate to Notifications screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Notifications(),
                ),
              );
            }),
            buildMenuItem('Call History', icon: Icons.history, onTap: () {
              // Navigate to Call History screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CallHistory(),
                ),
              );
            }),
            buildMenuItem('Payment', icon: Icons.payment, onTap: () {
              // Navigate to Payment screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Payment(),
                ),
              );
            }),

            buildMenuItem('Terms and Conditions', icon: Icons.description,
                onTap: () {
              // Navigate to Terms and Conditions screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const TermConditions(),
                ),
              );
            }),
            buildMenuItem('Privacy Policy', icon: Icons.privacy_tip, onTap: () {
              // Navigate to Privacy Policy screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const PrivacyPolicy(),
                ),
              );
            }),
            buildMenuItem('Refund Policy', icon: Icons.assignment_return,
                onTap: () {
              // Navigate to Refund Policy screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RefundPolicy(),
                ),
              );
            }),
            buildMenuItem('Settings', icon: Icons.settings, onTap: () {
              // Navigate to Settings screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Settings(),
                ),
              );
            }),
            const SizedBox(height: 20),
            // Logout
            buildMenuItem('Logout', icon: Icons.exit_to_app, onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Otppage(),
                ),
              );
            }),
            // Add additional scrolling content here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4, // Set the initial selected index (Home in this case)
        onTap: (int index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const Coins(), // Replace 'Home' with your actual screen widget
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
                  builder: (BuildContext context) =>
                      const Notifications(), // Replace 'Home' with your actual screen widget
                ),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const More(), // Replace 'Home' with your actual screen widget
                ),
              );
              break;
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

  Widget buildMenuItem(String title, {IconData? icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: icon != null ? Icon(icon) : null,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
