import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Account extends StatelessWidget {
  const Account({super.key});
  final username = null;

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        StreamUserAvatar(
                          user: StreamChat.of(context).currentUser!,
                          borderRadius: BorderRadius.circular(50),
                          constraints: const BoxConstraints.expand(
                              height: 60, width: 60),
                          showOnlineStatus: false,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                            "Enter your name and add an optional\nprofile picture",
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                    CupertinoButton(
                        onPressed: () {}, child: const Text("Edit")),
                    const Divider(),
                    CupertinoTextFormFieldRow(
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.bottom,
                      initialValue: StreamChat.of(context).currentUser!.name,
                      controller: username,
                      onFieldSubmitted: (value) {
                        StreamChat.of(context).client.partialUpdateUser(
                            StreamChat.of(context).currentUser!.id,
                            set: <String, Object?>{'name': value});
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "    ABOUT",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: () {},
              child: const Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
