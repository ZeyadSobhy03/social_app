import 'package:social_app/presentation/auth/domain/entities/app_users.dart';

class ProfileUser extends AppUsers {
  final String bio;
  final String profileImage;

  ProfileUser({
    required super.email,
    required super.name,
    required super.id,
    required this.bio,
    required this.profileImage,
  });

  // update profile method

  ProfileUser copyWith({String? newBio, String? newProfileImage}) {
    return ProfileUser(
      bio: newBio ?? bio,
      profileImage: newProfileImage ?? profileImage,
      email: email,
      name: name,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bio': bio,
      'profileImage': profileImage,
    };
  }

  factory ProfileUser.fromMap(Map<String, dynamic> map) {
    return ProfileUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      profileImage: map['profileImage'] ?? '',
    );
  }
}
