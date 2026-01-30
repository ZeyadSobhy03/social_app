import 'package:hive/hive.dart';

part 'profile_user_adapter.g.dart';

@HiveType(typeId: 0)
class ProfileUserAdapter extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String bio;
  @HiveField(4)
  String profileImage;

  ProfileUserAdapter({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.profileImage,
  });
}
