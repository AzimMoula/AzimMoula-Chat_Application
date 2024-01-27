import 'package:csi_stream/screens/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final TextEditingController _message = TextEditingController();
  var appBarHeight = AppBar().preferredSize.height;
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
            onPressed: () {},
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
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
              PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                  color: const Color.fromRGBO(31, 44, 52, 1),
                  // iconColor: Colors.white,
                  offset: Offset(0.0, appBarHeight),
                  // onSelected: handleClick,
                  itemBuilder: (BuildContext context) {
                    return {
                      'New group',
                      'New broadcast',
                      'Linked devices',
                      'Starred messages',
                      'Payments',
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
                  })
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
              StreamChannelListView(
                controller: _listController,
                onChannelTap: (channel) {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) {
                        return StreamChannel(
                          channel: channel,
                          child: const Chat(),
                        );
                      },
                    ),
                  );
                },
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
