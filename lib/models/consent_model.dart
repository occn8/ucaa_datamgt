class ConsentModel {
  String id;

  String name;
  String nameParent;
  String phone;
  String approval;
  String date;
  String created;
  String modified;

  ConsentModel(
    this.approval,
    this.date,
    this.created,
    this.id,
    this.modified,
    this.name,
    this.nameParent,
    this.phone,
  );

  void fromMap(String idd, Map map) {
    id = idd;
    name = map["name"];
    nameParent = map["nameParent"];
    phone = map["phone"];
    approval = map["approval"];
    date = map["date"];
    created = map["created"];
    modified = map["modified"];
  }
}
