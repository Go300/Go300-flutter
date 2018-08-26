class Member {
  String token;
  String username;

  Member({this.username, this.token});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      token: json["token"],
      username: json["username"],
    );
  }
}