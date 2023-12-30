import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class VideoCalling extends StatefulWidget {
  final String personName;
  final String profileImageUrl;
  final RtcEngine rtcEngine; // Agora Engine

  const VideoCalling({
    Key? key,
    required this.personName,
    required this.profileImageUrl,
    required this.rtcEngine,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoCallingState createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  @override
  Widget build(BuildContext context) {
    // Implement your video calling UI and logic using Agora SDK here
    // You can use the widget.rtcEngine to access the Agora Engine instance

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personName),
      ),
      body: const Center(
        child: Text('Video Calling Screen'),
      ),
    );
  }
}
