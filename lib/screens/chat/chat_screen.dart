import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/chat/components/chat_text_field.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat With Ali"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView(
              shrinkWrap: false,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SelectableRegion(
                  focusNode: FocusNode(),
                  selectionControls: materialTextSelectionControls,
                  child: const BubbleSpecialThree(
                    text: 'Added iMessage shape bubbles',
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const BubbleSpecialThree(
                  text: "Thanks",
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  isSender: false,
                ),
              ],
            ),
          ),
          const Spacer(),
          ChatTextField(content: "message", controller: chatController),
          SizedBox(height: context.getHeight(factor: 0.015)),
        ],
      ),
    );
  }
}
