class UserModel {
  String? email;
  String? fullName;
  String? uid;

  UserModel({this.email, this.fullName, this.uid});

  //date to server
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'uid': uid,
    }; 
  }

  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      fullName: map['fullName'],
      uid: map['uid'],
    );
  }
}
