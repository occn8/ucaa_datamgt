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
}
