class Usr {
  String id;
  String email;
  String userName;
  String role;
  int status;
  String created;
  Usr(this.id, this.email, this.userName, this.role, this.status, this.created);

  void fromMap(String idd, Map map) {
    id = idd;
    email = map["email"];
    userName = map["userName"];
    role = map["role"];
    status = map["status"];
    created = map["created"];
  }
}
