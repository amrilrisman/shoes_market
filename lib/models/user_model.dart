class UserModel {
  String name;
  String email;
  String username;
  String role;
  String photo;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.role,
    required this.photo,
  });

  factory UserModel.jsonObject(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'].toString(),
      email: json['email'].toString(),
      username: json['username'].toString(),
      role: json['roles'].toString(),
      photo: json['profile_photo_url'].toString(),
    );
  }
}
