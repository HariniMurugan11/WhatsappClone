import 'package:flutter/material.dart';

import '../CustomUI/CustomCard.dart';
import '../Model/ChatModel.dart';
import '../Screen/selectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats=[
    ChatModel(
      name: "Harini",
      time: "11:23",
      icon: "person.svg",
      isGroup: false,
      currentMsg: "Hi harini",
    ),
    ChatModel(
      name: "Family & Friends",
      time: "11:20",
      icon: "groups.svg",
      isGroup: true,
      currentMsg: "Hello everyone",
    ),
    ChatModel(
      name: "Kishor",
      time: "10:23",
      icon: "person.svg",
      isGroup: false,
      currentMsg: "eh kishor",
    ),
    ChatModel(
      name: "School grp",
      time: "1:23",
      icon: "groups.svg",
      isGroup: true,
      currentMsg: "Welcome guys",
    ),
    ChatModel(
      name: "Lavanya",
      time: "3:34",
      icon: "person.svg",
      isGroup: false,
      currentMsg: "Completed ?",
    ),
    ChatModel(
      name: "School grp",
      time: "1:23",
      icon: "groups.svg",
      isGroup: true,
      currentMsg: "Welcome guys",
    ),
    ChatModel(
      name: "Family",
      time: "1:23",
      icon: "groups.svg",
      isGroup: true,
      currentMsg: "Good Morning!!",
    ),
    ChatModel(
      name: "Fasika",
      time: "1:23",
      icon: "person.svg",
      isGroup: false,
      currentMsg: "hiii",
    ),
    ChatModel(
      name: "Bhuvanaa",
      time: "2:09",
      icon: "person.svg",
      isGroup: false,
      currentMsg: "hello",
    ),
    ChatModel(
      name: "CSE Kingdom",
      time: "11:23",
      icon: "groups.svg",
      isGroup: true,
      currentMsg: "Welcome guys",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>selectContact()));
        },
        child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: chats[index],
          ),
          ),
    );
  }
}