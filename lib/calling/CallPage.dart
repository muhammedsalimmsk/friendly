// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendly_talks/calling/calling.dart';
import 'package:permission_handler/permission_handler.dart';

class Callpage extends StatelessWidget {
  final TextEditingController myController = TextEditingController();

  Callpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool validateError;

                if (myController.text.isEmpty) {
                  validateError = true;
                } else {
                  validateError = false;
                }

                await someFunction(context, validateError);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> someFunction(BuildContext context, bool validateError) async {
    if (validateError) {
      if (kDebugMode) {
        print('Validation error!');
      }
      return;
    }

    await _requestPermissions();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(channelName: myController.text),
      ),
    );
  }

  Future<void> _requestPermissions() async {
    var statusCamera = await Permission.camera.request();
    var statusMicrophone = await Permission.microphone.request();

    if (statusCamera.isDenied || statusMicrophone.isDenied) {
      if (kDebugMode) {
        print('Permission denied!');
      }
    }
  }
}

class CallPage extends StatelessWidget {
  final String channelName;

  const CallPage({super.key, required this.channelName});

  @override
  Widget build(BuildContext context) {
    // Your CallPage implementation goes here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Page'),
      ),
      body: Center(
        child: Text('Channel Name: $channelName'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Calling(
      profileImageUrl: '',
      personName: '',
      channelName: 'test',
    ),
  ));
}
