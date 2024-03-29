import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:wp/CustomUI/ButtonCard.dart';
import 'package:wp/CustomUI/ContactCard.dart';
import 'package:wp/Model/ChatModel.dart';

import '../CustomUI/AvtarCard.dart';
//import 'package:wp/Model/ContactModel.dart';

// ignore: camel_case_types
class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Harini", status: "Student"),
    ChatModel(name: "Bhuvana", status: "Loosu"),
    ChatModel(name: "Keerthana", status: "Incredibly patience"),
    ChatModel(name: "Kishor", status: "Mental"),
    ChatModel(name: "Lavanya", status: "Best Friend"),
    ChatModel(name: "Shivani", status: "My sister"),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context, index) {
                if(index == 0){
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index-1].select == true) {
                      setState(() {
                        groups.remove(contacts[index-1]);
                        contacts[index-1].select = false;
                        
                      });
                    } else {
                      setState(() {
                        groups.add(contacts[index-1]);
                        contacts[index-1].select = true;
                      });
                    }
                  },
                  child: ContactCard(contact: contacts[index-1]),

                );
              }),
          groups.length > 0 ? Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: ((context, index) 
                  {
                    if(contacts[index].select == true){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            groups.remove(contacts[index-1]);
                            contacts[index-1].select = false;
                          });
                        },
                        child: AvtarCard(
                          contact: contacts[index],
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  } 
                  ),
                ),
                
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ):Container(),
        ],
      ),
    );
  }
}
