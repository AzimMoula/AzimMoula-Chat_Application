import 'package:csi_stream/screens/home.dart';
import 'package:csi_stream/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final client = StreamChatClient('pgngfnbpjdf2', logLevel: Level.INFO);

  const userid = 'test_user_1';
  await client.connectUser(User(id: userid),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGVzdF91c2VyXzEifQ.4jGXnMAJEGh3l_TVjPHKMNQsupfxkvi0wDvnrEZmkX8');

  final channel =
      client.channel('messaging', id: '1c3ac39d-2b41-4da6-a22d-62bcb60df9f8');

  await channel.watch();

  runApp(
    MyApp(
      client: client,
      channel: channel,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
    required this.channel,
  });

  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Chat CSI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(18, 27, 34, 1),
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(0, 168, 132, 1),
        ),
        useMaterial3: true,
      ),
      builder: (context, widget) {
        return StreamChat(
          client: client,
          streamChatThemeData: StreamChatThemeData(
              colorTheme: StreamColorTheme.dark(),
              channelHeaderTheme: const StreamChannelHeaderThemeData(
                color: Color.fromRGBO(31, 44, 52, 1),
              )),
          child: widget,
        );
      },
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/home': (context) => const Home(),
        '/sign-in': (context) => Login(),
      },
    );
  }
}
