import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
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
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CupertinoListSection.insetGrouped(
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                header: const Text(
                  "     STORAGE",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
                ),
                children: const [
                  CupertinoListTile.notched(
                      title: Text(
                        "Manage Storage",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: CupertinoListTileChevron()),
                ]),
            CupertinoListSection.insetGrouped(
              header: const Text(
                "     NETWORK",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: [
                const CupertinoListTile.notched(
                  title: Text(
                    "Network Usage",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: const Text(
                    "Use Less Data for Calls",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: CupertinoSwitch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: const Text(
                "     MEDIA AUTO-DOWNLOAD",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              footer: const Text(
                "     Voice Messages are always automatically\n     downloaded.",
                style: TextStyle(
                    fontSize: 15, color: Color.fromRGBO(108, 121, 129, 1)),
              ),
              backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
              children: const [
                CupertinoListTile.notched(
                  title: Text(
                    "Photos",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Wi-Fi and Cellular"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Audio",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Wi-Fi"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Video",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Wi-Fi"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Documents",
                    style: TextStyle(color: Colors.white),
                  ),
                  additionalInfo: Text("Wi-Fi"),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile.notched(
                  title: Text(
                    "Reset Auto-Download Settings",
                    style: TextStyle(
                      color: Color.fromRGBO(108, 121, 129, 1),
                    ),
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
