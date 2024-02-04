import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              )),
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: StreamUserAvatar(
                user: StreamChat.of(context).currentUser!,
                showOnlineStatus: false,
              ),
              title: Text(
                StreamChat.of(context).currentUser!.name,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "Description",
                style: TextStyle(color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.qrcode,
                    color: Color.fromRGBO(0, 168, 132, 1),
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.abc),
              title: const Text(
                "Hello1",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text("Bye1"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.abc),
              title: const Text(
                "Hello1",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text("Bye1"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.abc),
              title: const Text(
                "Hello1",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text("Bye1"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.abc),
              title: const Text(
                "Hello1",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text("Bye1"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.abc),
              title: const Text(
                "Hello1",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text("Bye1"),
            ),
          ],
        ),
      ),
    );
  }
}
