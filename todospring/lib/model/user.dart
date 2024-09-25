class User{
   int? uid;
  String? userName;
  String? email;
  String? password;
  User();
  User.data(this.uid, this.userName, this.email, this.password);

  // User.fromJson(Map<String, dynamic> json) {
  //   uid = json['uid'];
  //   userName = json['userName'];
  //   email = json['email'];
  //   password = json['password'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['uid'] = this.uid;
  //   data['userName'] = this.userName;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   return data;
  // }
}