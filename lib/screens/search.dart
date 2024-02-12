import 'package:csi_stream/screens/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamMessageSearchPage extends StatefulWidget {
  const StreamMessageSearchPage({
    super.key,
    required this.searchinfo,
    required this.client,
  });

  final String searchinfo;
  final StreamChatClient client;

  @override
  State<StreamMessageSearchPage> createState() => _StreamMessageSearchState();
}

class _StreamMessageSearchState extends State<StreamMessageSearchPage> {
  late final _controller = StreamMessageSearchListController(
    client: widget.client,
    limit: 20,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    searchQuery: widget.searchinfo,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              )),
          backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
          title: Text(
            'Searching for \'${widget.searchinfo}\'',
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: StreamMessageSearchListView(
          controller: _controller,
          onMessageTap: (response) {
            final channel = StreamChat.of(context)
                .client
                .channel('messaging', id: response.channel!.id);
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
      );
}
