class InstallmentModel {
  final int? id;
  final int amount;
  final String date;
  final String notes;

  InstallmentModel({
    this.id,
    required this.amount,
    required this.date,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'notes': notes,
    };
  }

  factory InstallmentModel.fromMap(Map<String, dynamic> map) {
    return InstallmentModel(
      id: map['id'],
      amount: map['amount'],
      date: map['date'],
      notes: map['notes'],
    );
  }
}