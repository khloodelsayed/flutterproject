import 'package:competition_project/items.dart';
import 'package:competition_project/widgets/dialog.dart';
import 'package:flutter/material.dart';

class Installment extends StatefulWidget {
  const Installment({super.key});

  @override
  _InstallmentState createState() => _InstallmentState();
}

class _InstallmentState extends State<Installment> {
  List<Map<String, String>> installments = [];

  void showAddInstallmentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String amount = '';
        String date = '';
        String notes = '';
        return AlertDialog(
          title: Text('أضف قسط'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'القسط'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'التاريخ'),
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  date = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'الملاحظات'),
                onChanged: (value) {
                  notes = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  installments.add({
                    'amount': amount,
                    'date': date,
                    'notes': notes,
                  });
                });
                Navigator.pop(context); 
              },
              child: Text('إضافة'),
            ),
          ],
        );
      },
    );
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
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          MyDialog(
            text: 'في هذة الغرفه يتم عرض او اضافه او حذف الاقساط الملتزم بها حاليا',
          ),
          SizedBox(height: 20), 
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                installments.isEmpty
                    ? Text(
                        "لاتوجد اقساط بعد",
                        style: TextStyle(
                          color: kPrimaryColor3,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lemonada",
                        ),
                      )
                    : Align(
                        alignment: Alignment.topCenter, 
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('القسط')),
                                DataColumn(label: Text('التاريخ')),
                                DataColumn(label: Text('الملاحظات')),
                              ],
                              rows: installments.map((installment) {
                                return DataRow(cells: [
                                  DataCell(Text(installment['amount'] ?? '')),
                                  DataCell(Text(installment['date'] ?? '')),
                                  DataCell(Text(installment['notes'] ?? '')),
                                ]);
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                if (installments.isEmpty)
                  Center(
                    child: Container(
                      height: 420,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/images/no quest.gif"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20), 
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddInstallmentDialog,
        backgroundColor: kPrimaryColor3,
        child: Icon(Icons.add),
      ),
    );
  }
}
