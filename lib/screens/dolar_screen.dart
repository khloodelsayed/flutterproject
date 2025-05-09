import 'package:competition_project/items.dart';
import 'package:competition_project/widgets/dialog.dart';
import 'package:flutter/material.dart';

class DolarScreen extends StatefulWidget {
  const DolarScreen({super.key});

  @override
  State<DolarScreen> createState() => _DolarScreenState();
}

class _DolarScreenState extends State<DolarScreen> {
  String? selectedcoin;
  double enteredAmount = 0.0;
  double convertedAmount = 0.0;

  Map<String, double> moneyFelow = {
    'Egypt (EGP)': 48.44,
    'Saudi Arabia (SAR)': 3.75,
    'UAE (AED)': 3.67,
    'Bahrain (BHD)': 0.3770,
    'Kuwait (KWD)': 0.31,
    'Qatar (QAR)': 3.65,
    'Tunisia (TND)': 3.04,
    'Syria (SYP)': 14750,
    'Algeria (DZD)': 132.50,
    'Palestine (ILS)': 3.65,
    'Oman (OMR)': 0.39,
    'Sudan (SDG)': 601.50,
    'Lebanon (LBP)': 89500.00,
    'Libya (LYD)': 4.76,
    'Mauritania (MRU)': 39.73,
    'Iraq (IQD)': 1310.00,
    'Jordan (JOD)': 0.71,
    'Somalia (SOS)': 571,
    'Djibouti (DJF)': 177.94,
    'Comoros (KMF)': 443.55,
    'Morocco (MAD)': 9.72,
    'Germany (EUR)': 0.89,
    'Japan (JPY)': 143.28,
    'England (GBP)': 1.4847,
    'Switzerland (CHF)': 0.8435,
    'Australia (AUD)': 1.48,
  };
  void convertCurrency() {
    if (selectedcoin != null && enteredAmount > 0) {
      double exchangeRate = moneyFelow[selectedcoin] ?? 0.0;
      setState(() {
        convertedAmount = enteredAmount / exchangeRate;    
      });
    }
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyDialog(
            text: 'في هذه الغرفه يمكنك تحويل العملات الى قيمتها بالدولار الأمريكي',
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedcoin,
                    items: moneyFelow.keys.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Handjet",
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedcoin = value;
                      });
                    },
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "اختر العملة التي تريد تحويلها",
                  style: TextStyle(fontFamily: "Lemonada"),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 180,
            height: 45,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  enteredAmount = double.tryParse(value) ?? 0.0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ادخل المبلغ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: convertCurrency,
            minWidth: 120,
            height: 45,
            color: kPrimaryColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "تحويل",
              style: TextStyle(fontSize: 20, fontFamily: "ReadexPro"),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kPrimaryColor3)),
            child: Center(
              child: Text(
                convertedAmount == 0.0
                    ? " "
                    : "${selectedcoin != null ? selectedcoin! : ""}: ${convertedAmount.toStringAsFixed(2)} USD", 
                style: TextStyle(fontFamily: "ReadexPro", fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
