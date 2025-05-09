import 'dart:developer';
import 'package:competition_project/database/database.dart';
import 'package:competition_project/items.dart';
import 'package:competition_project/models/user_model.dart';
import 'package:competition_project/screens/home_page.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  bool isSalarySecure = true;
  bool isBankSecure = true;
  String? selectedcountry;
  UserModel? user;
  List<UserModel> users = [];

  insert() async {
    await SqlHelper().insertUser(user!);
    getData();
  }

  Future<void> getData() async {
    users = await SqlHelper().getUsers();
    setState(() {});
  }

  delete(int id) async {
    await SqlHelper().deleteUser(id);
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "ميزان",
          style: TextStyle(
            fontFamily: "Lemonada",
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.gif", width: 200, height: 200),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال البيانات في هذا المكان";
                  }
                },
                decoration: InputDecoration(
                  labelText: "الاسم الكامل",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ReadexPro",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال البيانات في هذا المكان";
                  }
                },
                decoration: InputDecoration(
                  labelText: "البريد الالكتروني",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ReadexPro",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                obscureText: isSalarySecure,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال رقم في هذا المكان";
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSalarySecure = !isSalarySecure;
                      });
                    },
                    child: Icon(
                      isSalarySecure
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                    ),
                  ),
                  labelText: "الدخل الشهري",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ReadexPro",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: bankController,
                obscureText: isBankSecure,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال رقم في هذا المكان";
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isBankSecure = !isBankSecure;
                      });
                    },
                    child: Icon(
                      isBankSecure
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                    ),
                  ),
                  labelText: "الرصيد في البنك",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ReadexPro",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 100,
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(color: Colors.white),
                      child: DropdownButtonFormField<String>(
                        value: selectedcountry,
                        items: items1.map((item) {
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
                            selectedcountry = value;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "اختر دولتك",
                      style: TextStyle(
                        fontFamily: "ReadexPro",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    int? salary = int.tryParse(salaryController.text);
                    int? bank = int.tryParse(bankController.text);

                    if (salary != null && bank != null) {
                      log("الاسم: ${nameController.text}");
                      log("البريد الالكتروني: ${emailController.text}");
                      log("الدخل الشهري: $salary");
                      log("الرصيد في البنك: $bank");

                      user = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        salary: salary,
                        bank: bank,
                      );

                      insert();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تم تسجيل البيانات بنجاح!")),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(user: user!),
                        ),
                      );
                    } else {
                      log("يرجى إدخال أرقام صحيحة للدخل الشهري ورصيد البنك");
                    }
                  }
                },
                height: 50,
                minWidth: 200,
                color: kPrimaryColor3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "تسجيل دخول",
                  style: TextStyle(
                    fontFamily: "Handjet",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
