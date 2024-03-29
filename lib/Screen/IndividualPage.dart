import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wp/CustomUI/OwnMsgCard.dart';
import 'package:wp/CustomUI/ReplyCard.dart';


import '../Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({required this.chatModel, super.key});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  

  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/whatsapp_Back.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Color(0xFF075E54),
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 37,
                        width: 37,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    )
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Last seen today at 10.00",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
                IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                PopupMenuButton<String>(onSelected: (value) {
                  print(value);
                }, itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("View Contact"),
                      value: "View Contact",
                    ),
                    PopupMenuItem(
                      child: Text("Media, links, and docs"),
                      value: "Media, links, and docs",
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value: "Search",
                    ),
                    PopupMenuItem(
                      child: Text("Mute notifications"),
                      value: "Mute notifications",
                    ),
                    PopupMenuItem(
                      child: Text("Disappearing messeges"),
                      value: "Disappearing messeges",
                    ),
                    PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: "Wallpaper",
                    ),
                  ];
                })
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-155,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                        OwnMsgCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                  margin:
                                      EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.next,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                        icon: Icon(Icons.emoji_emotions),
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (builder) => bottomSheet(),
                                              );
                                            },
                                            icon: Icon(Icons.attach_file),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.camera_alt),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 5, left: 2),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(width: 40,),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: 40,),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(width: 40,),
                  iconCreation(Icons.location_pin, Colors.green, "Location"),
                  SizedBox(width: 40,),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text ) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ), 
          SizedBox(height:5),
          Text(text, style:TextStyle(
            fontSize: 12,
          ),),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: ((category, emoji) {
        // ignore: unused_label
        rows:
        4;
        // ignore: unused_label
        columns:
        7;
        print(emoji);
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      }),
    );
  }
}
