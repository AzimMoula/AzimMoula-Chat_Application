import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _username = TextEditingController.fromValue(
        TextEditingValue(
            text: StreamChat.of(context)
                .currentUser!
                .extraData['name']
                .toString()));
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white)),
        title: const Text("Edit Profile"),
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
                      controller: _username,
                      onEditingComplete: () {
                        StreamChat.of(context).client.partialUpdateUser(
                          StreamChat.of(context).currentUser!.id,
                          set: <String, Object?>{'name': _username.text},
                        );
                        
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
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const Description()));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StreamChat.of(context)
                          .currentUser!
                          .extraData['description']
                          .toString()),
                      const CupertinoListTileChevron()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

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
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            initialValue: StreamChat.of(context)
                .currentUser!
                .extraData['description']
                .toString(),
            maxLength: 139,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ));
  }
}
