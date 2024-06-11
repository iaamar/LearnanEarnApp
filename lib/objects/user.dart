class LAEUser {
  final String uid, name, email;
  final DateTime created;

  LAEUser({required this.uid,
    required this.name,
    required this.email,
    required this.created});

  LAEUser.fromJson(Map<String, Object?> json) :this(
    created: DateTime.fromMillisecondsSinceEpoch(json["created"]),
    uid: json["uid"].toString(),
    name: json["name"].toString(),
    email: json["email"].toString(),
  )

  @override
  String toString() {
    return 'Person(name: $name, email: $email, created: ${created
        .toIso8601String()})';
  }
}
