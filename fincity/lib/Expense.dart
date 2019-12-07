class Expense {
  int id;
  String name;
  int type;
  int amount;
  int day;
  int month;
  int year;

  Expense(this.id, this.name, this.type, this.amount, this.day, this.month,
      this.year);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'amount': amount,
      'day': day,
      'month': month,
      'year': year
    };
    return map;
  }

  Expense.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    type = map['type'];
    amount = map['amount'];
    day = map['day'];
    month = map['month'];
    year = map['year'];
  }

  @override
  String toString() {
    return 'Expense{id: $id, name: $name, type: $type, amount: $amount, day: $day, month: $month, year: $year}';
  }
}
