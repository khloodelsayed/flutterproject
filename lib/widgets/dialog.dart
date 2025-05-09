import 'package:competition_project/items.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final String text;
  const MyDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/logo (2).png"),
            ),
          ],
        ),

        SizedBox(height: 10),
        Container(
          width: 350,
          height: 80,
          decoration: BoxDecoration(
            color: kPrimaryColor2,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              bottomEnd: Radius.circular(20),
              bottomStart: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontFamily: "Lemonada", fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
