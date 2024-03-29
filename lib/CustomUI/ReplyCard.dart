import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 55
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(8)),
          //color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text("heyy",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text("1.13",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
