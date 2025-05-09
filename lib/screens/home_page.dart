import 'package:competition_project/items.dart';
import 'package:competition_project/models/user_model.dart';
import 'package:competition_project/screens/Installment.dart';
import 'package:competition_project/screens/dolar_screen.dart';
import 'package:competition_project/screens/expenses.dart';
import 'package:competition_project/screens/profile.dart';
import 'package:competition_project/widgets/dialog.dart';
import 'package:competition_project/widgets/home_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({
    super.key,
    required this.user,
  }); 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "ميزان",
          style: TextStyle(fontFamily: "ReemKufi", fontSize: 40),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyDialog(text: 'أهلاً بك في ميزان يا ${widget.user.name}'),
          SizedBox(height: 40),
          HomeCardTile(
            title: "حساب تحويل العملات الى الدولار",
            imagePath: "assets/images/dolar.png",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DolarScreen(); 
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          HomeCardTile(
            title: "عرض الاقساط و مواعيدها",
            imagePath: "assets/images/aqsat.jpg",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Installment(); 
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          HomeCardTile(
            title: "تنظيم المصروفات بالنسبة للدخل الشهري",
            imagePath: "assets/images/masrouf.png",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Expenses(
                      salary: widget.user.salary , 
                      bank: widget.user.bank,     
                    );
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          HomeCardTile(
            title: "البيانات الشخصية",
            imagePath: "assets/images/data.jpg",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(user: widget.user); 
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
