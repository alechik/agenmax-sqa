class UserModel {
  String? idUser;
  String username;
  String email;

  UserModel({this.idUser, required this.username, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'username': username,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idUser: map['id_user'],
      username: map['username'],
      email: map['email'],
    );
  }
}
