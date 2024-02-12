import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool _value1 = false;
  bool _value2 = false;

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
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                children: const [
                  CupertinoListTile.notched(
                    title: Text(
                      "Chat Wallpaper",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoListTileChevron(),
                  ),
                ]),
            CupertinoListSection.insetGrouped(
                footer: const Text(
                  "     Automatically save photos and videos you receive\n     to your iPhone's Camera Roll",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                children: [
                  CupertinoListTile.notched(
                    title: const Text(
                      "Save to Camera Roll",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoSwitch(
                      value: _value1,
                      onChanged: (bool value) {
                        setState(() {
                          _value1 = value;
                        });
                      },
                    ),
                  ),
                ]),
            CupertinoListSection.insetGrouped(
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: const [
                CupertinoListTile.notched(
                  title: Text(
                    "Chat Backup",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Export Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                children: [
                  CupertinoListTile.notched(
                    title: const Text(
                      "Keep Chats Archived",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoSwitch(
                        value: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = value;
                          });
                        }),
                  ),
                ]),
            CupertinoListSection.insetGrouped(
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: const [
                CupertinoListTile.notched(
                  title: Text(
                    "Archive All Chats",
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Clear All Chats",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Delete All Chats",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
