// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  late String name;
  late String email;
  late String uid;

  UserModel(this.name, this.email, this.uid);

  UserModel.fromJson(var user) {
    name = user['name'];
    email = user['e-mail'];
    uid = user['uid'];
  }
}
