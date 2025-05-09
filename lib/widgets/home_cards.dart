import 'package:flutter/material.dart';
import 'package:competition_project/items.dart';

class HomeCardTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onPressed;

  const HomeCardTile({
    super.key,
    required this.title,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor3,
        minimumSize: Size(400, 100),
        padding: EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.pink.shade100,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Handjet",
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
