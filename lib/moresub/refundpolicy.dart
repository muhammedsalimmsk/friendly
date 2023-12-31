// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/call.dart';
import 'package:friendly_talks/coins/coins.dart';
import 'package:friendly_talks/home/home.dart';
import 'package:friendly_talks/more/more.dart';
import 'package:friendly_talks/moresub/notifications.dart';

class RefundPolicy extends StatelessWidget {
  const RefundPolicy({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            elevation: 30.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refund Policy',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Text(
                    'If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns.The following terms are applicable for any products that You purchased with Us..',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Interpretation and Definitions',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Interpretation',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Definitions',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'For the purposes of this Return and Refund Policy:Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Friendlytalks, Kerala,India.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Goods refer to the items offered for sale on the Service.Orders mean a request by You to purchase Goods from Us.Service refers to the Website.Website refers to Friendlytalks, accessible from https://friendlytalks.inYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Your Order Cancellation Rights',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'You are entitled to cancel Your Order within 7 days without giving any reason for doing so.The deadline for cancelling an Order is 7 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:By visiting this page on our website: https://friendlytalks.in.We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Conditions for Returns',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'In order for the Goods to be eligible for a return, please make sure that:The Goods were purchased in the last 7 days.The Goods are in the original packagingThe following Goods cannot be returned:.The supply of Goods made to Your specifications or clearly personalized.The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10.0),

                  // Add more policy details as needed
                ],
              ),
            ),
          ),
          // Add more cards for different sections of the policy if necessary
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        onTap: (int index) {
          switch (index) {
            case 0:
              // Reload the Home page
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
}
