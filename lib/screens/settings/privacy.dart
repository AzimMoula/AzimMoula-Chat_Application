// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  bool _value = false;

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
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1).withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CupertinoListSection.insetGrouped(
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: const [
                CupertinoListTile.notched(
                  title: Text(
                    "Last Seen & Online",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Everyone"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Profile Photo",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Everyone"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "About",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Everyone"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Groups",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Everyone"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Status",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("0 Selected"),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                footer: const Text(
                  "     List of chats where you are sharing your\n     live location",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                children: const [
                  CupertinoListTile.notched(
                    title: Text(
                      "Live Location",
                      style: TextStyle(color: Colors.white),
                    ),
                    additionalInfo: Text("None"),
                    trailing: CupertinoListTileChevron(),
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                children: [
                  CupertinoListTile.notched(
                    title: const Text(
                      "Silence Unknown Callers",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoSwitch(
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                footer: const Text(
                  "     List of contacts you have blocked.",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                children: const [
                  CupertinoListTile.notched(
                    title: Text(
                      "Blocked",
                      style: TextStyle(color: Colors.white),
                    ),
                    additionalInfo: Text("None"),
                    trailing: CupertinoListTileChevron(),
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                children: const [
                  CupertinoListTile.notched(
                    title: Text(
                      "Screen Lock",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: CupertinoListTileChevron(),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
