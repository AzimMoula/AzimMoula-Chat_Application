import 'package:csi_stream/screens/settings/about.dart';
import 'package:csi_stream/screens/settings/account.dart';
import 'package:csi_stream/screens/settings/chats.dart';
import 'package:csi_stream/screens/settings/notifications.dart';
import 'package:csi_stream/screens/settings/privacy.dart';
import 'package:csi_stream/screens/settings/profile.dart';
import 'package:csi_stream/screens/settings/storage.dart';
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
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => const Profile()));
              },
              horizontalTitleGap: 30,
              leading: StreamUserAvatar(
                borderRadius: BorderRadius.circular(50),
                constraints:
                    const BoxConstraints(minHeight: 100, minWidth: 100),
                user: StreamChat.of(context).currentUser!,
                showOnlineStatus: false,
              ),
              title: Text(
                StreamChat.of(context).currentUser!.name,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                StreamChat.of(context)
                    .currentUser!
                    .extraData['description']
                    .toString(),
                style: const TextStyle(color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              trailing: const Icon(CupertinoIcons.qrcode,
                  color: Color.fromRGBO(0, 168, 132, 1)),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const Account()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.key),
                    ),
                  ),
                  title: const Text(
                    "Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Privacy()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.lock_fill),
                    ),
                  ),
                  title: const Text(
                    "Privacy",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => const Chats()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.chat_bubble_fill),
                    ),
                  ),
                  title: const Text(
                    "Chats",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const Notifications()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.app_badge),
                    ),
                  ),
                  title: const Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const Storage()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.arrow_up_arrow_down),
                    ),
                  ),
                  title: const Text(
                    "Storage and Data",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  horizontalTitleGap: 30,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => const About()));
                  },
                  leading: Ink(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(CupertinoIcons.info),
                    ),
                  ),
                  title: const Text(
                    "About",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const CupertinoListTileChevron()),
            ),
          ],
        ),
      ),
    );
  }
}
