class Journal {
  int id;

  String title;
  String dat;
  String dQuery;

  String desc;

  Journal(this.id, this.title, this.dat, this.dQuery, this.desc);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'dat': dat,
      'dQuery': dQuery,
      'desc': desc
    };
    return map;
  }

  Journal.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    dat = map['dat'];
    dQuery = map['dQuery'];
    desc = map['desc'];
  }
}
