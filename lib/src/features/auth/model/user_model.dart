class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "PhoneNo": phoneNo
    };
  }
}
