// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:csi_stream/screens/cam.dart';
import 'package:csi_stream/screens/chat.dart';
import 'package:csi_stream/screens/search.dart';
import 'package:csi_stream/screens/settings.dart';
import 'package:csi_stream/widgets/custom_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var appBarHeight = AppBar().preferredSize.height;
  final TextEditingController _channelname = TextEditingController();
  final TextEditingController _searchdata = TextEditingController();
  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  final List members = [];
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    channelStateSort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => showModalBottomSheet(
                // isScrollControlled: true,
                backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(31, 44, 52, 1)),
                              ),
                              onPressed: () => showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor:
                                        const Color.fromRGBO(18, 27, 34, 1),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        child: Center(
                                          child: StreamUserListView(
                                              onUserTap: (User user) async {
                                                final channel =
                                                    StreamChat.of(context)
                                                        .client
                                                        .channel('messaging',
                                                            extraData: {
                                                      'members': [
                                                        user.id,
                                                        StreamChat.of(context)
                                                            .currentUser!
                                                            .id,
                                                      ]
                                                    });
                                                await channel.watch();
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              controller:
                                                  StreamUserListController(
                                                client: StreamChat.of(context)
                                                    .client,
                                                filter: Filter.and(
                                                  [
                                                    Filter.notEqual(
                                                        'id',
                                                        StreamChat.of(context)
                                                            .currentUser!
                                                            .id)
                                                  ],
                                                ),
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("New Chat"),
                              )),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(31, 44, 52, 1)),
                              ),
                              onPressed: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor:
                                      const Color.fromRGBO(18, 27, 34, 1),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          CustomTextInput(
                                              controller: _channelname,
                                              icon: const Icon(
                                                Icons.group_outlined,
                                                color: Colors.white,
                                              ),
                                              isObscure: false,
                                              hint: "Enter a channel name"),
                                          const SizedBox(height: 15),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color.fromRGBO(
                                                            31, 44, 52, 1)),
                                              ),
                                              onPressed: () =>
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            18, 27, 34, 1),
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    builder:
                                                        (BuildContext context) {
                                                      return SizedBox(
                                                        child: Center(
                                                          child:
                                                              StreamUserListView(
                                                                  onUserTap:
                                                                      (User
                                                                          user) {
                                                                    members.add(
                                                                        user.id);
                                                                  },
                                                                  controller:
                                                                      StreamUserListController(
                                                                    client: StreamChat.of(
                                                                            context)
                                                                        .client,
                                                                    filter:
                                                                        Filter
                                                                            .and(
                                                                      [
                                                                        Filter.notEqual(
                                                                            'id',
                                                                            StreamChat.of(context).currentUser!.id)
                                                                      ],
                                                                    ),
                                                                  )),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text("Select members"),
                                              )),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color.fromRGBO(
                                                            31, 44, 52, 1)),
                                              ),
                                              onPressed: () async {
                                                members.add(
                                                  StreamChat.of(context)
                                                      .currentUser!
                                                      .id,
                                                );
                                                final channel =
                                                    StreamChat.of(context)
                                                        .client
                                                        .channel('messaging',
                                                            extraData: {
                                                      'name': _channelname.text,
                                                      'members': members
                                                    });
                                                await channel.watch();
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text("Create"),
                                              )),
                                        ],
                                      ),
                                    );
                                  }),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("New Group"),
                              )),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(31, 44, 52, 1)),
                              ),
                              onPressed: () async {
                                members.add(
                                  StreamChat.of(context).currentUser!.id,
                                );
                                final channel = StreamChat.of(context)
                                    .client
                                    .channel('messaging',
                                        extraData: {'members': members});
                                await channel.watch();
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Cancel"),
                              )),
                        ],
                      ),
                    ),
                  );
                }),
            backgroundColor: const Color.fromRGBO(0, 168, 132, 1),
            child: const Icon(
              Icons.chat,
              color: Colors.black,
            ),
          ),
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            shadowColor: const Color.fromRGBO(31, 44, 52, 1),
            title: const Text(
              'WhatsApp',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const CameraApp(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
                          child: FractionallySizedBox(
                            // widthFactor: 0.98,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SearchBar(
                                      controller: _searchdata,
                                      hintText: "Search",
                                      onSubmitted: (value) =>
                                          Navigator.of(context).push(
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  StreamMessageSearchPage(
                                                searchinfo: _searchdata.text,
                                                client: StreamChat.of(context)
                                                    .client,
                                              ),
                                            ),
                                          )),
                                  const SizedBox(height: 15),
                                  IconButton(
                                    onPressed: () {
                                      if (_searchdata.text != '') {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                StreamMessageSearchPage(
                                              searchinfo: _searchdata.text,
                                              client:
                                                  StreamChat.of(context).client,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  )),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Settings') {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
                color: const Color.fromRGBO(31, 44, 52, 1),
                offset: Offset(0.0, appBarHeight),
                itemBuilder: (BuildContext context) {
                  return {
                    'New group',
                    'New broadcast',
                    'Starred messages',
                    'Settings'
                  }.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList();
                },
              )
            ],
            bottom: const TabBar(
              dividerColor: Color.fromRGBO(31, 44, 52, 1),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color.fromRGBO(0, 168, 132, 1),
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.groups_rounded,
                    size: 30,
                  ),
                ),
                Tab(
                  child: Text(
                    "Chats",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Updates",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Calls",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(18, 27, 34, 1),
          body: TabBarView(
            children: <Widget>[
              const Center(
                child: Text(
                  "Community",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: _refresh,
                child: StreamChannelListView(
                  controller: _listController,
                  onChannelLongPress: (channel) => showChannelInfoBottomSheet(
                      backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
                      context: context,
                      channel: channel),
                  // },
                  onChannelTap: (channel) {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return StreamChannel(
                            channel: channel,
                            child: Chat(channel: channel),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const Center(
                child: Text(
                  "Updates",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListView(
                children: [
                  ListTile(
                      onTap: () {},
                      title: const Text('Create call link',
                          style: TextStyle(color: Colors.white)),
                      subtitle: const Text(
                          "Share a link for your WhatsApp call",
                          style: TextStyle(
                              color: Color.fromRGBO(108, 121, 129, 1))),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 168, 132, 1),
                        child: IconButton.filled(
                          onPressed: null,
                          icon: Icon(
                            Icons.link,
                            color: Colors.black,
                          ),
                          color: Color.fromRGBO(0, 168, 132, 1),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
