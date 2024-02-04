import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_video/stream_video.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart' as sv;

Future<void> main() async {
  // Ensure Flutter is able to communicate with Plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Stream video and set the API key along with the user for our app.
  final client = StreamVideo(
    'pgngfnbpjdf2',
    user: const sv.User(
        info: UserInfo(id: 'super_mario_og', name: 'Super Mario')),
    userToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3VwZXJfbWFyaW9fb2cifQ.ffMcvt7Afz6khYJG0RG21YmH1Ez1ddWxwA4mGMem0ss',
    options: const StreamVideoOptions(
      logPriority: Priority.info,
    ),
  );

  // Set up our call object
  final call = client.makeCall(type: 'default', id: '345');
  await call.getOrCreate();
  // Connect to the call we created
  await call.join();
  call.setScreenShareEnabled(enabled: true);
  call.setMicrophoneEnabled(enabled: true);
  call.setCameraEnabled(enabled: true);
  runApp(
    MaterialApp(
      home: CallsApp(
        call: call,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CallsApp extends StatelessWidget {
  const CallsApp({super.key, required this.call});

  final Call call;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection
            .ltr, // or TextDirection.rtl based on your app's language direction
        child: Scaffold(
          body: sv.StreamCallContainer(
            call: call,
          ),
        ),
      ),
    );
  }
}
