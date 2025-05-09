import 'package:competition_project/items.dart';
import 'package:flutter/material.dart';

class DetailItem {
  final String image;
  final String label;

  DetailItem({required this.image, required this.label});
}

class BudgetCategoryCard extends StatelessWidget {
  final String title;
  final double percentage;
  final double amount;
  final List<DetailItem> details;
  final Color percentageColor;

  const BudgetCategoryCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.amount,
    required this.details,
    this.percentageColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kPrimaryColor3),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "ReemKufi",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 6,
                  backgroundColor: kPrimaryColor2,
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor3),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${percentage.toStringAsFixed(1)}%",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Text(
                    "${amount.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            children: [
              for (var item in details)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage(item.image),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.label,
                          style: TextStyle(
                            fontFamily: "Lemonada",
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
