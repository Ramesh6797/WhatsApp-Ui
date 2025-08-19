class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profilePic;
  final String lastSeen;
  final bool isOnline;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePic,
    required this.lastSeen,
    required this.isOnline,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'lastSeen': lastSeen,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePic: map['profilePic'] ?? '',
      lastSeen: map['lastSeen'] ?? '',
      isOnline: map['isOnline'] ?? false,
    );
  }
}
