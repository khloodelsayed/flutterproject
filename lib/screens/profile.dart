import 'package:competition_project/items.dart';
import 'package:flutter/material.dart';
import 'package:competition_project/models/user_model.dart';  // Import the user model

class ProfilePage extends StatefulWidget {
  final UserModel user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    user = widget.user; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "ميزان",
          style: TextStyle(fontFamily: "ReemKufi", fontSize: 40),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: kPrimaryColor3,
            borderRadius: BorderRadius.circular(30),
          ),
          width: 320,
          height: 550,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/slogan.gif'),
              ),
              const SizedBox(height: 20),
              Text(
                user.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                user.email,
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '${user.salary}',
                        style: const  TextStyle(
                            fontFamily: "Handjet",
                            fontSize: 20,
                          ),
                      ),
                      const Text('الراتب الشهرى',style: TextStyle(
                    fontFamily: "Handjet",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${user.bank }',
                        style: const  TextStyle(
                            fontFamily: "Handjet",
                            fontSize: 20,
                          ),
                      ),
                      const Text('الحساب البنكى',style: TextStyle(
                    fontFamily: "Handjet",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _showEditDialog(context);
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor2,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text('تعديل ',style: TextStyle(
                    fontFamily: "Handjet",
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final salaryController = TextEditingController(text: '${user.salary}');
    final bankController = TextEditingController(text: '${user.bank}');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تعديل البيانات الشخصية'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'اسم المستخدم'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
                ),
                TextField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'الراتب الشهرى'),
                ),
                TextField(
                  controller: bankController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'الحساب البنكى'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  user.name = nameController.text;
                  user.email = emailController.text;
                  user.salary = int.tryParse(salaryController.text) ?? 0;
                  user.bank = int.tryParse(bankController.text) ?? 0;
                });
                Navigator.pop(context);
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }
}
