import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileUser> fetchUserProfile(String userId);
  Future<void> updateUserProfile(String userId, ProfileUser profileData);
}