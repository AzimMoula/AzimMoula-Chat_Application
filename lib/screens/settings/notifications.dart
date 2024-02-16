import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CupertinoListSection.insetGrouped(
              header: const Text(
                "     MESSAGE NOTIFICATIONS",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: [
                CupertinoListTile.notched(
                  title: const Text(
                    "Show Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoSwitch(
                    value: _value1,
                    onChanged: (value) {
                      setState(() {
                        _value1 = value;
                      });
                    },
                  ),
                ),
                const CupertinoListTile.notched(
                  title: Text(
                    "Sound",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Note"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: const Text(
                    "Reaction Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoSwitch(
                    value: _value2,
                    onChanged: (value) {
                      setState(() {
                        _value2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            CupertinoListSection.insetGrouped(
              header: const Text(
                "     GROUP NOTIFICATIONS",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: [
                CupertinoListTile.notched(
                  title: const Text(
                    "Show Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoSwitch(
                    value: _value3,
                    onChanged: (value) {
                      setState(() {
                        _value3 = value;
                      });
                    },
                  ),
                ),
                const CupertinoListTile.notched(
                  title: Text(
                    "Sound",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Note"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: const Text(
                    "Reaction Notifications",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoSwitch(
                    value: _value4,
                    onChanged: (value) {
                      setState(() {
                        _value4 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                footer: const Text(
                  "     Preview message text inside new message\n     notifications.",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                children: [
                  CupertinoListTile.notched(
                    title: const Text(
                      "Show Preview",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoSwitch(
                      value: _value5,
                      onChanged: (value) {
                        setState(() {
                          _value5 = value;
                        });
                      },
                    ),
                  ),
                ]),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                footer: const Text(
                  "     Reset all notification settings, including custom\n     notification settings for your chats.",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                children: const [
                  CupertinoListTile.notched(
                    title: Text(
                      "Reset Notification Settings",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
