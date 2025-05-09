class UserModel {
  int? id;
  String name;
  String email;
  int salary;
  int bank;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.salary,
    required this.bank,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'salary': salary,
      'bank': bank,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      salary: map['salary'],
      bank: map['bank'],
    );
  }
}
