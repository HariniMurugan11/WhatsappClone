import 'package:flutter/material.dart';
import 'package:wp/CustomUI/ButtonCard.dart';
import 'package:wp/CustomUI/ContactCard.dart';
import 'package:wp/Model/ChatModel.dart';
//import 'package:wp/Model/ContactModel.dart';
import 'package:wp/Screen/CreateGroup.dart';

// ignore: camel_case_types
class selectContact extends StatefulWidget {
  const selectContact({super.key});

  @override
  State<selectContact> createState() => _selectContactState();
}

class _selectContactState extends State<selectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Harini", status: "Student"),
      ChatModel(name: "Bhuvana", status: "Loosu"),
      ChatModel(name: "Keerthana", status: "Incredibly patience"),
      ChatModel(name: "Kishor", status: "Mental"),
      ChatModel(name: "Lavanya", status: "Best Friend"),
      ChatModel(name: "Shivani", status: "My sister"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "256 Contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 26,
            ),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contact"),
                value: "Contact",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            }
            return ContactCard(contact: contacts[index - 2]);
          }),
    );
  }
}
