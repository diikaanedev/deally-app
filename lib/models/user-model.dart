class UserModel {
  final int id;
  final String token;
  final String? username;
  final String phone;

  const UserModel(
      {this.username,
      required this.id,
      required this.phone,
      required this.token});

  static UserModel fromObject(dynamic item) {
    return UserModel(
        id: item['user']['id'],
        phone: item['user']['email'],
        token: item['jwt']);
  }
}
