import 'package:competition_project/items.dart';
import 'package:competition_project/widgets/Expenses_cards.dart';
import 'package:competition_project/widgets/dialog.dart';
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  final int salary;  
  final int bank;    

  const Expenses({super.key, required this.salary, required this.bank});

  @override
  Widget build(BuildContext context) {
    double basicExpenses = salary * 0.50;  
    double personalExpenses = salary * 0.30;  
    double savings = salary * 0.20;  

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
          MyDialog(text: 'في هذة الصفحة يتم عرض افضل نسبة لتنظيم مصروفات من خلال مرتبك'),
          SizedBox(height: 40),
          Container(
            width: 200,
            height: 80,
            decoration: BoxDecoration(color: kPrimaryColor4, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "$salary",
                style: TextStyle(color: Colors.white, fontFamily: "Handjet", fontSize: 30),
              ),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BudgetCategoryCard(
                  title: 'مصروفاتك الاساسية الثابتة',
                  percentage: 50,
                  amount: basicExpenses, 
                  details: [
                    DetailItem(image: "assets/images/l1.png", label: "فواتير الكهرباء والمياه"),
                    DetailItem(image: "assets/images/l2.png", label: " مصاريف التعليم"),
                    DetailItem(image: "assets/images/l3.png", label: " الرعاية الصحية"),
                    DetailItem(image: "assets/images/l4.png", label: " النقل"),
                    DetailItem(image: "assets/images/l44.png", label: " الاتصالات"),
                  ],
                ),
                BudgetCategoryCard(
                  title: 'مصروفاتك الشخصية المتغيرة',
                  percentage: 30,
                  amount: personalExpenses,  
                  details: [
                    DetailItem(image: "assets/images/l4.png", label: "التسوق"),
                    DetailItem(image: "assets/images/l5.png", label: "الأنشطة الترفيهية"),
                    DetailItem(image: "assets/images/l7.png", label: "الرحلات"),
                    DetailItem(image: "assets/images/l8.png", label: " الهدايا"),
                  ],
                ),
                BudgetCategoryCard(
                  title: 'الادخارات و الاستثمارات',
                  percentage: 20,
                  amount: savings,  
                  details: [
                    DetailItem(image: "assets/images/l9.png", label: "زيادة المدخرات"),
                    DetailItem(image: "assets/images/l10.png", label: "تعجيل سداد الديون"),
                    DetailItem(image: "assets/images/l10.png", label: "حالات الطوارئ"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
