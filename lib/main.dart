import 'package:csi_stream/screens/cam.dart';
import 'package:csi_stream/screens/home.dart';
import 'package:csi_stream/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final chatPersistentClient = StreamChatPersistenceClient(
    logLevel: Level.INFO,
    connectionMode: ConnectionMode.background,
  );

  final client = StreamChatClient('pgngfnbpjdf2', logLevel: Level.INFO);

  // const nameid = 'Super Mario';
  const userid = 'super_mario_og';

  await client.connectUser(
      User(
          // name: nameid,
          role: 'admin',
          image:
              'https://th.bing.com/th/id/OIP.XL9QyTVGCBSVwhEM6Cy9KAAAAA?rs=1&pid=ImgDetMain',
          id: userid,
          extraData: const {'description': 'Hey there, I am using ChatHub'}),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3VwZXJfbWFyaW9fb2cifQ.ffMcvt7Afz6khYJG0RG21YmH1Ez1ddWxwA4mGMem0ss');

  runApp(
    MyApp(
      client: client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
  });

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Chat CSI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(18, 27, 34, 1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(0, 168, 132, 1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      builder: (context, widget) {
        return StreamChat(
          client: client,
          streamChatThemeData: StreamChatThemeData(
              channelPreviewTheme: const StreamChannelPreviewThemeData(
                  titleStyle: TextStyle(color: Colors.white)),
              brightness: Brightness.dark,
              textTheme: StreamTextTheme.dark(),
              colorTheme: StreamColorTheme.dark(),
              messageListViewTheme: const StreamMessageListViewThemeData(
                backgroundColor: Color.fromRGBO(18, 27, 34, 1),
                // backgroundImage: DecorationImage(image: )
              ),
              messageInputTheme: const StreamMessageInputThemeData(),
              channelHeaderTheme: const StreamChannelHeaderThemeData(
                  // color: Color.fromRGBO(31, 44, 52, 1),
                  )),
          child: widget,
        );
      },
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/home': (context) => const Home(),
        '/sign-in': (context) => Login(),
        '/camera': (context) => const CameraApp(),
      },
    );
  }
}
