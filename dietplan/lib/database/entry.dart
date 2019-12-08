class Entry {
  int id;
  int icon;
  int calc;
  int type;
  String time;
  String dmy;

  Entry(this.id, this.icon, this.calc, this.type, this.time, this.dmy);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'icon': icon,
      'calc': calc,
      'type': type,
      'time': time,
      'dmy': dmy,
    };

    print("map");

    print(map);

    return map;
  }

  Entry.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    icon = map['name'];
    calc = map['calc'];
    type = map['type'];
    time = map['time'];
    dmy = map['dmy'];
  }

  @override
  String toString() {
    return 'Entry{id: $id, icon: $icon, calc: $calc, type: $type, time: $time, dmy: $dmy}';
  }
}
